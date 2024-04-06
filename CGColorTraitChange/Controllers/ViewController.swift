//
//  ViewController.swift
//  CGColorTraitChange
//
//  Created by Siamak on 4/2/24.
//

import UIKit

class ViewController: BaseViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        layoutView()
        // Do any additional setup after loading the view.
    }
    
    private lazy var segmentedController: UISegmentedControl = {
        let segmentedController = UISegmentedControl(items: ["Default", "Light", "Dark"])
        segmentedController.translatesAutoresizingMaskIntoConstraints = false
        segmentedController.selectedSegmentIndex = ThemeStore.theme.rawValue
        segmentedController.addTarget(self, action: #selector(segmentedControlValueChanged(_:)), for: .valueChanged)
        return segmentedController
    }()
    
    private lazy var mainView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .lightGray
        view.clipsToBounds = true
        view.layer.cornerRadius = 8
        view.layer.borderColor = Colors.Border.resolvedColor(with: .current).cgColor
        view.layer.borderWidth = 5
        return view
    }()
}

extension ViewController {
    private func layoutView() {
        view.addSubview(segmentedController)
        view.addSubview(mainView)
        
        segmentedController.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        segmentedController.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16).isActive = true
        
        mainView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        mainView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        mainView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9).isActive = true
        mainView.heightAnchor.constraint(equalTo: mainView.widthAnchor).isActive = true
    }
    
    @objc private func segmentedControlValueChanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
            case 0:
                ThemeStore.theme = .device
            case 1:
                ThemeStore.theme = .light
            default:
                ThemeStore.theme = .dark
        }
        overrideUserInterfaceStyle = ThemeStore.theme.getUserInterfaceStyle()
    }
}
