//
//  FowardNavigatorProtocol.swift
//  Meld
//
//  Created by Danny Bravo on 31/05/2023.
//

import Foundation
import UIKit

//MARK: - Protocol
protocol FowardNavigatorProtocol {
    func navigate(from controller: UIViewController, to: UIViewController, animated: Bool, onCompletion: (()->())?)
    func navigate(fromNavigation controller: UINavigationController, to: UIViewController, animated: Bool, onCompletion: (()->())?)
}
