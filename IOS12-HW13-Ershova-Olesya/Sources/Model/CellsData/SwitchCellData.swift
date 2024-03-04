//
//  SwitchCellData.swift
//  IOS12-HW13-Ershova-Olesya
//
//  Created by IMac on 03.03.2024.
//

import UIKit

public struct SwitchCellData {
    public let text: String
    public let iconName: String
    public let iconBackgroundColor: UIColor
    public let isOnByDefault: Bool
    
   public init(text: String, iconName: String, iconBackgroundColor: UIColor, isOnByDefault: Bool) {
        self.text = text
        self.iconName = iconName
        self.iconBackgroundColor = iconBackgroundColor
        self.isOnByDefault = isOnByDefault
    }
}

