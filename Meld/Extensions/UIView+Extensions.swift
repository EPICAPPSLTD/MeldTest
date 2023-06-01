//
//  UIView+Extensions.swift
//  Meld
//
//  Created by Danny Bravo on 01/06/2023.
//

import Foundation
import UIKit

extension UIView {
    
    //MARK: - Layers
    func set(cornerRadius: CGFloat) {
        self.layer.cornerRadius = cornerRadius
    }
    
    func set(shadowRadius: CGFloat, opacity: Float = 0.5) {
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = opacity
        self.layer.shadowRadius = shadowRadius
    }
    
    //MARK: - Constraints
    func add(subview: UIView, contraints: UIEdgeInsets = .zero) {
        self.addSubview(subview)
        NSLayoutConstraint.activate([
            subview.topAnchor.constraint(equalTo: self.topAnchor, constant: contraints.top),
            subview.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -contraints.bottom),
            subview.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: contraints.left),
            subview.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -contraints.right)
        ])
    }
    
}
