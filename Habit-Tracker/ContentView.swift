//
//  ContentView.swift
//  Habit-Tracker
//
//  Created by Anurag on 19/01/25.
//

import SwiftUI

struct ContentView: View {
    @State private var habits = Habits();
    
    var body: some View {
        NavigationStack {
            NavigationLink {
                AddView(habits:habits)
            }  label: {
                HStack {
                                   Image(systemName: "plus")
                                   Text("Add Activity")
            	                   }
                               .padding()
                               .background(Color.blue)
                               .foregroundColor(.white)
                               .cornerRadius(8)
            }
            ScrollView{
                VStack{
                    ActivityList(habits:habits.habitItems,instance:habits)
                }
            }
            .navigationDestination(for: HabitNavigationData.self) { detail in
                                     HabitView(habit: detail.habit, habits: detail.habitsInstance)
                                 }
                  
        }
        .navigationTitle("Habit Tracker")
        
        
    }
}

#Preview {
    ContentView()
}
