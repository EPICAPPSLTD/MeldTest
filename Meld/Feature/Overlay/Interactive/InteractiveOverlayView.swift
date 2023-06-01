//
//  InteractiveOverlayView.swift
//  Meld
//
//  Created by Danny Bravo on 01/06/2023.
//

import Foundation
import UIKit
import Combine

final class InteractiveOverlayView: UIView {
        
    //MARK: - Outlets
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var labelYConstraint: NSLayoutConstraint!
    @IBOutlet var buttons: [CircleView]!
    @IBOutlet var buttonXConstraints: [NSLayoutConstraint]!
    @IBOutlet var buttonYConstraints: [NSLayoutConstraint]!
    private(set) var isAvailableForInteractions: Bool = false
    
    //MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setupLabel()
        self.setupButtons()
        self.layout(isActive: false, animated: false)
    }
    
    //MARK: - Setup
    private func setupLabel() {
        let yPos = self.yPositions()
        labelYConstraint.constant = yPos[2] - 100
        label.text = ""
    }
    
    private func setupButtons() {
        for button in buttons {
            button.alpha = 0
            let image = FeatureKey(rawValue: button.tag)?.image()
            button.imageView.image = image
            button.anchorPoint = CGPoint(x: 0.5, y: 1)
        }
    }
    
    //MARK: - Layout
    func layout(isActive: Bool, animated: Bool) {
        switch isActive {
        case true:
            self.layoutActive(animated: animated)
        case false:
            self.layoutInactive(animated: animated)
        }
    }
    
    func highlight(circle: CircleView?) {
        UIView.animate(withDuration: 0.3,
                       delay: 0,
                       usingSpringWithDamping: 0.6,
                       initialSpringVelocity: 0.5,
                       options: [.beginFromCurrentState, .curveEaseInOut],
                       animations: { [weak self] in
            guard let self = self else { return }
            for button in buttons {
                if button == circle {
                    button.transform = .init(scaleX: 1.5, y: 1.5)
                } else {
                    button.transform = .identity
                }
            }
        },
                       completion: nil)
        UIView.transition(with: label,
                          duration: 0.3,
                          options: [.transitionCrossDissolve, .beginFromCurrentState, .curveEaseInOut],
                          animations: { [weak self] in
            guard let self = self else { return }
            self.label.text = FeatureKey(rawValue: circle?.tag ?? -1)?.displayString() ?? ""
        },
                          completion: nil)
    }
    
    private func layoutActive(animated: Bool) {
        let xPos = self.xPositions()
        for (index, contraint) in buttonXConstraints.enumerated() {
            contraint.constant = xPos[index]
        }
        let yPos = self.yPositions()
        for (index, contraint) in buttonYConstraints.enumerated() {
            contraint.constant = yPos[index]
        }
        UIView.animate(withDuration: 0.4,
                       delay: 0.2,
                       usingSpringWithDamping: 0.6,
                       initialSpringVelocity: 0.5,
                       options: [.beginFromCurrentState, .curveEaseInOut],
                       animations: { [weak self] in
            guard let self = self else { return }
            self.layoutIfNeeded()
            for button in buttons {
                button.alpha = 1
            }
        },
                       completion: { [weak self] _ in
            self?.isAvailableForInteractions = true
        })
    }
    
    private func layoutInactive(animated: Bool) {
        for constaint in buttonXConstraints {
            constaint.constant = 0
        }
        for constaint in buttonYConstraints {
            constaint.constant = 0
        }
        UIView.animate(withDuration: 0.3,
                       delay: 0,
                       options: [.beginFromCurrentState, .curveEaseInOut],
                       animations: { [weak self] in
            guard let self = self else { return }
            self.layoutIfNeeded()
            for button in buttons {
                button.alpha = 0
            }
        },
                       completion: { [weak self] _ in
            self?.isAvailableForInteractions = false
        })
    }
    
}

//MARK: - OverlayViewLayoutProtocol
extension InteractiveOverlayView: OverlayViewLayoutProtocol {}
