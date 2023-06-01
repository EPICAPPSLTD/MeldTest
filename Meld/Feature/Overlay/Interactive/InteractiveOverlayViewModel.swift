//
//  InteractiveOverlayViewModel.swift
//  Meld
//
//  Created by Danny Bravo on 01/06/2023.
//

import Foundation
import Combine
import UIKit

extension InteractiveOverlayView {
    
    final class Model: ObservableObject {
    
        //MARK: - Properties
        @Published var isActive: Bool = false {
            didSet {
                if oldValue != isActive,
                   !isActive {
                    self.activeCircle = nil
                }
            }
        }
        @Published var activeCircle: CircleView? = nil
        weak var controller: InteractiveOverlayViewController?
        
        //MARK:  - Interaction
        func update(gesture: UIGestureRecognizer) {
            self.activeCircle = self.target(for: gesture)
        }
        
        func detectFeature(gesture: UIGestureRecognizer) -> FeatureKey? {
            if let target = self.target(for: gesture),
               let feature = FeatureKey(rawValue: target.tag) {
                self.activeCircle = target
                return feature
            }
            self.activeCircle = nil
            return nil
        }
        
        private func target(for gesture: UIGestureRecognizer) -> CircleView? {
            guard let view = controller?.castedView, view.isAvailableForInteractions else {
                return nil
            }
            let location = gesture.location(in: view)
            let event: UIEvent? = nil
            return view.hitTest(location, with: event) as? CircleView
        }

    }
    

}
