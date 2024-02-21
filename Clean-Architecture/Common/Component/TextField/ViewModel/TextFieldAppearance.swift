//
//  TextFieldAppearance.swift
//  Clean-Architecture
//
//  Created by Duangcharoen  on 20/2/2567 BE.
//

import UIKit

protocol TextFieldAppearance {
    var isHiddenHelperTextView: Bool { get }
    var helperText: String { get }
}

extension TextFieldHelperTextState: TextFieldAppearance {
    
    var isHiddenHelperTextView: Bool {
        switch self {
        case .error(let errorMessage): 
            return errorMessage.isEmpty
        case .default(let helperMessage), .disabled(let helperMessage):
            return helperMessage.isEmpty
        }
    }
    
    var helperText: String {
        switch self {
            case .error(let errorMessage):
                return errorMessage
            case .default(let helperMessage), .disabled(let helperMessage):
                return helperMessage
        }
    }
    
    var helperStyle: HelperTextStyle {
        switch self {
        case .error(_): HelperTextStyle.error
        default: HelperTextStyle.success
        }
    }
    
    
}
