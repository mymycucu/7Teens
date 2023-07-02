//
//  InsightViewModel.swift
//  FocusApps
//
//  Created by Hilmy Noerfatih on 25/06/23.
//

import Foundation
import CoreData

@MainActor
class InsightViewModel: ObservableObject {
    @Published var selectedSegment = 0
    @Published var selectedTimeSegment = 0
    @Published var data: InsightModel = InsightModel(totalFocusTime: 0, totalTask: 0, totalCoin: 0, sessionList: [])
    
    
    func refreshData(time : Int) -> Void{
        if time == 1{
            self.data = getWeeklyData()
        } else if time == 2 {
            self.data = getMontlyData()
        }else{
            self.data = getTodayData()
        }
    }
    
    func initData(){
        self.data = getTodayData()
    }
    
    func getTodayData() -> InsightModel {
        var data = InsightModel(totalFocusTime: 0, totalTask: 0, totalCoin: 0, sessionList: [])
        var taskList: [TaskMO] = []
        let today = Calendar.current.startOfDay(for: .now)
        
        let fetchRequest: NSFetchRequest<SessionMO> = SessionMO.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "createdAt >= %@", today as NSDate)
        
        if let sessionMOs = try? PersistenceController.shared.viewContext.fetch(fetchRequest){
            for session in sessionMOs{
                if !taskList.contains(session.task!){
                    taskList.append(session.task!)
                    data.totalTask += 1
                }
                data.totalCoin += Int(session.coin)
                data.totalFocusTime += session.getTotalFocusTime()
                data.sessionList.append(createInsightSessionModel(session: session))
            }
            
        }
        return data
    }
    
    func getWeeklyData() -> InsightModel {
        var data = InsightModel(totalFocusTime: 0, totalTask: 0, totalCoin: 0, sessionList: [])
        var taskList: [TaskMO] = []
        var components = DateComponents()
        components.month = Calendar.current.component(.year, from: Date())
        components.year = Calendar.current.component(.month, from: Date())
        let startDateOfMonth = Calendar.current.date(from: components)

        //Now create endDateOfMonth using startDateOfMonth
        components.year = 0
        components.month = 0
        components.day = -7
        let endDateOfMonth = Calendar.current.date(byAdding: components, to: startDateOfMonth!)
        
        let fetchRequest: NSFetchRequest<SessionMO> = SessionMO.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "createdAt >= %@ && createdAt <= %@",startDateOfMonth! as NSDate, endDateOfMonth! as NSDate)
        
        if let sessionMOs = try? PersistenceController.shared.viewContext.fetch(fetchRequest){
            for session in sessionMOs{
                if !taskList.contains(session.task!){
                    taskList.append(session.task!)
                    data.totalTask += 1
                }
                data.totalCoin += Int(session.coin)
                data.totalFocusTime += session.getTotalFocusTime()
                data.sessionList.append(createInsightSessionModel(session: session))
            }
        }
       return data
//        return InsightModel(totalFocusTime: 1, totalTask: 1, totalCoin: 1, sessionList: [])
    }
    
    func getMontlyData() -> InsightModel {
        var data = InsightModel(totalFocusTime: 0, totalTask: 0, totalCoin: 0, sessionList: [])
        var taskList: [TaskMO] = []
        
        var components = DateComponents()
        components.month = Calendar.current.component(.year, from: Date())
        components.year = Calendar.current.component(.month, from: Date())
        let startDateOfMonth = Calendar.current.date(from: components)

        //Now create endDateOfMonth using startDateOfMonth
        components.year = 0
        components.month = 1
        components.day = -1
        let endDateOfMonth = Calendar.current.date(byAdding: components, to: startDateOfMonth!)
        
        let fetchRequest: NSFetchRequest<SessionMO> = SessionMO.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "createdAt >= %@ && createdAt <= %@",startDateOfMonth! as NSDate, endDateOfMonth! as NSDate)

        
        if let sessionMOs = try? PersistenceController.shared.viewContext.fetch(fetchRequest){
            print(sessionMOs.count)
            for session in sessionMOs{
                if !taskList.contains(session.task!){
                    taskList.append(session.task!)
                    data.totalTask += 1
                }
                data.totalCoin += Int(session.coin)
                data.totalFocusTime += session.getTotalFocusTime()
                data.sessionList.append(createInsightSessionModel(session: session))
            }
            
        }
        return data
//        return InsightModel(totalFocusTime: 2, totalTask: 2, totalCoin: 2, sessionList: [])
    }
    
    func createInsightSessionModel(session: SessionMO) -> InsightSessionModel{
        let taskName = session.task!.name!
        let taskCompletion = session.isTaskDone ? "Completed" : "Uncompleted"
        let duration = String(session.getTotalFocusTime()/60)
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "hh:mma"
        
        let time = dateFormatter.string(from: session.createdAt!)
        
        return InsightSessionModel(taskName: taskName, completion: taskCompletion, duration: duration, time: time)
    }
}
