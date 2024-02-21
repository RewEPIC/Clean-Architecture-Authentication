//
//  ButtonIcon.swift
//  Clean-Architecture
//
//  Created by Duangcharoen  on 20/2/2567 BE.
//
import UIKit

class ButtonIcon: UIButton {
    
    private var parentView: UIView!
    private var iconImageView: UIImageView!
    
    public func setup(image: UIImage, size: CGFloat = 40, imageSize: CGFloat = 24) {
        self.parentView = UIView(frame: CGRect(x: 0, y: 0, width: size, height: size))
        self.iconImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: imageSize, height: imageSize))
        setupIcon(image: image)
    }
    
    public override func draw(_ rect: CGRect) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.clipsToBounds = true
        self.backgroundColor = .clear
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        self.imageView?.removeFromSuperview()
        self.titleLabel?.removeFromSuperview()
    }
    public func hideIcon() {
        iconImageView.image = nil
    }
}


private extension ButtonIcon {
    
    func setupIcon(image: UIImage) {
        parentView.backgroundColor = .clear
        parentView.layer.cornerRadius = parentView.layer.bounds.width / 2
        parentView.addSubview(iconImageView)
        parentView.isUserInteractionEnabled = false
        parentView.translatesAutoresizingMaskIntoConstraints = false
        
        iconImageView.image = image.withRenderingMode(.alwaysTemplate)
        iconImageView.isUserInteractionEnabled = false
        iconImageView.center = parentView.center
        iconImageView.isUserInteractionEnabled = false
        
        self.addSubview(parentView)
    }
}
