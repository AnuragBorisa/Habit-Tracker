//
//  ActivityList.swift
//  Habit-Tracker
//
//  Created by Anurag on 19/01/25.
//

import SwiftUI

struct ActivityList: View {
    var habits : [HabitsItems]
    var instance : Habits
   
    var body: some View {
        ForEach(habits){ habit in
            NavigationLink(value: HabitNavigationData(habit: habit, habitsInstance: instance))
            {
                VStack{
                    HStack{
                        Text(habit.activity)
                            .font(.headline)
                        Text(habit.displayCount)
                    }
                    Text(habit.description)
                }
            }
        }
        .onDelete(perform: instance.removeItems)
    }
}

#Preview {
    let mockHabits = Habits()
    mockHabits.habitItems = [
        HabitsItems(activity: "Exercise", description: "Morning workout", count: 5),
        HabitsItems(activity: "Meditation", description: "10 minutes mindfulness", count: 3)
    ]
    return ActivityList(habits: mockHabits.habitItems, instance: mockHabits)
}
