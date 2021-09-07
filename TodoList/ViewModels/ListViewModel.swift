//
//  ListViewModel.swift
//  TodoList
//
//  Created by Nguyễn Duy Anh on 07/09/2021.
//

import Foundation

class ListViewModel: ObservableObject {
    @Published var items: [ItemModel] = []
    
    init() {
        getItems()
    }
    
    func getItems(){
        let newItems = [
            ItemModel(title: "This is the first note", isCompleted: false),
            ItemModel(title: "This is the second note", isCompleted: true),
            ItemModel(title: "This is the third note", isCompleted: false),
        ]
        
        items.append(contentsOf: newItems)
    }
    
    func deleteItem(indexSet: IndexSet)  {
        items.remove(atOffsets: indexSet)
    }
    
    func moveItem(from: IndexSet, to: Int){
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func saveItem(title: String){
        let newItem: ItemModel = ItemModel(title: title, isCompleted: false)
        items.append(newItem)
    }
    
    func updateItem(item : ItemModel){
        if let index = items.firstIndex(where: { $0.id == item.id }) {
            items[index] = item.updateCompletion()
        }
    }
}
