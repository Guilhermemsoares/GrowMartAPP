import UIKit
 
class CategoryButton: UIControl {
    enum ImagePosition {
        case left
        case right
    }
    
    private let title: String
    private let imagePosition: ImagePosition
    private let imageItem: UIImage?
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.textColor = UIColor(red: 1, green: 0.431, blue: 0.251, alpha: 1)
        label.textAlignment = .center
        label.text = title
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var imageCategory: UIImageView = {
     let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = imageItem
        image.layer.masksToBounds = true
        return image
    }()
    
  
    
    internal init(title: String, imagePosition: CategoryButton.ImagePosition, image: UIImage?) {
            self.title = title
            self.imagePosition = imagePosition
            self.imageItem = image
            super.init(frame: CGRect(x:0,y:0,width:100,height:100))
            setupView()
        }
    
        required init?(coder: NSCoder) {
        nil
    }
}

extension CategoryButton: ViewCodable {
    func setupView() {
        buildHierarchy()
        setupConstraints()
        applyAdditionalChanges()
    }
    
    func buildHierarchy() {
        addSubview(titleLabel)
        addSubview(imageCategory)
       
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            heightAnchor.constraint(equalToConstant: 100),
            
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            imageCategory.centerYAnchor.constraint(equalTo: centerYAnchor),
            imageCategory.heightAnchor.constraint(equalToConstant: 120),
            imageCategory.widthAnchor.constraint(equalToConstant: 110)
            
        ])
        
        switch imagePosition {
        case.left:
            configureButtonForLeft()
        case.right:
            configureButtonForRight()
        }
    }
    
    func applyAdditionalChanges() {
        backgroundColor = UIColor(red: 0.961, green: 0.941, blue: 0.882, alpha: 1)
        layer.cornerRadius = 35
        
    }
    
    
    
    func configureButtonForLeft() {
            NSLayoutConstraint.activate([
                imageCategory.leadingAnchor.constraint(equalTo: leadingAnchor, constant: -8),

                titleLabel.leadingAnchor.constraint(equalTo: imageCategory.trailingAnchor),
                titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor)
            ])
        }

        func configureButtonForRight() {
            NSLayoutConstraint.activate([
                imageCategory.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 8),

                titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
                titleLabel.trailingAnchor.constraint(equalTo: imageCategory.leadingAnchor)
            ])
        }
}

