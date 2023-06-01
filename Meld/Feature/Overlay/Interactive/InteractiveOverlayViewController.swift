//
//  InteractiveOverlayViewController.swift
//  Meld
//
//  Created by Danny Bravo on 01/06/2023.
//

import Foundation
import UIKit
import Combine

final class InteractiveOverlayViewController: UIViewController {
    
    //MARK: - Properties
    let model = InteractiveOverlayView.Model()
    private var cancellables = [AnyCancellable]()

    var castedView: InteractiveOverlayView {
        return view as! InteractiveOverlayView
    }
    
    //MARK: - Lifecycle
    init() {
        super.init(nibName: String(describing: Self.self), bundle: nil)
        model.controller = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        cancellables.cancel()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupObservers()
    }
    
    //MARK: - Reactive
    private func setupObservers() {
        model.$isActive
            .removeDuplicates()
            .sink { [weak self] isActive in
                self?.castedView.layout(isActive: isActive, animated: true)
            }.store(in: &cancellables)
        model.$activeCircle
            .removeDuplicates()
            .sink { [weak self] circle in
                self?.castedView.highlight(circle: circle)
            }.store(in: &cancellables)
    }
    
}
