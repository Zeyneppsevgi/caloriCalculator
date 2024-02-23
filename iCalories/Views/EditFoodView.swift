//
//  EditFoodView.swift
//  iCalories
//
//  Created by Zeynep Sevgi on 23.02.2024.
//

import SwiftUI

struct EditFoodView: View {
    @Environment(\.managedObjectContext) var  managedObjContext
    @Environment(\.dismiss) var dismiss
    
    var food: FetchedResults<Food>.Element
    
    @State private var name = ""
    @State private var calories: Double = 0.0
    
    
    var body: some View {
        Form {
            Section{
                TextField("\(food.name!)", text: $name)
                    .onAppear {
                        name = food.name!
                        calories = food.calories
                    }
                VStack {
                    Text("Calories: \(Int(calories))")
                    Slider(value: $calories, in: 0...1000, step: 10)
                }
                .padding()
                HStack {
                    Spacer()
                    Button("Submit") {
                        DataController().editFood(food: food, name: name, calories: calories, context: managedObjContext)
                        dismiss()
                    }
                    Spacer()
                }
            }
        }
    }
}

#Preview {
    EditFoodView()
}