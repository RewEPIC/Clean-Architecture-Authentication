//
//  UIView.swift
//  Clean-Architecture
//
//  Created by Duangcharoen  on 13/2/2567 BE.
//

import UIKit

enum ShadowDirection {
    case bottom
}

extension UIView {
    
    var xibName: String {
        return String(describing: type(of: self)).components(separatedBy: ".").first ?? ""
    }
    
    func setupXib() {
        setupXib(xibName: xibName)
    }
    
    func setupXib(xibName: String) {
        let nib = UINib(nibName: xibName, bundle: .main)
        guard let view = nib.instantiate(withOwner: self, options: nil).first as? UIView else {
            return
        }
        view.frame = self.bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.layoutIfNeeded()
        self.addSubview(view)
    }
    
    func performAnimation(
        animated: Bool,
        interval: TimeInterval? = nil,
        action: (() -> Void)? = nil) {

        if animated {
            UIView.animate(
                withDuration: interval ?? .zero,
                animations: {
                    action?()
                },
                completion: nil
            )
        } else {
            action?()
        }
    }
    
    func addShadow(direction: ShadowDirection) {
        switch direction {
        case .bottom:
            layer.masksToBounds = false
            layer.shadowRadius = 1
            layer.shadowOpacity = 1
            layer.shadowColor = UIColor.gray.cgColor
            layer.shadowOffset = CGSize(width: 0 , height: 2)
            layer.shadowPath = UIBezierPath(rect: CGRect(x: 0,
                                                          y: bounds.maxY - layer.shadowRadius,
                                                          width: bounds.width,
                                                          height: layer.shadowRadius)).cgPath
         
        }
    }
}
