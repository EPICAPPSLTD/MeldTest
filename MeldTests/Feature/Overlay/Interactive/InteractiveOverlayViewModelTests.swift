//
//  InteractiveOverlayViewModelTests.swift
//  MeldTests
//
//  Created by Danny Bravo on 01/06/2023.
//

import XCTest
@testable import Meld

final class InteractiveOverlayViewModelTests: XCTestCase {
    
    //MARK: - Properties
    private var model: InteractiveOverlayView.Model!
    
    //MARK: - Setup
    override func setUp() {
        super.setUp()
        model = InteractiveOverlayView.Model()
    }
    
    override func tearDown() {
        model = nil
        super.tearDown()
    }
    
    //MARK: - Tests
    func testIsActive() {
        model.isActive = true
        model.activeCircle = CircleView()
        XCTAssertNotNil(model.activeCircle)
        
        model.isActive = false
        XCTAssertNil(model.activeCircle)
    }
    
    func testUpdateGesture() {
        model.activeCircle = CircleView()
        let gesture = MockPanGestureRecognizer()
        model.update(gesture: gesture)
        XCTAssertNil(model.activeCircle)
    }
    
    func testDetectFeature() {
        model.activeCircle = CircleView()
        let gesture = MockPanGestureRecognizer()
        let feature = model.detectFeature(gesture: gesture)
        XCTAssertNil(feature)
        XCTAssertNil(model.activeCircle)
    }
    
}
