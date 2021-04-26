//
//  ContentView.swift
//  PushChangesManuallyObservableObject
//
//  Created by 米国梁 on 2021/4/26.
//

import SwiftUI

class Person {
    var id = UUID().uuidString
}

class Model: ObservableObject {
    @Published var person = Person()
}

struct ContentView: View {
    
    @StateObject var data = Model()
    
    var body: some View {
        VStack {
            Button("Change id but not push changes") {
                // Set a new id
                data.person.id = UUID().uuidString
            }
            .padding()
            .foregroundColor(.white)
            .background(Color.red)
            Text("Person's ID is \(data.person.id)")
            Button("Change id and push changes") {
                data.objectWillChange.send()
                // Set a new id
                data.person.id = UUID().uuidString
            }
            .padding()
            .foregroundColor(.white)
            .background(Color.green)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
