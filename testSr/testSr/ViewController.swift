//
//  ViewController.swift
//  testSr
//
//  Created by JECASTAÑOSM on 24/05/24.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: Componentes
    private let scrollView: UIScrollView = {
        let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let scrollStackViewContainer: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 16
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let titleLabel : UILabel = {
        let label = UILabel()
        label.text = "Bienvenido"
        return label
    }()
    
    private let subTitleLabel : UILabel = {
        let label = UILabel()
        label.text = "App del dia"
        return label
    }()
    
    private let destacadasLabel : UILabel = {
        let label = UILabel()
        label.text = "Destacadas"
        return label
    }()
    
    private let principalView: UIView = {
        let view = UIView()
        view.heightAnchor.constraint(equalToConstant: 320).isActive = true
        view.layer.cornerRadius = 30
        return view
    }()
    
    private let stackDestacadas: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.distribution = .fillProportionally
        view.spacing = 12
        return view
    }()
    
    // MARK: Variables
    var appDestacadasArray: [AppsDestacadasModel] = []
    let faceBook = AppsDestacadasModel(idApp: "1", nombreApp: "Facebook", colorApp: "1877F2", pathImageApp: "facebook")
    let whatsApp = AppsDestacadasModel(idApp: "2", nombreApp: "Whatsapp", colorApp: "25D366", pathImageApp: "whatsapp")
    let instagram = AppsDestacadasModel(idApp: "3", nombreApp: "Instagram", colorApp: "DD2A7B", pathImageApp: "instagram")
    var constantHeight = 90
    
    // MARK: Ciclo de vida
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupScrollView()
        self.setFonts()
    }
    
    private func setFonts(){
        let bold = "SFProText-Bold"
        self.titleLabel.font = UIFont(name: bold, size: 30)
        self.subTitleLabel.font = UIFont(name: bold, size: 15)
        self.destacadasLabel.font = UIFont(name: bold, size: 15)
    }
    
    // MARK: Constraints
    private func setupScrollView() {
        let margins = view.layoutMarginsGuide
        view.addSubview(scrollView)
        scrollView.addSubview(scrollStackViewContainer)
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: margins.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: margins.bottomAnchor).isActive = true
        scrollStackViewContainer.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        scrollStackViewContainer.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        scrollStackViewContainer.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        scrollStackViewContainer.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        scrollStackViewContainer.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        self.configureContainerView()
        self.principalViewConstraint()
        self.labelsConstraint()
    }
    
    private func principalViewConstraint(){
        principalView.translatesAutoresizingMaskIntoConstraints = false
        stackDestacadas.translatesAutoresizingMaskIntoConstraints = false
        principalView.leadingAnchor.constraint(equalTo: scrollStackViewContainer.leadingAnchor, constant: 24).isActive = true
        principalView.trailingAnchor.constraint(equalTo: scrollStackViewContainer.trailingAnchor, constant: -24).isActive = true
        
        stackDestacadas.leadingAnchor.constraint(equalTo: scrollStackViewContainer.leadingAnchor, constant: 24).isActive = true
        stackDestacadas.trailingAnchor.constraint(equalTo: scrollStackViewContainer.trailingAnchor, constant: -24).isActive = true
    }
    
    private func labelsConstraint(){
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        subTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel.topAnchor.constraint(equalTo: scrollStackViewContainer.topAnchor, constant: 50).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: scrollStackViewContainer.leadingAnchor, constant: 24).isActive = true
        
        subTitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 24).isActive = true
        subTitleLabel.leadingAnchor.constraint(equalTo: scrollStackViewContainer.leadingAnchor, constant: 24).isActive = true
    }
    
    // MARK: Creacion de componentes
    private func configureContainerView() {
        scrollStackViewContainer.addArrangedSubview(self.titleLabel)
        scrollStackViewContainer.addArrangedSubview(self.subTitleLabel)
        scrollStackViewContainer.addArrangedSubview(self.principalView)
        scrollStackViewContainer.addArrangedSubview(self.destacadasLabel)
        scrollStackViewContainer.addArrangedSubview(self.stackDestacadas)
        
        self.createPrincipalView()
        self.createStackDestacadas()
    }
    
    private func createPrincipalView(){
        let image = UIImageView(image: UIImage(named: "test"))
        image.frame = CGRect(x: 0, y: 0, width: view.frame.width - 48, height: 320)
        image.layer.cornerRadius = 30
        image.layer.masksToBounds = true
        image.alpha = 0.9
        
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .leading
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        let imageTik = UIImageView(image: UIImage(named: "tikTok"))
        imageTik.layer.cornerRadius = 15
        imageTik.layer.masksToBounds = true
        
        let label = UILabel()
        label.text = "APP OF\nTHE\nDAY"
        label.numberOfLines = 0
        label.font = UIFont(name: "SFProText-Bold", size: 40)
        label.textColor = .white
        
        let labelTik = UILabel()
        labelTik.text = "TIK TOK"
        labelTik.font = UIFont(name: "SFProText-Regular", size: 15)
        labelTik.textColor = .white
        
        let button = self.buttonObtenerApp()
        
        stackView.addArrangedSubview(imageTik)
        stackView.addArrangedSubview(label)
        stackView.addArrangedSubview(labelTik)
        
        self.principalView.addSubview(image)
        self.principalView.addSubview(stackView)
        self.principalView.addSubview(button)
        
        button.widthAnchor.constraint(equalToConstant: 80.0).isActive = true
        button.trailingAnchor.constraint(equalTo: principalView.trailingAnchor, constant: -24).isActive = true
        button.bottomAnchor.constraint(equalTo: principalView.bottomAnchor, constant: -24).isActive = true
        
        imageTik.widthAnchor.constraint(equalToConstant: 80.0).isActive = true
        imageTik.heightAnchor.constraint(equalToConstant: 80.0).isActive = true
        
        stackView.leadingAnchor.constraint(equalTo: principalView.leadingAnchor, constant: 24).isActive = true
        stackView.topAnchor.constraint(equalTo: principalView.topAnchor, constant: 24).isActive = true
        stackView.trailingAnchor.constraint(equalTo: principalView.trailingAnchor, constant: -24).isActive = true
        stackView.bottomAnchor.constraint(equalTo: principalView.bottomAnchor, constant: -24).isActive = true
    }
    
    private func createStackDestacadas(){
        self.appDestacadasArray.append(whatsApp)
        self.appDestacadasArray.append(faceBook)
        self.appDestacadasArray.append(instagram)
        
        for i in self.appDestacadasArray{
            
            let stackViewH = UIStackView()
            stackViewH.axis = .horizontal
            stackViewH.distribution = .fill
            stackViewH.alignment = .center
            stackViewH.spacing = 12
            stackViewH.layer.cornerRadius = 20
            stackViewH.backgroundColor = UIColor(hexString: i.colorApp).withAlphaComponent(0.1)
            stackViewH.translatesAutoresizingMaskIntoConstraints = false
            
            let imageView = UIImageView(image: UIImage(named: i.pathImageApp))
            imageView.layer.cornerRadius = 15
            imageView.layer.masksToBounds = true
            
            stackViewH.addArrangedSubview(imageView)
            stackViewH.addArrangedSubview(createItemDestacadas(nombreApp: i.nombreApp))
            
            stackDestacadas.addArrangedSubview(stackViewH)
            
            imageView.widthAnchor.constraint(equalToConstant: 70.0).isActive = true
            imageView.heightAnchor.constraint(equalToConstant: 75.0).isActive = true
            imageView.leadingAnchor.constraint(equalTo: stackViewH.leadingAnchor, constant: 16).isActive = true
            
            constantHeight+=90
        }
        stackDestacadas.heightAnchor.constraint(equalToConstant: CGFloat(constantHeight)).isActive = true
    }
    
    private func buttonObtenerApp()-> UIButton{
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Obtener", for: .normal)
        button.titleLabel?.font = UIFont(name: "SFProText-Bold", size: 12)
        button.setTitleColor(UIColor(hexString: "03AED2"), for: .normal)
        button.layer.cornerRadius = 14.0
        button.backgroundColor = .white
        return button
    }
    
    private func createItemDestacadas(nombreApp: String)-> UIStackView{
        
        let stackViewV = UIStackView()
        stackViewV.axis = .vertical
        stackViewV.distribution = .fill
        stackViewV.alignment = .leading
        stackViewV.translatesAutoresizingMaskIntoConstraints = false
        stackViewV.spacing = 8
        
        let titleNameApp = UILabel()
        titleNameApp.text = nombreApp
        titleNameApp.font = UIFont(name: "SFProText-Bold", size: 35)
        
        let button = self.buttonObtenerApp()
        
        stackViewV.addArrangedSubview(titleNameApp)
        stackViewV.addArrangedSubview(button)
        
        button.widthAnchor.constraint(equalToConstant: 80.0).isActive = true
        
        return stackViewV
    }
    
}
extension UIColor {
    convenience init(hexString: String) {
        let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt64()
        Scanner(string: hex).scanHexInt64(&int)
        let a: UInt64
        let r: UInt64
        let g: UInt64
        let b: UInt64
        switch hex.count {
        case 3:
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6:
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8:
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
    }
}

