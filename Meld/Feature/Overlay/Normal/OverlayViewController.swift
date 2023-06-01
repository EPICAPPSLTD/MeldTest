//
//  OverlayViewController.swift
//  Meld
//
//  Created by Danny Bravo on 31/05/2023.
//

import Foundation
import UIKit
import Combine

final class OverlayViewController: UIViewController {
    
    //MARK: - Properties
    let model = OverlayView.Model()
    private var cancellables = [AnyCancellable]()

    var castedView: OverlayView {
        return view as! OverlayView
    }
    
    //MARK: - Lifecycle
    init() {
        super.init(nibName: String(describing: Self.self), bundle: nil)
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
    }
    
    
    //MARK:  - Interaction
    @IBAction func closeTapped() {
        model.closeTapped()
    }
    
    @IBAction func featureTapped(button: UIButton) {
        model.featureTapped(tag: button.tag)
    }
    
}
