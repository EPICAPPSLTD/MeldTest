//
//  Array+Cancellable+Extensions.swift
//  Meld
//
//  Created by Danny Bravo on 31/05/2023.
//

import Foundation
import Combine

extension Array where Self.Element: Cancellable {
    
    //MARK: - Utility
    func cancel() {
        for item in self {
            item.cancel()
        }
    }
    
}
