//
//  MainView.swift
//  StrongTestApp
//
//  Created by Akyl Mukatay  on 14.05.2023.
//

import UIKit
import SnapKit

protocol MainViewDelegate: AnyObject {
  func onViewEvent(_ event:MainViewEvent)
}

enum MainViewEvent {
  case selected(IndexPath)
  case open(Country)
}

class MainView: UIView {
  
  //MARK: Public
  weak var delegate: MainViewDelegate?
  
  func applySnapshot(sections: [CountriesSection]) {
    var snapshot = NSDiffableDataSourceSnapshot<CountriesSection, Country>()
    
    sections.forEach { section in
      snapshot.appendSections([section])
      snapshot.appendItems(section.items, toSection: section)
    }
    
    dataSource.apply(snapshot, animatingDifferences: false)
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    configureProperties()
    layout()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  //MARK: Private
  private var collectionView: UICollectionView! = nil
  private var dataSource: UICollectionViewDiffableDataSource<CountriesSection, Country>! = nil
  
  private func configureProperties() {
    backgroundColor = .systemBackground
    
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
    
    collectionView.register(CountryCell.self, forCellWithReuseIdentifier: "CellIdentifier")
    collectionView.register(CollectionHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "HeaderIdentifier")
    
    dataSource = UICollectionViewDiffableDataSource<CountriesSection, Country>(collectionView: collectionView) { (collectionView, indexPath, item) -> UICollectionViewCell? in
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellIdentifier", for: indexPath) as! CountryCell
      cell.configure(with: item)
      cell.didTapped = { [weak self] in
        self?.delegate?.onViewEvent(.selected(indexPath))
      }
      
      cell.didOpen = { [weak self] in
        self?.delegate?.onViewEvent(.open(item))
      }
      return cell
    }
    
    dataSource.supplementaryViewProvider = { [weak self] collectionView, kind, indexPath in
      guard let self = self else { return nil }
      
      if kind == UICollectionView.elementKindSectionHeader {
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "HeaderIdentifier", for: indexPath) as! CollectionHeaderView
        let section = self.dataSource.snapshot().sectionIdentifiers[indexPath.section]
        headerView.configure(with: section.headerTitle)
        return headerView
      }
      
      return nil
    }
    
    self.collectionView = collectionView
  }
  
  private func layout() {
    addSubview(collectionView)
    collectionView.snp.makeConstraints { $0.edges.equalTo(safeAreaLayoutGuide) }
  }
}

extension MainView {
  private func createLayout() -> UICollectionViewLayout {
    let layout = UICollectionViewCompositionalLayout { (_, _) -> NSCollectionLayoutSection? in
      let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(72))
      let item = NSCollectionLayoutItem(layoutSize: itemSize)
      
      let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(72))
      let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
      let section = NSCollectionLayoutSection(group: group)
      section.interGroupSpacing = 12
      section.contentInsets = NSDirectionalEdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16)
      
      let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(24))
      let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .topLeading)
      header.pinToVisibleBounds = true
      section.boundarySupplementaryItems = [header]
      
      return section
    }
    
    return layout
  }
}

