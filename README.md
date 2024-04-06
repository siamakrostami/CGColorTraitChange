# CGColorTraitChange

`CGColorTraitChange` is a project aimed at simplifying the handling of `CGColor` during trait changes in iOS applications. Additionally, it includes a theme manager designed to seamlessly manage system, dark, and light modes.

## Features

- **CGColorTraitChange**: Facilitates easy handling of `CGColor` during trait changes, ensuring consistent color rendering across various interface styles.
- **Theme Manager**: Provides a robust solution for managing themes in iOS applications, including support for system, dark, and light modes.
- **Customization**: Allows for easy customization of colors based on different interface styles without cluttering your codebase.

## Installation

1. Clone or download the project from [GitHub](https://github.com/siamakrostami/CGColorTraitChange).

## Example

```swift
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

extension BaseViewController {
    //MARK: - Handle border color during trait change
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        if traitCollection.hasDifferentColorAppearance(comparedTo: previousTraitCollection) {
            applicationDataContainer.currentTrait = .current
            applicationDataContainer.currentTheme = applicationDataContainer.currentTrait.userInterfaceStyle
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
```
