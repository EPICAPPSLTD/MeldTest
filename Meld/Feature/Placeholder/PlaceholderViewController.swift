//
//  UIViewController.swift
//  Meld
//
//  Created by Danny Bravo on 31/05/2023.
//

import Foundation
import UIKit

final class PlaceholderViewController: UIViewController {
    
    //MARK: - Properties
    let feature: FeatureKey
    
    var castedView: PlaceholderView {
        return view as! PlaceholderView
    }
    
    //MARK: - Lifecycle
    init(feature: FeatureKey) {
        self.feature = feature
        super.init(nibName: String(describing: Self.self), bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = NSLocalizedString("Feature", comment: "")
        castedView.label.text = feature.displayString()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
}
