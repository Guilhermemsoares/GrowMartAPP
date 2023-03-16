
import UIKit

final class SelectorViewController: UIViewController, ViewCodable {
    
    private lazy var titleBuy: UILabel = {
        let title = UILabel()
        title.text = "O que você quer comprar?"
        title.font = .systemFont(ofSize: 30, weight: .bold)
        title.textColor = UIColor(red: 0.118, green: 0.239, blue: 0.349, alpha: 1)
        title.numberOfLines = 0
        title.textAlignment = .left
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()

    private let buttonItemClothes = CategoryButton(title: "Roupas", imagePosition: .left, image:UIImage(named: "roupas"))
    
  private let buttonItemOStuff = CategoryButton(title: "Acessórios", imagePosition: .right, image:UIImage(named: "mochila"))
    
    private let buttonItemOthers = CategoryButton(title: "Outros", imagePosition: .left, image:UIImage(named: "disco"))
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView() {
        buildHierarchy()
        setupConstraints()
        applyAdditionalChanges()
        buttonItemOthers.translatesAutoresizingMaskIntoConstraints = false
        buttonItemOStuff.translatesAutoresizingMaskIntoConstraints = false
        buttonItemClothes.translatesAutoresizingMaskIntoConstraints = false
        view.translatesAutoresizingMaskIntoConstraints = false
    }

    func buildHierarchy() {
        
        view.addSubview(titleBuy)
        view.addSubview(buttonItemClothes)
        view.addSubview(buttonItemOStuff)
        view.addSubview(buttonItemOthers)
    }
    


    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            titleBuy.topAnchor.constraint(equalTo: view.topAnchor, constant: 90),
            titleBuy.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 60),
            titleBuy.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -60),
            
            
            buttonItemClothes.topAnchor.constraint(equalTo: view.topAnchor, constant: 245),
            buttonItemClothes.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 60),
            buttonItemClothes.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -60),
            buttonItemClothes.heightAnchor.constraint(equalToConstant: 100),
            
            buttonItemOStuff.topAnchor.constraint(equalTo: buttonItemClothes.bottomAnchor, constant: 30),
            buttonItemOStuff.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 60),
            buttonItemOStuff.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -60),
            buttonItemOStuff.heightAnchor.constraint(equalToConstant: 100),
            
            buttonItemOthers.topAnchor.constraint(equalTo: buttonItemOStuff.bottomAnchor, constant: 30),
            buttonItemOthers.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 60),
            buttonItemOthers.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -60),
            buttonItemOthers.heightAnchor.constraint(equalToConstant: 100)
            
            
            
        ])
    }

    func applyAdditionalChanges() {
        view.backgroundColor = .white
    }
}

