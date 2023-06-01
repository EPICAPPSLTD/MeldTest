//
//  CircleButton.swift
//  Meld
//
//  Created by Danny Bravo on 31/05/2023.
//

import Foundation
import UIKit

final class CircleButton: UIButton {
    
    //MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = .red
        self.set(cornerRadius: self.frame.size.width/2)
        self.set(shadowRadius: 25)
    }
    
}
