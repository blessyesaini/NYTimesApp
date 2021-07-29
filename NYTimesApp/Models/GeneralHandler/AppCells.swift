//
//  AppCells.swift
//  NYTimesApp
//
//  Created by Blessy Elizabeth Saini on 7/28/21.
//

import Foundation

enum AppCells:String {
    case newsListCell = "NewsListTableViewCell"
    
    func getName() -> String {
        return self.rawValue
    }
}
