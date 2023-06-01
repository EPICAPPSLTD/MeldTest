//
//  OverlayViewModelDelegate.swift
//  Meld
//
//  Created by Danny Bravo on 01/06/2023.
//

import Foundation

//MARK: - Protocol
protocol OverlayViewModelDelegate: AnyObject {
    func overlayViewControllerRequestedNavigation(to feature: FeatureKey)
    func overlayViewControllerDidDismiss()
}
