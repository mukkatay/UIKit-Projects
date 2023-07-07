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
        button.addTarget(self, action: #selector(toggleWork), for: .touchUpInside)
        //        button.addTarget(self, action: #selector(buttonPressed), for: .touchDown)
        return button
    }()
    
    private let studyButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Study", for: .normal)
        button.addTarget(self, action: #selector(toggleStudy), for: .touchUpInside)
        return button
    }()
    
    private let workoutButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Workout", for: .normal)
        button.addTarget(self, action: #selector(toggleWorkout), for: .touchUpInside)
        return button
    }()
    
    private let readingButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Reading", for: .normal)
        button.addTarget(self, action: #selector(toggleReading), for: .touchUpInside)
        return button
    }()
    
    private let meditationButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Meditation", for: .normal)
        button.addTarget(self, action: #selector(toggleMeditation), for: .touchUpInside)
        return button
    }()
    
    private let othersButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Others", for: .normal)
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
    
    @objc func toggleWork(sender: UIButton) {
        print("toggleWork tapped..")
    }
    
//    @objc func buttonPressed(sender: UIButton) {
//        sender.backgroundColor = UIColor.buttonColor
//    }
    
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
        
        headerStack.anchor(top: view.topAnchor,
                           left: view.leadingAnchor,
                           right: view.trailingAnchor,
                           paddingRight: 16)
        
        label.anchor(top: headerStack.topAnchor,
                     left: headerStack.leadingAnchor,
                     paddingTop: 4, paddingLeft: 140)
        
        cancelIcon.anchor(top: headerStack.topAnchor,
                          left: label.trailingAnchor,
                          bottom: headerStack.bottomAnchor,
                          paddingTop: 20,
                          paddingLeft: 84,
                          paddingBottom: 16)
        
        cancelIcon.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(cancelBottomSheet))
        cancelIcon.addGestureRecognizer(tap)
        
        let stack1 = UIStackView(arrangedSubviews: [workButton, workoutButton, meditationButton])
        let stack2 = UIStackView(arrangedSubviews: [studyButton, readingButton, othersButton])
        
        stack1.axis = .vertical
        stack2.axis = .vertical
        
        let stack = UIStackView(arrangedSubviews: [stack1, stack2])
        view.addSubview(stack)
        stack.anchor(top: headerStack.bottomAnchor,
                     left: view.leadingAnchor,
                     right: view.trailingAnchor,
                     paddingTop: 24,
                     paddingLeft: 16,
                     paddingRight: 16)
        stack.spacing = 14
        
        stack1.anchor(width: 172, height: 220)
        stack2.anchor(width: 172, height: 220)
        
        stack1.spacing = 20
        stack2.spacing = 20
        
        [workButton, workoutButton, meditationButton, studyButton, readingButton, othersButton].forEach { $0.setDimensions(width: 172, height: 60)
            $0.layer.cornerRadius = 16
            $0.backgroundColor = UIColor.buttonColor
            $0.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
            $0.tintColor = UIColor.secondaryColor
        }
    }

}
