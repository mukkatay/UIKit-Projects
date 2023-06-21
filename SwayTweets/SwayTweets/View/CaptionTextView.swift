//
//  CaptionTextView.swift
//  SwayTweets
//
//  Created by Akyl Mukatay  on 18.06.2023.
//

import UIKit

class CaptionTextView: UITextView {

    //MARK: - Properties
    
    let placwholderLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .darkGray
        label.text = "What's happening?"
        return label
    }()
    
    //MARK: - Lifecycle
    
    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        
        backgroundColor = .white
        font = UIFont.systemFont(ofSize: 16)
        isScrollEnabled = false
        heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        addSubview(placwholderLabel)
        placwholderLabel.anchor(top: topAnchor,
                                left: leadingAnchor,
                                paddingTop: 8,
                                paddingLeft: 4)
        NotificationCenter.default.addObserver(self, selector: #selector(handleTextInputChange), name: UITextView.textDidChangeNotification, object: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Selectors
    
    @objc func handleTextInputChange() {
        placwholderLabel.isHidden = !text.isEmpty
    }
    
}
