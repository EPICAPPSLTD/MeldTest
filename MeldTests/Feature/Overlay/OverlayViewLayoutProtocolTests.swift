//
//  OverlayViewLayoutProtocolTests.swift
//  MeldTests
//
//  Created by Danny Bravo on 01/06/2023.
//

import XCTest
@testable import Meld

//MARK: - Mocks
private final class MockOverlayView: OverlayViewLayoutProtocol {}

final class OverlayViewLayoutProtocolTests: XCTestCase {

    //MARK: - Properties
    private var mockOverlayView: MockOverlayView!

    //MARK: - Setup
    override func setUp() {
        super.setUp()
        mockOverlayView = MockOverlayView()
    }

    override func tearDown() {
        mockOverlayView = nil
        super.tearDown()
    }

    //MARK: - Tests
    func testYPositions() {
        let expectedValues: [CGFloat] = [-50, -65, -70, -65, -50]
        XCTAssertEqual(mockOverlayView.yPositions(), expectedValues)
    }

    func testXPositions() {
        let section = UIScreen.main.bounds.width / 5.5
        let expectedValues = [-section*2, -section, 0, section, section*2]
        XCTAssertEqual(mockOverlayView.xPositions(), expectedValues)
    }

}
