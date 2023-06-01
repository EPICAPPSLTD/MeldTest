//
//  UIViewController+ExtensionsTests.swift
//  MeldTests
//
//  Created by Danny Bravo on 01/06/2023.
//

import XCTest
@testable import Meld

final class UIViewController_ExtensionsTests: XCTestCase {

    //MARK: - Tests
    func testEmbedViewController() {
        let parentVC = UIViewController()
        let childVC = UIViewController()
        let view = parentVC.view!
        parentVC.embed(controller: childVC, in: view)
        XCTAssertTrue(parentVC.children.contains(childVC))
        XCTAssertTrue(view.subviews.contains(childVC.view))
        XCTAssertEqual(childVC.view.frame, view.bounds)
        XCTAssertFalse(childVC.view.translatesAutoresizingMaskIntoConstraints)
    }

}
