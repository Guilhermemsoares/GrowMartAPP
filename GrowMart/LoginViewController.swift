import Foundation
import UIKit

protocol LoginViewDelegate: AnyObject {
    func openFacebookLogin()
    func openGoogleLogin()
}

final class LoginViewController: UIViewController, ViewCodable {
    
    weak var delegate: LoginViewDelegate?

    private lazy var growmartLogo: UIImageView = {
        let image = UIImageView.init(image: .init(named: "growmart_logo"))
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
    }()

    private lazy var shoppingImage: UIImageView = {
        let image = UIImageView.init(image: .init(named: "bags_image"))
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
    }()

    private lazy var facebookLogoButton: UIButton = {
        let button = UIButton()
        button.setTitle(" Entrar com Facebook", for: .normal)
        button.backgroundColor = .blue
        button.layer.cornerRadius = 8
        button.setImage(UIImage(named: "facebook_logo"), for: .normal)
        button.addTarget(self, action: #selector(didTapFacebookLogin), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private lazy var googleLogoButton: UIButton = {
        let button = UIButton()
        button.setTitle("  Entrar com Google", for: .normal)
        button.backgroundColor = .red
        button.layer.cornerRadius = 8
        button.setImage(UIImage(named: "google_logo"), for: .normal)
        button.addTarget(self, action: #selector(didTapGoogleLogin), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    @objc
    func didTapGoogleLogin() {
        delegate?.openGoogleLogin()
    }
    
    @objc
    func didTapFacebookLogin() {
        delegate?.openGoogleLogin()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView() {
        buildHierarchy()
        setupConstraints()
        applyAdditionalChanges()
    }

    func buildHierarchy() {
        view.addSubview(growmartLogo)
        view.addSubview(shoppingImage)
        view.addSubview(facebookLogoButton)
        view.addSubview(googleLogoButton)
    }
    


    func setupConstraints() {
        NSLayoutConstraint.activate([

            growmartLogo.topAnchor.constraint(equalTo: view.topAnchor, constant: 252),
            growmartLogo.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 67),

            shoppingImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            shoppingImage.centerYAnchor.constraint(equalTo: view.centerYAnchor),

            facebookLogoButton.topAnchor.constraint(equalTo: shoppingImage.bottomAnchor, constant: 84),
            facebookLogoButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 60),
            facebookLogoButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -60),
            facebookLogoButton.heightAnchor.constraint(equalToConstant: 41),

            googleLogoButton.topAnchor.constraint(equalTo: facebookLogoButton.bottomAnchor, constant: 16),
            googleLogoButton.leadingAnchor.constraint(equalTo: facebookLogoButton.leadingAnchor),
            googleLogoButton.trailingAnchor.constraint(equalTo: facebookLogoButton.trailingAnchor),
            googleLogoButton.heightAnchor.constraint(equalToConstant: 41)
        ])
        
    }

    func applyAdditionalChanges() {
        view.backgroundColor = .white
        delegate = self
    }
}

extension LoginViewController: LoginViewDelegate {
    func openFacebookLogin() {
        print("openFacebookLogin")
        navigationController?.setViewControllers([SelectorViewController()], animated: true)
    }
    
    func openGoogleLogin() {
        navigationController?.setViewControllers([SelectorViewController()], animated: true)
    }
}
