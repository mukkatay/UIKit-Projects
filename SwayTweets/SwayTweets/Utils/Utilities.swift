//
//  Utilities.swift
//  MeнTweet
//
//  Created by Akyl Mukatay  on 15.06.2023.
//

import UIKit

class Utilities {
    
    func inputContainerView(withImage image: UIImage, textField: UITextField) -> UIView {
        let view = UIView()
        view.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        let iv = UIImageView(image: image)
        view.addSubview(iv)
        iv.anchor(left: view.leadingAnchor,
                  bottom: view.bottomAnchor,
                  paddingBottom: 8)
        iv.setDimensions(width: 24, height: 24)
        
        view.addSubview(textField)
        textField.anchor(left: iv.trailingAnchor,
                         bottom: view.bottomAnchor,
                         right: view.trailingAnchor,
                         paddingLeft: 8,
                         paddingBottom: 8)
        
        let dividerView = UIView()
        dividerView.backgroundColor = .menTweetWhite
        view.addSubview(dividerView)
        dividerView.anchor(left: view.leadingAnchor,
                           bottom: view.bottomAnchor,
                           right: view.trailingAnchor,
                           height: 0.75)
        
        return view
    }
    
    func textField(with placeholder: String) -> UITextField {
        let tf = UITextField()
        tf.font = UIFont.systemFont(ofSize: 16)
        tf.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor: UIColor.menTweetWhite])
        tf.textColor = .menTweetWhite
        return tf
    }
    
    func attributedButton(_ firstPart: String, _ secondPart: String) -> UIButton {
        let button = UIButton(type: .system)
        
        let attributedTitle = NSMutableAttributedString(string: firstPart, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16),NSAttributedString.Key.foregroundColor: UIColor.menTweetWhite])
        
        attributedTitle.append(NSAttributedString(string: secondPart, attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16), NSAttributedString.Key.foregroundColor: UIColor.menTweetWhite]))
        
        button.setAttributedTitle(attributedTitle, for: .normal)
        
        return button
    }
}
