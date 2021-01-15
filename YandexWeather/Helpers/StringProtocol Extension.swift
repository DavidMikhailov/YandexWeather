//
//  StringProtocol Extension.swift
//  YandexWeather
//
//  Created by Давид Михайлов on 15.01.2021.
//

import Foundation

/// Чтобы только первое слово в строке начиналось с заглавной буквы, а остальные шли со строчной
extension StringProtocol {
    var firstUppercased: String {
        guard let first = first else { return self as! String }
        return String(first).uppercased() + dropFirst()
    }
    var firstCapitalized: String {
        guard let first = first else { return self as! String }
        return String(first).capitalized + dropFirst()
    }
}
