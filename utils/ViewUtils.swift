//
//  anchorUtils.swift
//  mybisnis
//
//  Created by Wildan Angga Rahman on 6/13/18.
//  Copyright © 2018 Wildan Angga Rahman. All rights reserved.
//

import UIKit

extension UIView {
    
    func anchorSuperview(){
        topAnchor.constraint(equalTo: (self.superview?.topAnchor)!).isActive = true
        leadingAnchor.constraint(equalTo: (self.superview?.leadingAnchor)!).isActive = true
        bottomAnchor.constraint(equalTo: (self.superview?.bottomAnchor)!).isActive = true
        trailingAnchor.constraint(equalTo:(self.superview?.trailingAnchor)!).isActive = true
    }

    func anchorSizeToView(to view :UIView) {
        widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
    }
    
    func anchorSize(size:CGSize) {
        if size.width != 0 {
            widthAnchor.constraint(equalToConstant: size.width).isActive = true
        }
        
        if size.height != 0 {
            heightAnchor.constraint(equalToConstant: size.height).isActive = true
        }
    }
    
    func anchor(top:NSLayoutYAxisAnchor?,leading:NSLayoutXAxisAnchor?,bottom:NSLayoutYAxisAnchor?,trailing:NSLayoutXAxisAnchor?,padding:UIEdgeInsets = .zero,size:CGSize = .zero){
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            topAnchor.constraint(equalTo: top,constant:padding.top).isActive = true
        }
        
        if let leading = leading {
            leadingAnchor.constraint(equalTo: leading,constant:padding.left).isActive = true
        }
        
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom,constant: -padding.bottom).isActive = true
        }
        
        if let trailing = trailing {
            trailingAnchor.constraint(equalTo: trailing, constant: -padding.right).isActive = true
        }
        
        if size.width != 0 {
            widthAnchor.constraint(equalToConstant: size.width).isActive = true
        }
        
        if size.height != 0 {
            heightAnchor.constraint(equalToConstant: size.height).isActive = true
        }
    }
    
    func anchorBottom(to view:UIView,padding: UIEdgeInsets = .zero,size:CGSize = .zero){
        anchor(top: view.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor,padding: padding,size: size)
    }
    
    func anchorCenter(horizontal:NSLayoutXAxisAnchor?,vertical:NSLayoutYAxisAnchor?){
        if let horizontal = horizontal {
            centerXAnchor.constraint(equalTo: horizontal).isActive = true
        }
        
        if let vertical = vertical {
            centerYAnchor.constraint(equalTo: vertical).isActive = true
        }
    }

}

