//
//  LodableButton.swift
//  DesignSystem
//
//  Created by Erick Kaique Da Silva on 06/02/20.
//  Copyright © 2020 Erick Kaique Da Silva. All rights reserved.
//

import UIKit

public class DSLoadableButton: UIButton {
    
    private var storedText: String?
    private var storedEnableState: Bool
    
    var activityIndicatorColor: UIColor = .black {
        didSet {
            activityIndicator.color = activityIndicatorColor
        }
    }
    
    public var isLoading: Bool = false {
        didSet(oldValue) {
            if isLoading != oldValue {
                updateLoadingState()
            }
        }
    }
        
    private lazy var activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.medium)
        activityIndicator.hidesWhenStopped = true
        activityIndicator.color = activityIndicatorColor
        return activityIndicator
    }()
    
    public override init(frame: CGRect) {
        self.storedText = ""
        self.storedEnableState = true
        super.init(frame: frame)
        
        addSubview(activityIndicator)
        
        activityIndicator.layout.applyConstraint { view in
            view.center(in: self)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func updateLoadingState() {
        if isLoading {
            storedText = title(for: .normal)
            storedEnableState = isEnabled
            setTitle("", for: UIControl.State.normal)
            isEnabled = false
            activityIndicator.startAnimating()
        } else {
            setTitle(storedText, for: .normal)
            isEnabled = storedEnableState
            activityIndicator.stopAnimating()
        }
    }
    
}
