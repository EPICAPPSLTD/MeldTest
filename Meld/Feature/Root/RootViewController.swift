//
//  RootViewController.swift
//  Meld
//
//  Created by Danny Bravo on 31/05/2023.
//

import Foundation
import UIKit
import Combine

final class RootViewController: UIViewController {
    
    //MARK: - Properties
    private let model: RootView.Model
    private let navigator: FowardNavigatorProtocol = PushNavigator()
    private var cancellables = [AnyCancellable]()
    private let normalOverlayController = OverlayViewController()
    private let interactiveOverlayController = InteractiveOverlayViewController()

    var castedView: RootView {
        return view as! RootView
    }
    
    //MARK: - Lifecycle
    init() {
        self.model = RootView.Model(normalOverlay: normalOverlayController.model, interactiveOverlay: interactiveOverlayController.model)
        super.init(nibName: String(describing: Self.self), bundle: nil)
        self.model.controller = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.embed(controller: normalOverlayController, in: castedView.normalOverlay)
        self.embed(controller: interactiveOverlayController, in: castedView.interactiveOverlay)
        self.setupObservers()
    }
        
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    deinit {
        cancellables.cancel()
    }
    
    //MARK: - reactive
    private func setupObservers() {
        model.$state
            .removeDuplicates()
            .sink { [weak self] state in
                self?.castedView.layout(state: state, animated: true)
            }.store(in: &cancellables)
    }
    
    //MARK: - Interaction
    @IBAction func menuTap() {
        model.menuTap()
    }
    
    @IBAction func menu(pan: UIPanGestureRecognizer) {
        model.menu(pan: pan)
    }
    
    @IBAction func menu(longPress: UILongPressGestureRecognizer) {
        model.menu(longPress: longPress)
    }
    
    //MARK: - Navigation
    func navigate(to feature: FeatureKey) {
        let placeholder = PlaceholderViewController(feature: feature)
        navigator.navigate(from: self, to: placeholder, animated: true, onCompletion: { [weak self] in
            self?.model.state = .off
        })
    }

    
}
