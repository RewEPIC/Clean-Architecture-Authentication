//
//  ButtonViewModel.swift
//  Clean-Architecture
//
//  Created by Duangcharoen  on 13/2/2567 BE.
//

import UIKit

enum ButtonSize {
    case large
    case medium
    case small
    
    var height: CGFloat {
        switch self {
        case .large: 48
        case .medium: 36
        case .small: 24
        }
    }
}

struct ButtonViewModel {
    
    var titleText: String
    var buttonSize: ButtonSize
    
    init(titleText: String, buttonSize: ButtonSize) {
        self.titleText = titleText
        self.buttonSize = buttonSize
    }
}
