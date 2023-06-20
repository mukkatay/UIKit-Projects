//
//  LoginController.swift
//  MeнTweet
//
//  Created by Akyl Mukatay  on 14.06.2023.
//

import UIKit

class LoginController: UIViewController {
    
    //MARK: - Properties
    
    private let logoImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        image.image = UIImage(named: "twitter_logo_white")
        image.tintColor = .menTweetRed
        return image
    }()
    
    private lazy var emailContainerView: UIView = {
        let image = UIImage(named: "men_tweet_mail")
        let view = Utilities().inputContainerView(withImage: image!, textField: emailTextField)
        return view
    }()
    
    private lazy var passwordContainerView: UIView = {
        let image = UIImage(named: "men_tweet_lock")
        let view = Utilities().inputContainerView(withImage: image!, textField: passwordTextField)
        return view
    }()
    
    private let emailTextField: UITextField = {
        let tf = Utilities().textField(with: "Email")
        return tf
    }()
    
    private let passwordTextField: UITextField = {
        let tf = Utilities().textField(with: "Password")
        tf.isSecureTextEntry = true
        return tf
    }()
    
    private let logInButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Log In", for: .normal)
        button.setTitleColor(.menTweetOrange, for: .normal)
        button.backgroundColor = .menTweetWhite
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.layer.cornerRadius = 8
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
        return button
    }()
    
    private let dontHaveAccounButton: UIButton = {
        let button = Utilities().attributedButton("Don't have account? ", "Sign Up")
        button.addTarget(self, action: #selector(handleShowSignUp), for: .touchUpInside)
        return button
    }()
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        configureUI()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true) // Скрывает клавиатуру при касании за пределами текстового поля
    }
    
    //MARK: - Selectors
    
    @objc func handleLogin() {
        guard let email = emailTextField.text else { return }
        guard let password = passwordTextField.text else { return }
        
        AuthService.shared.logUserIn(email: email, password: password) { (result, error) in
            if let error = error {
                print("DEBUG: Error login in \(error.localizedDescription)")
                return
            }
            
            guard let window = UIApplication.shared.windows.first(where: { $0.isKeyWindow }) else { return }
            guard let tab = window.rootViewController as? MainTabController else { return }
            
            tab.authenticateUserConfigureUI()
            
            self.dismiss(animated: true)
        }
    }
    
    @objc func handleShowSignUp() {
        let vc = RegistrationController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    //MARK: - Helpers

    func configureUI() {
        view.backgroundColor = .menTweetRed
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.isHidden = true
        
        view.addSubview(logoImageView)
        logoImageView.centerX(inView: view,
                              topAnchor: view.safeAreaLayoutGuide.topAnchor,
                              paddingTop: 32)
        logoImageView.setDimensions(width: 100, height: 100)
        
        let stack = UIStackView(arrangedSubviews: [emailContainerView, passwordContainerView, logInButton])
        stack.axis = .vertical
        stack.spacing = 16
        stack.distribution = .fillEqually
        
        view.addSubview(stack)
        stack.anchor(top: logoImageView.bottomAnchor,
                     left: view.leadingAnchor,
                     right: view.trailingAnchor,
                     paddingTop: 64,
                     paddingLeft: 32,
                     paddingRight: 32)
        
        view.addSubview(dontHaveAccounButton)
        dontHaveAccounButton.anchor(left: view.leadingAnchor,
                                    bottom: view.safeAreaLayoutGuide.bottomAnchor,
                                    right: view.trailingAnchor,
                                    paddingLeft: 40,
                                    paddingRight: 40)
    }
    
}
