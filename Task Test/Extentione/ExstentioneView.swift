//
//  ExstentioneView.swift
//  Task Test
//
//  Created by Ali Wicca on 20/01/2023.
//

import UIKit

extension UIView {
    
    @IBInspectable var cornerRadius: CGFloat{
        
        get { return self.cornerRadius}
        set { self.layer.cornerRadius = newValue }
        
        
    }
    
    
    
}
