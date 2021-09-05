//
//  ListView.swift
//  TodoList
//
//  Created by Nguyễn Duy Anh on 04/09/2021.
//

import SwiftUI

struct ListView: View {
    @State var items: [String] = [
        "This is the first title!",
        "This is the second",
        "Third!"
    ]
    var body: some View {
        List{
            ForEach(items, id: \.self, content: {
                item in ListRowView(title: item)
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


