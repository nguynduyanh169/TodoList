//
//  ListView.swift
//  TodoList
//
//  Created by Nguyễn Duy Anh on 04/09/2021.
//

import SwiftUI

struct ListView: View {
    @State var items: [ItemModel] = [
        ItemModel(title: "This is the first note", isCompleted: false),
        ItemModel(title: "This is the second note", isCompleted: true),
        ItemModel(title: "This is the third note", isCompleted: false),
    ]
    var body: some View {
        List{
            ForEach(items, content: {
                
                item in ListRowView(item: item)
            })
        }.listStyle(PlainListStyle()).navigationTitle("Todo List")
        .navigationBarItems(leading: EditButton(), trailing: NavigationLink("Add", destination: AddView()))
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ListView()
        }
    }
}


