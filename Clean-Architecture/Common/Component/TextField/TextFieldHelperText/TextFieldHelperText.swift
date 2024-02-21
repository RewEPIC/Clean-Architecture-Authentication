//
//  TextFieldHelperText.swift
//  Clean-Architecture
//
//  Created by Duangcharoen  on 20/2/2567 BE.
//

import UIKit

class TextFieldHelperText: UIView {

    @IBOutlet private weak var textField: TextField!
    @IBOutlet private weak var helperView: HelperText!

    public var helperText: String! {
        didSet {
            self.helperView.isHidden = false
            self.helperView.show(titleText: helperText, style: .error)
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
    
    public func setup(viewModel: TextFieldHelperTextViewModel) {
        self.textField.setup(
            viewModel: TextFieldViewModel(titleText: viewModel.titleText, placeholder: viewModel.placeholder,
                                          isSecretText: viewModel.isSecretText)
        )
        self.updateLayout(state: viewModel.state)
    }
    
    public func updateLayout(state: TextFieldHelperTextState) {
        self.helperView.titleText = state.helperText
        self.helperView.isHidden = state.isHiddenHelperTextView
        self.helperView.isHiddenText = state.isHiddenHelperTextView
        self.helperView.style = state.helperStyle
    }
}

private extension TextFieldHelperText {
    
    func commonInit() {
        setupXib()
    }
}
