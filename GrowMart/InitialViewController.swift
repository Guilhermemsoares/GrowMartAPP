import Foundation
import UIKit

class InitialViewController: UIViewController, ViewCodable {

    lazy var growmartLogo: UIImageView = {
        let image = UIImageView.init(image: .init(named: "growmart_logo"))
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

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
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            growmartLogo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            growmartLogo.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }

    func applyAdditionalChanges() {
        view.backgroundColor = .white
    }
}
