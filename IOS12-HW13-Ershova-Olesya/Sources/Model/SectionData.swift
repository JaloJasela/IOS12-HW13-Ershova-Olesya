//
//  SectionData.swift
//  IOS12-HW13-Ershova-Olesya
//
//  Created by IMac on 03.03.2024.
//

import Foundation

enum AccessoryType {
    case disclosureIcon
    case switchButton
}

enum CellType {
    case defaultCell(withData: DefaultCellData)
    case switchCell(withData: SwitchCellData)
    case disclosureTextCell(withData: DisclosureTextCellData)
}

struct SectionData {
    let cells: [CellType]
}
