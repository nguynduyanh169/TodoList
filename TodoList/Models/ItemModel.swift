//
//  ItemModel.swift
//  TodoList
//
//  Created by Nguyễn Duy Anh on 05/09/2021.
//

import Foundation

struct ItemModel: Identifiable {
    let id: String = UUID().uuidString
    let title: String
    let isCompleted: Bool
    
}
