//
//  ActivityView.swift
//  FocusApps
//
//  Created by Hilmy Noerfatih on 20/06/23.
//

import SwiftUI

struct ActivityView: View {
    @Environment(\.managedObjectContext) private var viewContext
    let persistenceController = PersistenceController.shared
    var sessionMO : SessionMO
    
    var body: some View {
        List {
            ForEach(sessionMO.activityMOList) { activity in
                Text("\(getActivityType(type:Int(activity.type))) - \(activity.duration/60) min - \(getIsToday(date:(activity.createdAt ?? Date())))")
            }
        }
    }
    
    func getActivityType(type : Int) -> String{
        if (type == 0){
            return "Rest"
        } else if (type == 1){
            return "Focus"
        } else {
            return "error"
        }
    }
    func getIsToday(date: Date) -> String{
        let currentDate = Date()
        let calendar = Calendar.current
        
        if calendar.isDate(date, inSameDayAs: currentDate) {
            return "today"
        } else {
            return "not today"
        }
    }
    
}

//struct ActivityView_Previews: PreviewProvider {
//    static var previews: some View {
//        ActivityView()
//    }
//}
