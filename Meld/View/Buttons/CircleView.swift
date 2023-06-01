//
//  CircleView.swift
//  Meld
//
//  Created by Danny Bravo on 31/05/2023.
//

import Foundation
import UIKit

final class CircleView: UIView {
    
    //MARK: - Outlets
    @IBOutlet weak var imageView: UIImageView!
    
    //MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = .red
        self.set(cornerRadius: self.frame.size.width/2)
        self.set(shadowRadius: 25)
    }
    
}
