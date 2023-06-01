//
//  UIView+ExtensionsTests.swift
//  MeldTests
//
//  Created by Danny Bravo on 01/06/2023.
//

import XCTest
@testable import Meld

final class UIView_ExtensionsTests: XCTestCase {

    //MARK: - Tests
    func testCornerRadius() {
        let view = UIView()
        view.set(cornerRadius: 10)
        XCTAssertEqual(view.layer.cornerRadius, 10)
    }

    func testShadowRadiusAndOpacity() {
        let view = UIView()
        view.set(shadowRadius: 5, opacity: 0.3)
        XCTAssertEqual(view.layer.shadowRadius, 5)
        XCTAssertEqual(view.layer.shadowOpacity, 0.3)
        XCTAssertEqual(view.layer.shadowColor, UIColor.black.cgColor)
    }

    func testAddSubviewWithConstraints() {
        let parentView = UIView()
        let childView = UIView()
        parentView.add(subview: childView, contraints: UIEdgeInsets(top: 5, left: 10, bottom: 15, right: 20))
        XCTAssertTrue(parentView.subviews.contains(childView))
        
        let constraints = parentView.constraints
        let topConstraint = constraints.first { $0.firstAttribute == .top }
        let bottomConstraint = constraints.first { $0.firstAttribute == .bottom }
        let leadingConstraint = constraints.first { $0.firstAttribute == .leading }
        let trailingConstraint = constraints.first { $0.firstAttribute == .trailing }
        XCTAssertEqual(topConstraint?.constant, 5)
        XCTAssertEqual(bottomConstraint?.constant, -15) // The constant of bottom and trailing constraints should be negative
        XCTAssertEqual(leadingConstraint?.constant, 10)
        XCTAssertEqual(trailingConstraint?.constant, -20) // The constant of bottom and trailing constraints should be negative
    }

}
