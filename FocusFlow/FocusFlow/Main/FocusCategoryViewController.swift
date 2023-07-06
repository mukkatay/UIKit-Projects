//
//  FocusCategoryViewController.swift
//  FocusFlow
//
//  Created by Akyl Mukatay  on 06.07.2023.
//

import UIKit
import SnapKit

class FocusCategoryViewController: UIViewController {
    
    // MARK: - Properties
    
    private let label: UILabel = {
        let label = UILabel()
        label.text = "Focus Category"
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.frame = CGRect(x: 0, y: 0, width: 111, height: 24)
        return label
    }()
    
    private let cancelIcon: UIImageView = {
        let icon = UIImageView(image: UIImage(named: "x"))
        return icon
    }()
    
    private let workButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Work", for: .normal)
        button.backgroundColor = .red
        button.addTarget(self, action: #selector(toggleWork), for: .touchUpInside)
        return button
    }()
    
    private let studyButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Study", for: .normal)
        button.backgroundColor = .green
        button.addTarget(self, action: #selector(toggleStudy), for: .touchUpInside)
        return button
    }()
    
    private let workoutButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Workout", for: .normal)
        button.backgroundColor = .black
        button.addTarget(self, action: #selector(toggleWorkout), for: .touchUpInside)
        return button
    }()
    
    private let readingButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Reading", for: .normal)
        button.backgroundColor = .blue
        button.addTarget(self, action: #selector(toggleReading), for: .touchUpInside)
        return button
    }()
    
    private let meditationButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Meditation", for: .normal)
        button.backgroundColor = .yellow
        button.addTarget(self, action: #selector(toggleMeditation), for: .touchUpInside)
        return button
    }()
    
    private let othersButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Others", for: .normal)
        button.backgroundColor = .orange
        button.addTarget(self, action: #selector(toggleOthers), for: .touchUpInside)
        return button
    }()

    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        configure()
    }
    
    // MARK: - Selectors
    
    @objc func cancelBottomSheet() {
        dismiss(animated: true)
    }
    
    @objc func toggleWork() {
        print("toggleWork tapped..")
    }
    
    @objc func toggleStudy() {
        print("toggleStudy tapped..")
    }
    
    @objc func toggleWorkout() {
        print("toggleWorkout tapped..")
    }
    
    @objc func toggleReading() {
        print("toggleReading tapped..")
    }
    
    @objc func toggleMeditation() {
        print("toggleMeditation tapped..")
    }
    
    @objc func toggleOthers() {
        print("toggleOthers tapped..")
    }
    
    // MARK: - Helpers
    
    func configure() {
        let headerStack = UIStackView(arrangedSubviews: [label, cancelIcon])
        view.addSubview(headerStack)
        
        headerStack.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
        }
        
        label.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(4)
            make.left.equalToSuperview().inset(140)
        }
        
        cancelIcon.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(20)
            make.bottom.equalToSuperview().inset(16)
            make.left.equalTo(label.snp.right)
            make.right.equalToSuperview().offset(16)
        }
        
        cancelIcon.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(cancelBottomSheet))
        cancelIcon.addGestureRecognizer(tap)
        
        let stack1 = UIStackView(arrangedSubviews: [workButton, workoutButton, meditationButton])
        let stack2 = UIStackView(arrangedSubviews: [studyButton, readingButton, othersButton])
        
        stack1.axis = .vertical
        stack2.axis = .vertical
        
        let stack = UIStackView(arrangedSubviews: [stack1, stack2])
        view.addSubview(stack)
        stack.snp.makeConstraints { make in
            make.top.equalTo(headerStack.snp.bottom).offset(24)
            make.left.right.equalToSuperview().offset(16)
        }
        
        stack1.snp.makeConstraints { make in
            make.width.equalTo(172)
            make.height.equalTo(220)
        }
        
        stack2.snp.makeConstraints { make in
            make.width.equalTo(172)
            make.height.equalTo(220)
        }
        
        workButton.snp.makeConstraints { make in
            make.width.equalTo(172)
            make.height.equalTo(60)
        }
        
        workoutButton.snp.makeConstraints { make in
            make.width.equalTo(172)
            make.height.equalTo(60)
            make.top.equalTo(workButton.snp.bottom).inset(-20)
        }
    }

}
