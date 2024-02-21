//
//  NavigationBar.swift
//  CountryApp
//
//  Created by Duangcharoen  on 25/1/2567 BE.
//

import UIKit

@objc protocol NavigationBarDelegate: AnyObject {
    func navigateButtonDidTapped()
    @objc optional func lastButtonDidTapped()
}

class NavigationBar: UIView {

    @IBOutlet private weak var navigateButton: ButtonIcon!
    @IBOutlet private weak var lastButton: ButtonIcon!
    @IBOutlet private weak var titleLabel: UILabel!
    
    private var width: CGFloat! = UIScreen.main.bounds.width
    private var height: CGFloat! = 42
    
    public var delegate: NavigationBarDelegate!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    public func setup(titleText: String) {
        self.titleLabel.text = titleText
    }
}

// MARK: - Action
private extension NavigationBar {
    @IBAction func navigateButtonDidTapped(_ sender: Any) {
        delegate?.navigateButtonDidTapped()
    }
}

private extension NavigationBar {

    func commonInit() {
        setupXib()
        setupUI()
        setupIcon()
    }
    
    func setupUI() {
        NSLayoutConstraint.activate([
            self.widthAnchor.constraint(equalToConstant: width),
            self.heightAnchor.constraint(equalToConstant: height)
        ])
        
        self.addShadow(direction: .bottom)
    }
    
    func setupIcon() {
        navigateButton.setup(image: UIImage(named: "chevron-left")!, size: self.height)
    }
}
