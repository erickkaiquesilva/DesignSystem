//
//  ButtonViewController.swift
//  DesignSystem
//
//  Created by Erick Kaique Da Silva on 06/02/20.
//  Copyright © 2020 Erick Kaique Da Silva. All rights reserved.
//

import UIKit

class ButtonViewController: UIViewController, DesignSystemComponent {
    
    var name: String = "Button"
    
    private lazy var contentView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .center
        stack.distribution = .equalSpacing
        stack.spacing = 8.0
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var scrollView = UIScrollView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        buildViewHierarchy()
        addConstraints()
    }
    
    func buildViewHierarchy() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        let primaryButton = DSButton(type: .primary, title: "Primary Button")
        
        let primaryLoading = DSButton(type: .primary, title: "Primary Button Loading")
        primaryButton.isLoading = true
        
        let primaryDisableButton = DSButton(type: .primary, title: "Primary Button Disabled")
        primaryDisableButton.isEnabled = true
        
        let secundary = DSButton(type: .secundary, title: "Secundary Button")
        
        let secundaryLoading = DSButton(type: .secundary, title: "Secundary Button Loading")
        secundaryLoading.isLoading = true
        
        let secundaryDisableButton = DSButton(type: .secundary, title: "Secundary Button Disabled")
        secundaryDisableButton.isEnabled = true
        
        
        contentView.addArrangedSubview(primaryButton)
        contentView.addArrangedSubview(primaryLoading)
        contentView.addArrangedSubview(primaryDisableButton)
        contentView.addArrangedSubview(secundary)
        contentView.addArrangedSubview(secundaryLoading)
        contentView.addArrangedSubview(secundaryDisableButton)
    }
    
    func addConstraints() {
        scrollView.layout.applyConstraint { view in
            view.topSafeArea(aligneWith: self.view)
            view.bottomSafaArea(alignedWith: self.view)
            view.leftSafeArea(alinedWith: self.view)
            view.rightSafeArea(alignedWith: self.view)
        }
        
        contentView.layout.applyConstraint { view in
            view.edges(in: scrollView)
            view.width(relatedTo: scrollView)
        }
    }
}
