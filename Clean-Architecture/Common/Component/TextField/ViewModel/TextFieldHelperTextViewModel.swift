//
//  TextFieldHelperTextViewModel.swift
//  Clean-Architecture
//
//  Created by Duangcharoen  on 20/2/2567 BE.
//

import UIKit

enum TextFieldHelperTextState {
    case `default`(helperMessage: String = "")
    case `disabled`(helperMessage: String = "")
    case error(errorMessage: String)
}

struct TextFieldHelperTextViewModel: TextFieldViewModelInterface {
    var titleText: String
    var placeholder: String
    var isSecretText: Bool
    var state: TextFieldHelperTextState
    var helperTextValue: String
    
    init(state: TextFieldHelperTextState = .default(), titleText: String, helperTextValue: String = "", placeholder: String, isSecretText: Bool = false) {
        self.state = state
        self.helperTextValue = helperTextValue
        self.titleText = titleText
        self.placeholder = placeholder
        self.isSecretText = isSecretText
    }
}
