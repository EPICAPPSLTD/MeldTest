//
//  OverlayViewModelTests.swift
//  MeldTests
//
//  Created by Danny Bravo on 01/06/2023.
//

import XCTest
@testable import Meld

//MARK: - Mocks
private final class MockOverlayViewModelDelegate: OverlayViewModelDelegate {
   
    var didDismiss = false
    var navigatedFeature: FeatureKey?

    func overlayViewControllerDidDismiss() {
        didDismiss = true
    }
    
    func overlayViewControllerRequestedNavigation(to feature: FeatureKey) {
        navigatedFeature = feature
    }
    
}

final class OverlayViewModelTests: XCTestCase {

    //MARK: - Properties
    private var model: OverlayView.Model!
    private var delegate: MockOverlayViewModelDelegate!
    
    //MARK: - Setup
    override func setUp() {
        super.setUp()
        delegate = MockOverlayViewModelDelegate()
        model = OverlayView.Model()
        model.delegate = delegate
    }
    
    override func tearDown() {
        model = nil
        delegate = nil
        super.tearDown()
    }
    
    //MARK: - Tests
    func testCloseTapped() {
        model.isActive = true
        model.closeTapped()
        XCTAssertEqual(model.isActive, false)
        XCTAssertTrue(delegate.didDismiss)
    }
    
    func testFeatureTapped() {
        let testTag = FeatureKey.borrow.rawValue
        model.featureTapped(tag: testTag)
        XCTAssertEqual(delegate.navigatedFeature, .borrow)
    }

}
