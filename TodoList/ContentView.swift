//
//  ContentView.swift
//  TodoList
//
//  Created by Daniela Castilla on 09/04/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var toggledOn = false
    @State private var userInput = ""
    @State private var todoList = [String]()
    var body: some View {
        VStack {
            Image("todo")
                .resizable()
                .frame(width: 90, height: 90)
                .scaledToFit()
            Text("Todos")
                .font(.largeTitle)
            Text("Toggle them off")
            List {
                TextField("Add task", text: $userInput)
                Button("Submit") {
                    guard !userInput.isEmpty else {return}
                    todoList.append(userInput)
                    userInput = ""
                }
                Section {
                    ForEach(todoList, id: \.self) {task in
                    Toggle(task, isOn: $toggledOn)
                    }
                }
            }            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
