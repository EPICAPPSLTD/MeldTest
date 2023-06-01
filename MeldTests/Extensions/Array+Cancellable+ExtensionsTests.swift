//
//  Array+AnyCancellable+ExtensionsTests.swift
//  MeldTests
//
//  Created by Danny Bravo on 01/06/2023.
//

import XCTest
import Combine
@testable import Meld

//MARK: - Mocks
private final class MockCancellable: Cancellable {
    
    private(set) var didCancel = false
    
    func cancel() {
        didCancel = true
    }
    
}

final class Array_AnyCancellable_ExtensionsTests: XCTestCase {

    //MARK: - Tests
    func testCancellAll() {
        let array = [MockCancellable(), MockCancellable(), MockCancellable()]
        for item in array {
            XCTAssertFalse(item.didCancel)
        }
        array.cancel()
        for item in array {
            XCTAssertTrue(item.didCancel)
        }
    }

}
