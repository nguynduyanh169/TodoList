//
//  NoItemView.swift
//  TodoList
//
//  Created by Nguyễn Duy Anh on 08/09/2021.
//

import SwiftUI

struct NoItemView: View {
    @State var animate: Bool = false
    var body: some View {
        ScrollView{
            VStack(spacing: 10){
                Text("There is no items here!")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .fontWeight(.semibold)
                Text("Press the add button to create more items to your todolist")
                    .padding(.bottom, 20)
                NavigationLink(
                    destination: AddView(),
                    label: {
                        Text("Add Items").foregroundColor(.white)
                            .font(.headline)
                            .frame(height: 55)
                            .frame(maxWidth: .infinity)
                            .background(animate ? Color.red : Color.accentColor)
                            .cornerRadius(10)
                    })
                    .padding(.horizontal, animate ? 30 : 50)
                    .scaleEffect(animate ? 1.1 : 1.0)
                    .offset(y: animate ? -7 : 10)
                    .shadow(color: animate ? Color.red.opacity(0.7) : Color.accentColor.opacity(0.7), radius: animate ? 30 : 10, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: animate ? 50:30)
            }.multilineTextAlignment(.center)
            .onAppear(perform: addAnimation)
            .padding(40)
            .frame(maxWidth: 400)
            
        }
    }
    
    func addAnimation(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5){
            withAnimation(Animation.easeInOut(duration: 2.0).repeatForever()
            ){
                animate.toggle()
            }
        }
    }
}

struct NoItemView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            NoItemView()
        }
    }
}
