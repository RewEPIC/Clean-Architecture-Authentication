//
//  HelperText.swift
//  Clean-Architecture
//
//  Created by Duangcharoen  on 18/2/2567 BE.
//

import UIKit

class HelperText: UIView {
    
    //MARK: - private
    @IBOutlet private weak var container: UIView!
    @IBOutlet private weak var iconContainer: UIView!
    @IBOutlet private weak var labelContainer: UIView!
    @IBOutlet private weak var titleLabel: UILabel!
    
    private lazy var iconView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    public var style: HelperTextStyle! = .success {
        didSet {
            self.titleLabel.textColor = style.color
            updateUI()
        }
    }
    
    //MARK: - public
    public var isHiddenText: Bool! {
        didSet {
            labelContainer.isHidden = isHiddenText
            iconContainer.isHidden = isHiddenText
        }
    }
    
    
    public var titleText: String! {
        didSet {
            titleLabel.text = titleText
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
    
    public func setup(viewModel: HelperTextViewModel) {
        self.titleText = viewModel.titleText
        self.isHiddenText = viewModel.isHiddenText
    }
    
    public func show(titleText: String, style: HelperTextStyle) {
        self.titleText = titleText
        self.style = style
        self.isHiddenText = false
    }
    
}

private extension HelperText {
    
    func commonInit() {
        setupXib()
        setupUI()
    }
    
    func setupUI() {
        self.container.layer.cornerRadius = 8
        self.iconContainer.addSubview(self.iconView)
        
        NSLayoutConstraint.activate([
            self.iconView.widthAnchor.constraint(equalToConstant: 8),
            self.iconView.heightAnchor.constraint(equalToConstant: 8),
            self.iconView.centerXAnchor.constraint(equalTo: self.iconContainer.centerXAnchor),
            self.iconView.centerYAnchor.constraint(equalTo: self.iconContainer.centerYAnchor)
        ])
        
        layoutIfNeeded()
        self.iconView.layer.cornerRadius = self.iconView.frame.height / 2
    }
    
    
    func updateUI() {
        self.iconView.backgroundColor = self.style.color
        self.container.backgroundColor = self.style.color.withAlphaComponent(0.2)
    }
}
