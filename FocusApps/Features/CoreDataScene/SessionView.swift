//
//  SessionView.swift
//  FocusApps
//
//  Created by Hilmy Noerfatih on 20/06/23.
//

import SwiftUI

struct SessionView: View {
    @Environment(\.managedObjectContext) private var viewContext
    let persistenceController = PersistenceController.shared
    
    let taskMO : TaskMO
    
    var sessionMOs : [SessionMO]
    
    init(taskMO : TaskMO){
        self.taskMO = taskMO
        
        self.sessionMOs = taskMO.session?.allObjects as! [SessionMO]
        self.sessionMOs = self.sessionMOs.sorted(by: {$0.createdAt! < $1.createdAt!})
        
    }
    
    var body: some View {
        
            ForEach(sessionMOs) { session in
                VStack{
                    Text("\(session.createdAt!)")
                    ActivityView(sessionMO: session)
                }
            }
        
    }
}

//struct SessionView_Previews: PreviewProvider {
//    static var previews: some View {
//        SessionView()
//    }
//}
