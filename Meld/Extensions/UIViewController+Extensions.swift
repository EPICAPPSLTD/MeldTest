//
//  UIViewController+Extensions.swift
//  Meld
//
//  Created by Danny Bravo on 01/06/2023.
//

import Foundation
import UIKit

extension UIViewController {
    
    //MARK: - Child View Controllers
    func embed(controller: UIViewController, in view: UIView) {
        controller.view.translatesAutoresizingMaskIntoConstraints = false
        self.addChild(controller)
        controller.view?.frame = view.bounds
        view.add(subview: controller.view)
        controller.didMove(toParent: self)
    }
    
}
