//
//  Buttons.swift
//  DesignSystem
//
//  Created by Erick Kaique Da Silva on 06/02/20.
//  Copyright © 2020 Erick Kaique Da Silva. All rights reserved.
//

import UIKit

public enum DSButtonType {
    case blue
    case green
    case red
    case yellow
}

public enum DSButtonStyle {
    case small
    case medium
    case larger
    
    
    var height: Float {
        switch self {
        case .small: return 32
        case .medium: return 48
        case .larger: return 62
        }
    }
}

public class DSButton: DSLoadableButton {
    
    private var style: DSButtonStyle
    
    override open class var layerClass: AnyClass { return CAGradientLayer.self }
    
    override public var isEnabled: Bool {
        didSet {
            setupUI()
        }
    }
    
    public var type: DSButtonType {
        didSet {
            setupUI()
        }
    }
    
    /// init
    /// - Parameter type: type of the button
    /// - Parameter title: title of the button
    /// - Parameter style: style of the button, `ButtonStyle.medium` is default
    /// - Parameter frame: frame of the button, .zero is default
    /// - Parameter edgeInsets: edges of the button, default 0
    public init(type: DSButtonType, title: String,
                style: DSButtonStyle = .medium, frame: CGRect = .zero,
                edfeInsets: UIEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)) {
        self.type = type
        self.style = style
        super.init(frame: frame)
        setTitle(title, for: .normal)
        self.contentEdgeInsets = edfeInsets
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        clearPreviousSetup()
        layer.cornerRadius = CGFloat(style.height / 2.0)
        setupTitle()
        setupBackground()
        setupActivityIndicator()
        
    }
        
    private func clearPreviousSetup() {
        backgroundColor = .clear
        layer.borderColor = UIColor.clear.cgColor
        layer.borderWidth = 0
        guard let gradientLayer = layer as? CAGradientLayer else { return }
        gradientLayer.colors = [UIColor.clear.cgColor]
    }
    
    private func setupDisableBackground() {
        switch type {
        case .primary:
            guard let gradientLayer = layer as? CAGradientLayer else { return }
            gradientLayer.colors = [UIColor.red]
        case .primaryDark:
            guard let gradientLayer = layer as? CAGradientLayer else { return }
            gradientLayer.colors = [UIColor.orange]
        case .secundary, .secundaryDark:
            backgroundColor = .clear
            layer.borderColor = UIColor.blue.cgColor
            layer.borderWidth = 1
        }
    }
    
    private func setupTitle() {
        switch type {
        case .blue, .green, .red, .yellow:
            setTitleColor(DSColors.witheDefault, for: .normal)
        }
    }
    
    private func setupBackground() {
        guard let gradientLayer = layer as? CAGradientLayer else { return }
        gradientLayer.colors = []
        
        switch type {
        case .blue:
            gradientLayer.colors = [DSColors.blueDefault.cgColor]
        case .green:
            gradientLayer.colors = [DSColors.greenDefault.cgColor]
        case .red:
            gradientLayer.colors = [DSColors.redDefault.cgColor]
        case .yellow:
            gradientLayer.colors = [DSColors.yellowDefault.cgColor]
        }
    }
    
    private func setupActivityIndicator() {
        switch type {
        case .blue, .green, .red, .yellow:
            activityIndicatorColor = DSColors.grayDefault
        }
    }
    
    private func updateState() {
        if isEnabled {
            setupBackground()
        } else if !isLoading {
            setupDisableBackground()
        }
    }
    
    private func addConstraint() {
        layout.applyConstraint { view in
            view.height(style.height)
        }
    }
    
    public func setButtonTitle(title: String) {
        setTitle(title, for: .normal)
    }
    
    public func setButtonType(type: DSButtonType = .primary) {
        self.type = type
        self.setupUI()
    }
}
