//
//  OverlayViewModel.swift
//  Meld
//
//  Created by Danny Bravo on 31/05/2023.
//

import Foundation
import Combine
import UIKit

extension OverlayView {
    
    final class Model: ObservableObject {
    
        //MARK: - Properties
        weak var delegate: OverlayViewModelDelegate?
        @Published var isActive: Bool = false
        
        //MARK:  - Interaction
        func closeTapped() {
            isActive = false
            delegate?.overlayViewControllerDidDismiss()
        }
        
        func featureTapped(tag: Int) {
            guard let feature = FeatureKey(rawValue: tag) else {
                assertionFailure("Feature CircleButton tag is not correctly mapped: \(tag)")
                return
            }
            delegate?.overlayViewControllerRequestedNavigation(to: feature)
        }

    }
    

}
