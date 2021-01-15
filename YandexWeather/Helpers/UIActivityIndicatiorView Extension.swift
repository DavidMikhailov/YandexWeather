//
//  UIActivityIndicatiorView Extension.swift
//  YandexWeather
//
//  Created by Давид Михайлов on 15.01.2021.
//

import UIKit

extension UIActivityIndicatorView {
    
    public func turnOn() {
        isHidden = false
        startAnimating()
    }
    
    public func turnOff() {
        isHidden = true
        stopAnimating()
    }
    
}
