//
//  ListViewModel.swift
//  TodoList
//
//  Created by Nguyễn Duy Anh on 07/09/2021.
//

import Foundation

class ListViewModel:NSObject, ObservableObject {
    @Published var items: [ItemModel] = [] {
        didSet{
            saveItems()
        }
    }
    
    let itemsKey: String = "items_key"
    
    override init() {
        super.init()
        getItems()
    }
    
    func getItems(){
//        let newItems = [
//            ItemModel(title: "This is the first note", isCompleted: false),
//            ItemModel(title: "This is the second note", isCompleted: true),
//            ItemModel(title: "This is the third note", isCompleted: false),
//        ]
//
//        items.append(contentsOf: newItems)
        guard
            let data = UserDefaults.standard.data(forKey: itemsKey),
            let savedItems = try? JSONDecoder().decode([ItemModel].self, from: data)
        else{
            return
        }
        
        self.items = savedItems
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
    
    func saveItems(){
        if let encodedData = try? JSONEncoder().encode(items){
            UserDefaults.standard.set(encodedData, forKey: itemsKey)
        }
    }
}
