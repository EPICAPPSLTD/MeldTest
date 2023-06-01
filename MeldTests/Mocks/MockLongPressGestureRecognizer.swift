//
//  MockLongPressGestureRecognizer.swift
//  MeldTests
//
//  Created by Danny Bravo on 01/06/2023.
//

import Foundation
import UIKit

final class MockLongPressGestureRecognizer: UILongPressGestureRecognizer {
    
    //MARK: - Properties
    private var testState: UIGestureRecognizer.State = .ended

    override var state: UIGestureRecognizer.State {
        get {
            return testState
        }
        set {
            testState = newValue
        }
    }
    
}
