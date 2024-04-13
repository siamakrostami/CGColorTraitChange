//
//  BaseViewController.swift
//  CGColorTraitChange
//
//  Created by Siamak on 4/2/24.
//

import UIKit

class BaseViewController: UIViewController {
    @Inject private var applicationDataContainer: ApplicationDataContainer

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}

extension BaseViewController {
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        if traitCollection.hasDifferentColorAppearance(comparedTo: previousTraitCollection) {
            view.window?.overrideUserInterfaceStyle = ThemeStore.theme.getUserInterfaceStyle()
            view.allSubviews().forEach { [weak self] in
                guard let _ = self else {
                    return
                }
                if $0.layer.borderColor != nil, $0.layer.borderColor != UIColor.clear.cgColor {
                    let border = UIColor(cgColor: $0.layer.borderColor ?? UIColor.clear.cgColor)
                    let color = Colors.convertHexToColor(hex: border.hexString())
                    $0.layer.borderColor = color.resolvedColor(with: .current).cgColor
                }
            }
        }
    }
}
