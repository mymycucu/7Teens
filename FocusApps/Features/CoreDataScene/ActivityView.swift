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
    var activityMOs : [SessionActivityMO]
    
    init(sessionMO : SessionMO){
        self.sessionMO = sessionMO
        
        self.activityMOs = sessionMO.activity?.allObjects as! [SessionActivityMO]
        self.activityMOs = self.activityMOs.sorted(by: {$0.createdAt! < $1.createdAt!})
    }
    
    var body: some View {
        List {
            ForEach(activityMOs) { activity in
                Text("\(getActivityType(type:Int(activity.type))) - \(activity.duration/60) min")
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
}

//struct ActivityView_Previews: PreviewProvider {
//    static var previews: some View {
//        ActivityView()
//    }
//}
