//
//  HelperTextViewModel.swift
//  Clean-Architecture
//
//  Created by Duangcharoen  on 20/2/2567 BE.
//

import UIKit

enum HelperTextStyle {
    case success
    case error
    
    var color: UIColor {
        switch self {
        case .success: UIColor.systemGreen
        case .error: UIColor.systemRed
        }
    }
}

protocol HelperTextViewModelInterface {
    var titleText: String { get }
    var style: HelperTextStyle { get }
    var isHiddenText: Bool { get }
}

struct HelperTextViewModel: HelperTextViewModelInterface {
    var titleText: String
    var isHiddenText: Bool
    var style: HelperTextStyle
    
    init(titleText: String, style: HelperTextStyle, isHiddenText: Bool = true) {
        self.titleText = titleText
        self.isHiddenText = isHiddenText
        self.style = style
    }
}
