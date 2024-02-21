//
//  TextFieldViewModel.swift
//  Clean-Architecture
//
//  Created by Duangcharoen  on 13/2/2567 BE.
//

import UIKit

protocol TextFieldViewModelInterface {
    var titleText: String { get }
    var placeholder: String { get }
    var isSecretText: Bool { get }
}

struct TextFieldViewModel: TextFieldViewModelInterface {
    
    var titleText: String
    var placeholder: String
    var isSecretText: Bool
    
    init(titleText: String, placeholder: String, isSecretText: Bool = false) {
        self.titleText = titleText
        self.placeholder = placeholder
        self.isSecretText = isSecretText
    }
}
