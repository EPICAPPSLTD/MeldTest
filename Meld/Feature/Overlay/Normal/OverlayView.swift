//
//  OverlayView.swift
//  Meld
//
//  Created by Danny Bravo on 31/05/2023.
//

import Foundation
import UIKit
import Combine

final class OverlayView: UIView {
        
    //MARK: - Outlets
    @IBOutlet weak var dismissButton: CircleButton!
    @IBOutlet var labels: [UILabel]!
    @IBOutlet var buttons: [CircleButton]!
    @IBOutlet var labelXConstraints: [NSLayoutConstraint]!
    @IBOutlet var labelYConstraints: [NSLayoutConstraint]!
    @IBOutlet var buttonXConstraints: [NSLayoutConstraint]!
    @IBOutlet var buttonYConstraints: [NSLayoutConstraint]!

    //MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setupLabels()
        self.setupButtons()
        self.layout(isActive: false, animated: false)
    }
    
    //MARK: - Setup
    private func setupLabels() {
        for label in labels {
            if let key = FeatureKey(rawValue: label.tag) {
                label.text = key.displayString()
            }
        }
        let xPos = self.xPositions()
        for (index, constraint) in labelXConstraints.enumerated() {
            constraint.constant = xPos[index]
        }
        let yPos = self.yPositions()
        for (index, constraint) in labelYConstraints.enumerated() {
            constraint.constant = yPos[index] - 40
        }
    }
    
    private func setupButtons() {
        for button in buttons {
            button.alpha = 0
            let image = FeatureKey(rawValue: button.tag)?.image()
            button.setImage(image, for: .normal)
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
                       completion: nil)
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
                       completion: nil)
    }
    
}

//MARK: - OverlayViewLayoutProtocol
extension OverlayView: OverlayViewLayoutProtocol {}
