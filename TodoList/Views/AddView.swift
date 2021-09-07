//
//  AddView.swift
//  TodoList
//
//  Created by Nguyễn Duy Anh on 05/09/2021.
//

import SwiftUI

struct AddView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel: ListViewModel
    @State var inputText: String = ""
    
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    var body: some View {
        ScrollView{
            VStack {
                TextField("Type something here...", text: $inputText).padding(.horizontal).frame(height:55).background(Color(#colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1))).cornerRadius(10.0)
                Button(action: saveButton, label: {
                    Text("Save".uppercased()).foregroundColor(.white).font(.headline).frame(height:50).frame(maxWidth: .infinity).background(Color.accentColor).cornerRadius(10)
                })
            }.padding(14)
        }
        .navigationTitle("Add New Item")
        .alert(isPresented: $showAlert, content: getAlert)
    }
    
    func saveButton(){
        if textIsOk() {
            listViewModel.saveItem(title: inputText)
            presentationMode.wrappedValue.dismiss()
        }
        
    }
    
    func textIsOk() -> Bool {
        if inputText.count < 3 {
            alertTitle = "Title of todo item must be at least 3 characters";
            showAlert.toggle()
            return false
        }
        return true
    }
    
    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddView()
        }
    }
}
