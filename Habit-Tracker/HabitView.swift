//
//  HabitView.swift
//  Habit-Tracker
//
//  Created by Anurag on 19/01/25.
//

import SwiftUI

struct HabitView: View {
    var habit : HabitsItems
    var habits: Habits
    var body: some View {
        
        ScrollView{
            VStack{
                HStack{
                    Text(habit.activity)
                    
                    Stepper("Completed: \(habit.displayCount)",
                                           value: Binding(
                                               get: { habit.count },
                                               set: { newValue in
                                                   habits.upadateHabitCount(for: habit, newCount: newValue)
                                               }
                                           ),
                                           in: 0...Int.max
                                       )
                }
                
                Text(habit.description);
                
            }
        }
    }
}

#Preview {
    let mockHabits = Habits()
    let habit = HabitsItems(activity: "Exercise", description: "Morning workout", count: 5)
    return HabitView(habit: habit, habits: mockHabits)
}
