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
    
    var body: some View {
        
        ForEach(taskMO.sessionMOList) { session in
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
