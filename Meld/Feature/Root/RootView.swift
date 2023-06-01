//
//  RootView.swift
//  Meld
//
//  Created by Danny Bravo on 31/05/2023.
//

import Foundation
import UIKit
import Combine

final class RootView: UIView {
        
    //MARK: - Outlets
    @IBOutlet weak var interactiveOverlay: UIView!
    @IBOutlet weak var normalOverlay: UIView!
    @IBOutlet weak var menuButton: CircleView!

    //MARK: - lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layout(state: .off, animated: false)
    }
    
    //MARK: - Layout
    func layout(state: StateKey, animated: Bool) {
        UIView.animate(withDuration: 0.3,
                       delay: 0,
                       options: [.beginFromCurrentState, .curveEaseInOut],
                       animations: { [weak self] in
            guard let self = self else { return }
            switch state {
            case .on:
                self.layoutOn(animated: animated)
            case .off:
                self.layoutOff(animated: animated)
            case .interactive:
                self.layoutInteractive(animated: animated)
            }
        },
                       completion: nil)
    }
    
    private func layoutOn(animated: Bool) {
        self.interactiveOverlay.alpha = 0
        self.normalOverlay.alpha = 1
        self.menuButton.alpha = 0
    }
    
    private func layoutOff(animated: Bool) {
        self.interactiveOverlay.alpha = 0
        self.normalOverlay.alpha = 0
        self.menuButton.alpha = 1
    }
    
    private func layoutInteractive(animated: Bool) {
        self.interactiveOverlay.alpha = 1
        self.normalOverlay.alpha = 0
        self.menuButton.alpha = 0
    }
    
}
