//
//  PushNavigator.swift
//  Meld
//
//  Created by Danny Bravo on 31/05/2023.
//

import Foundation
import UIKit

struct PushNavigator {}

//MARK: - FowardNavigatorProtocol
extension PushNavigator: FowardNavigatorProtocol {
    
    func navigate(fromNavigation: UINavigationController, to: UIViewController, animated: Bool = true, onCompletion: (()->())? = nil) {
        fromNavigation.pushViewController(to, animated: true)
        if let onCompletion {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                onCompletion()
            }
        }
    }
    
    func navigate(from: UIViewController, to: UIViewController, animated: Bool = true, onCompletion: (()->())? = nil) {
        if let from = from.navigationController {
            self.navigate(fromNavigation: from, to: to, animated: animated, onCompletion: onCompletion)
            return
        } else if let from = from as? UINavigationController {
            self.navigate(fromNavigation: from, to: to, animated: animated, onCompletion: onCompletion)
            return
        }
    }
    
}
