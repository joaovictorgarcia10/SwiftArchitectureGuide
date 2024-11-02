//
//  UITextFieldExtension.swift
//  SwiftArchitectureGuide
//
//  Created by Joao Victor Garcia Leite Santana on 22/10/24.
//

import UIKit

extension UITextField {
    
    func setLeftPaddingPoints(_ value: CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: value, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
}
