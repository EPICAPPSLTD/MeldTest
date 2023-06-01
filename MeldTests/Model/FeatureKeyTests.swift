//
//  FeatureKeyTests.swift
//  MeldTests
//
//  Created by Danny Bravo on 01/06/2023.
//

import XCTest
@testable import Meld

final class FeatureKeyTests: XCTestCase {

    //MARK: - Tests
    func testDisplayString() {
        XCTAssertEqual(FeatureKey.stake.displayString(), NSLocalizedString("Stake", comment: ""))
        XCTAssertEqual(FeatureKey.send.displayString(), NSLocalizedString("Send", comment: ""))
        XCTAssertEqual(FeatureKey.receive.displayString(), NSLocalizedString("Receive", comment: ""))
        XCTAssertEqual(FeatureKey.supply.displayString(), NSLocalizedString("Supply", comment: ""))
        XCTAssertEqual(FeatureKey.borrow.displayString(), NSLocalizedString("Borrow", comment: ""))
    }
    
    func testImage() {
        let configuration = UIImage.SymbolConfiguration(pointSize: 16, weight: .semibold, scale: .large)
        XCTAssertEqual(FeatureKey.stake.image(), UIImage(systemName: "archivebox")?.applyingSymbolConfiguration(configuration))
        XCTAssertEqual(FeatureKey.send.image(), UIImage(systemName: "arrow.up")?.applyingSymbolConfiguration(configuration))
        XCTAssertEqual(FeatureKey.receive.image(), UIImage(systemName: "arrow.down")?.applyingSymbolConfiguration(configuration))
        XCTAssertEqual(FeatureKey.supply.image(), UIImage(systemName: "bitcoinsign.circle")?.applyingSymbolConfiguration(configuration))
        XCTAssertEqual(FeatureKey.borrow.image(), UIImage(systemName: "hand.thumbsup")?.applyingSymbolConfiguration(configuration))
    }

}
