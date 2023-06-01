//
//  RootViewModelTests.swift
//  MeldTests
//
//  Created by Danny Bravo on 01/06/2023.
//

import XCTest
@testable import Meld

final class RootViewModelTests: XCTestCase {

    //MARK: - Properties
    private var model: RootView.Model!
    private var normalOverlay: OverlayView.Model!
    private var interactiveOverlay: InteractiveOverlayView.Model!
    
    //MARK: - Setup
    override func setUp() {
        super.setUp()
        normalOverlay = OverlayView.Model() // make sure to properly initialize
        interactiveOverlay = InteractiveOverlayView.Model() // make sure to properly initialize
        model = RootView.Model(normalOverlay: normalOverlay, interactiveOverlay: interactiveOverlay)
    }
    
    override func tearDown() {
        model = nil
        normalOverlay = nil
        interactiveOverlay = nil
        super.tearDown()
    }

    //MARK: - Tests
    func testInitialState() {
        XCTAssertEqual(model.state, .off)
        XCTAssertEqual(model.normalOverlay.isActive, false)
        XCTAssertEqual(model.interactiveOverlay.isActive, false)
    }

    func testUpdateStateToOn() {
        model.state = .on
        XCTAssertEqual(model.state, .on)
        XCTAssertEqual(model.normalOverlay.isActive, true)
        XCTAssertEqual(model.interactiveOverlay.isActive, false)
    }

    func testUpdateStateToOff() {
        model.state = .on
        model.state = .off
        XCTAssertEqual(model.state, .off)
        XCTAssertEqual(model.normalOverlay.isActive, false)
        XCTAssertEqual(model.interactiveOverlay.isActive, false)
    }

    func testUpdateStateToInteractive() {
        model.state = .interactive
        XCTAssertEqual(model.state, .interactive)
        XCTAssertEqual(model.normalOverlay.isActive, false)
        XCTAssertEqual(model.interactiveOverlay.isActive, true)
    }

    func testMenuTap() {
        model.menuTap()
        XCTAssertEqual(model.state, .on)
        XCTAssertEqual(model.normalOverlay.isActive, true)
        XCTAssertEqual(model.interactiveOverlay.isActive, false)
    }

    func testMenuPanGestureBeganState() {
        let pan = MockPanGestureRecognizer()
        pan.state = .began
        model.menu(pan: pan)
        XCTAssertEqual(model.state, .interactive)
    }

    func testMenuPanGestureEndedState() {
        // Assuming there is no detectable feature in the interactiveOverlay
        let pan = MockPanGestureRecognizer()
        pan.state = .ended
        model.menu(pan: pan)
        XCTAssertEqual(model.state, .off)
    }
    
    func testMenuPanGestureCancelledState() {
        // Assuming there is no detectable feature in the interactiveOverlay
        let pan = MockPanGestureRecognizer()
        pan.state = .cancelled
        model.menu(pan: pan)
        XCTAssertEqual(model.state, .off)
    }
    
    func testMenuLongPressGestureBeganState() {
        let longPress = MockLongPressGestureRecognizer()
        longPress.state = .began
        model.menu(longPress: longPress)
        XCTAssertEqual(model.state, .interactive)
    }

    func testMenuLongPressGestureEndedState() {
        // Assuming there is no detectable feature in the interactiveOverlay
        let longPress = MockLongPressGestureRecognizer()
        longPress.state = .ended
        model.menu(longPress: longPress)
        XCTAssertEqual(model.state, .off)
    }
    
    func testMenuLongPressGestureCancelledState() {
        // Assuming there is no detectable feature in the interactiveOverlay
        let longPress = MockLongPressGestureRecognizer()
        longPress.state = .cancelled
        model.menu(longPress: longPress)
        XCTAssertEqual(model.state, .off)
    }

}
