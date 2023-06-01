//
//  FeatureKey.swift
//  Meld
//
//  Created by Danny Bravo on 31/05/2023.
//

import Foundation
import UIKit

enum FeatureKey: Int {
    
    //MARK: - Cases
    case stake
    case send
    case receive
    case supply
    case borrow
    
    //MARK: - Utilites
    func displayString() -> String {
        //to allow for localization:
        switch self {
        case .stake:
            return NSLocalizedString("Stake", comment: "")
        case .send:
            return NSLocalizedString("Send", comment: "")
        case .receive:
            return NSLocalizedString("Receive", comment: "")
        case .supply:
            return NSLocalizedString("Supply", comment: "")
        case .borrow:
            return NSLocalizedString("Borrow", comment: "")
        }
    }
    
    func image() -> UIImage? {
        let image: UIImage?
        switch self {
        case .stake:
            image = UIImage(systemName: "archivebox")
        case .send:
            image = UIImage(systemName: "arrow.up")
        case .receive:
            image = UIImage(systemName: "arrow.down")
        case .supply:
            image = UIImage(systemName: "bitcoinsign.circle")
        case .borrow:
            image = UIImage(systemName: "hand.thumbsup")
        }
        let configuration = UIImage.SymbolConfiguration(pointSize: 16, weight: .semibold, scale: .large)
        return image?.applyingSymbolConfiguration(configuration)
    }
    
}
