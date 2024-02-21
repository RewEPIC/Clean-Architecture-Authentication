//
//  Button.swift
//  Clean-Architecture
//
//  Created by Duangcharoen  on 13/2/2567 BE.
//

import UIKit

class Button: UIControl {

    private let container = UIView(frame: .zero)
    private let mainContainer = UIView(frame: .zero)
    private let titleLabel = UILabel(frame: .zero)
    
    public var titleText: String! {
        didSet {
            titleLabel.text = titleText
        }
    }
    public var buttonSize: ButtonSize! {
        didSet {
            self.container.heightAnchor.constraint(equalToConstant: self.buttonSize.height).isActive = true
            self.mainContainer.heightAnchor.constraint(equalToConstant: self.buttonSize.height).isActive = true
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    public func setup(viewModel: ButtonViewModel) {
        self.buttonSize = viewModel.buttonSize
        self.titleText = viewModel.titleText
    }
}


private extension Button {
        
    func commonInit() {
        setupUI()
        setupSubviews()
    }

    func setupSubviews() {
        container.isUserInteractionEnabled = false
        mainContainer.isUserInteractionEnabled = false
        titleLabel.isUserInteractionEnabled = false
        
        mainContainer.addSubview(titleLabel)
        container.addSubview(mainContainer)
        self.addSubview(container)

        mainContainer.translatesAutoresizingMaskIntoConstraints = false
        container.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            container.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            container.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            container.topAnchor.constraint(equalTo: self.topAnchor),
            container.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            mainContainer.leadingAnchor.constraint(equalTo: container.leadingAnchor),
            mainContainer.trailingAnchor.constraint(equalTo: container.trailingAnchor),
            mainContainer.topAnchor.constraint(equalTo: container.topAnchor),

            titleLabel.centerXAnchor.constraint(equalTo: mainContainer.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: mainContainer.centerYAnchor),
        ])
        
    }
    
    func setupUI() {
        titleLabel.layer.masksToBounds = true
        titleLabel.clipsToBounds = true
        titleLabel.numberOfLines = 1
        titleLabel.textAlignment = .center
        titleLabel.textColor = .white
        
        mainContainer.backgroundColor = .systemBlue.withAlphaComponent(0.75)
        mainContainer.layer.cornerRadius = 12
        
    }
    
}
