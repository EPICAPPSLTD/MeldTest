//
//  RootViewModel.swift
//  Meld
//
//  Created by Danny Bravo on 31/05/2023.
//

import Foundation
import UIKit

extension RootView {
    
    final class Model: ObservableObject {
    
        //MARK: - Properties
        @Published var state: StateKey = .off {
            didSet {
                guard oldValue != state else {
                    return
                }
                self.update(state: state)
            }
        }
        let normalOverlay: OverlayView.Model
        let interactiveOverlay: InteractiveOverlayView.Model
        weak var controller: RootViewController?
        
        //MARK: - Lifecycle
        init(normalOverlay: OverlayView.Model, interactiveOverlay: InteractiveOverlayView.Model) {
            self.normalOverlay = normalOverlay
            self.interactiveOverlay = interactiveOverlay
            normalOverlay.delegate = self
        }
        
        //MARK: - State
        private func update(state: StateKey) {
            switch state {
            case .on:
                normalOverlay.isActive = true
                interactiveOverlay.isActive = false
            case .off:
                normalOverlay.isActive = false
                interactiveOverlay.isActive = false
            case .interactive:
                normalOverlay.isActive = false
                interactiveOverlay.isActive = true
            }
        }
        
        //MARK: - Interaction
        func menuTap() {
            state = .on
        }
        
        func menu(pan: UIPanGestureRecognizer) {
            self.handleInteractive(gesture: pan)
        }
        
        func menu(longPress: UILongPressGestureRecognizer) {
            self.handleInteractive(gesture: longPress)
        }
        
        private func handleInteractive(gesture: UIGestureRecognizer) {
            switch gesture.state {
            case .began:
                state = .interactive
            case .changed:
                interactiveOverlay.update(gesture: gesture)
            case .ended:
                if let feature = interactiveOverlay.detectFeature(gesture: gesture) {
                    controller?.navigate(to: feature)
                } else {
                    state = .off
                }
            case .cancelled:
                state = .off
            default:
                break
            }
        }

    }
    
}

//MARK: - OverlayViewModelDelegate
extension RootView.Model: OverlayViewModelDelegate {
    
    func overlayViewControllerRequestedNavigation(to feature: FeatureKey) {
        controller?.navigate(to: feature)
    }
    
    func overlayViewControllerDidDismiss() {
        state = .off
    }
    
}
