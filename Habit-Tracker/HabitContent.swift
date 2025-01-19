    //
    //  HabitContent.swift
    //  Habit-Tracker
    //
    //  Created by Anurag on 19/01/25.
    //

    import Foundation
    import Observation

    struct HabitsItems: Codable,Identifiable,Hashable,Equatable {
        var id = UUID()
        let activity : String
        let description : String
        var count : Int
        
        var displayCount : String{
            return count == 1 ? "1 time" : "\(count) times"
        }
        
     
        
    }
    @Observable
    class Habits {
        var habitItems = [HabitsItems](){
            didSet{
                if let encoded = try?JSONEncoder().encode(habitItems){
                    UserDefaults.standard.set(encoded,forKey: "HabitItems")
                }
            }
        }
        
        init(){
            if let saveItems = UserDefaults.standard.data(forKey: "HabitItems"){
                if let decodedItems = try?JSONDecoder().decode([HabitsItems].self, from: saveItems){
                    habitItems = decodedItems
                    return
                }
            }
            habitItems = []
        }
        
        func removeItems(at offsets:IndexSet){
            habitItems.remove(atOffsets: offsets)
        }
        
        func upadateHabitCount(for habit:HabitsItems,newCount:Int){
           
            if let index = habitItems.firstIndex(of : habit){
                var newActivity = habit
                newActivity.count = newCount
                habitItems[index] = newActivity
                habitItems = habitItems
            }
        }
        
    }
