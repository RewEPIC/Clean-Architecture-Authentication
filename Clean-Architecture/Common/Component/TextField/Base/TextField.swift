//
//  TextField.swift
//  Clean-Architecture
//
//  Created by Duangcharoen  on 13/2/2567 BE.
//

import UIKit

class TextField: UIView {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var container: UIView!
    
    private lazy var doneButton: UIBarButtonItem = {
        return UIBarButtonItem(title: "Done",
                               style: .done,
                               target: self,
                               action: #selector(dismissKeyboard))
    }()
    
    public var isSecretText: Bool! {
        didSet {
            self.textField.isSecureTextEntry = isSecretText
        }
    }
    
    public var placeholder: String! {
        didSet {
            self.textField.placeholder = placeholder
        }
    }
    public var titleText: String! {
        didSet {
            self.titleLabel.text = titleText
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
    
    public func setup(viewModel: TextFieldViewModel) {
        self.titleText = viewModel.titleText
        self.placeholder = viewModel.placeholder
        self.isSecretText = viewModel.isSecretText
    }

}
extension TextField: UITextFieldDelegate {
//    func textFieldDidBeginEditing(_ textField: UITextField) {
//        print("begin")
//    }
//    func textFieldDidEndEditing(_ textField: UITextField) {
//        print("end")
//    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        dismissKeyboard()
        return true
    }
    @objc private func dismissKeyboard() {
        textField.resignFirstResponder()
    }
}

private extension TextField {
    
    func commonInit() {
        setupXib()
        setupUI()
        setToolBar()
    }
    
    func setToolBar() {
        let keyboardToolbar =  UIToolbar(frame: CGRect(origin: .zero, size: CGSize(width: 100, height: 100)))
        let flexBarButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        keyboardToolbar.sizeToFit()
        keyboardToolbar.items = [flexBarButton, doneButton]
        textField.inputAccessoryView = keyboardToolbar
    }
    
    func setupUI() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        self.container.layer.borderWidth = 1
        self.container.layer.borderColor = UIColor.systemBlue.cgColor
        self.container.layer.cornerRadius = 12
        
        self.textField.borderStyle = .none
        self.textField.placeholder = "Placeholder"
        self.textField.delegate = self
        
        self.titleLabel.textColor = UIColor.systemGray
    }
    
}
