//
//  AddView.swift
//  Habit-Tracker
//
//  Created by Anurag on 19/01/25.
//

import SwiftUI

struct AddView: View {
    var habits : Habits
    @Environment(\.dismiss) var dismiss
    @State private var newHabitName : String = ""
    @State private var newHabitDescription : String = ""
    
    
    var body: some View {
        NavigationStack{
            Form{
                TextField("New Habit",text:$newHabitName)
                TextField("Description",text:$newHabitDescription)
            }
            .navigationTitle("Add New Habit")
            .toolbar{
                ToolbarItem(placement: .navigationBarLeading){
                    Button("Cancel"){
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing){
                    Button("Save"){
                        let habit = HabitsItems(activity:newHabitName,description:newHabitDescription,count:0)
                        
                        habits.habitItems.append(habit)
                        dismiss()
                        
                    }
                }
            }
            
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    let mockHabits = Habits()
    return AddView(habits: mockHabits)
}
