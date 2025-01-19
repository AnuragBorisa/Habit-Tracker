//
//  InstancePass.swift
//  Habit-Tracker
//
//  Created by Anurag on 19/01/25.
//

import Foundation
struct HabitNavigationData: Hashable {
    let habit: HabitsItems
    let habitsInstance: Habits

    func hash(into hasher: inout Hasher) {
        hasher.combine(habit.id) // Use habit's ID for hashing
    }

    static func == (lhs: HabitNavigationData, rhs: HabitNavigationData) -> Bool {
        lhs.habit.id == rhs.habit.id // Compare based on habit's ID
    }
}
