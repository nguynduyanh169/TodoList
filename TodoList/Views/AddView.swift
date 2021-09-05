//
//  AddView.swift
//  TodoList
//
//  Created by Nguyễn Duy Anh on 05/09/2021.
//

import SwiftUI

struct AddView: View {
    @State var inputText: String = ""
    var body: some View {
        ScrollView{
            VStack {
                TextField("Type something here...", text: $inputText).padding(.horizontal).frame(height:55).background(Color(#colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1))).cornerRadius(10.0)
                Button(action: {
                    print(inputText)
                }, label: {
                    Text("Save".uppercased()).foregroundColor(.white).font(.headline).frame(height:50).frame(maxWidth: .infinity).background(Color.accentColor).cornerRadius(10)
                })
            }.padding(14)
        }
        .navigationTitle("Add New Item")
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddView()
        }
    }
}
