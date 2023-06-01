//
//  OverlayViewLayoutProtocol.swift
//  Meld
//
//  Created by Danny Bravo on 31/05/2023.
//

import Foundation
import UIKit

//MARK: - Protocol
protocol OverlayViewLayoutProtocol {}

//MARK: - Utilities
extension OverlayViewLayoutProtocol {
    
    func yPositions() -> [CGFloat] {
        return [-50, -65, -70, -65, -50]
    }
    
    func xPositions() -> [CGFloat] {
        let section = UIScreen.main.bounds.width / 5.5
        return [-section*2, -section, 0, section, section*2]
    }
    
}
