//
//  TaskController.swift
//  Task
//
//  Created by Bradley GIlmore on 5/31/17.
//  Copyright © 2017 Bradley Gilmore. All rights reserved.
//

import Foundation
import CoreData

class TaskController {
    
    //MARK: - Shared Instances
    
    static let shared = TaskController()
    
    
    //MARK: - Internal Properties
    
    var tasks: [Task] = []
    
    // Mock Data
    var mockTasks: [Task] = {
        [ Task(name: "Task1"), Task(name: "Task2", notes: "Notes 1", due: Date()) ]
    }()
    
    //MARK: - Initializers
    
    init() {
        tasks = fetchTasks()
    }
    
    //MARK: - Add, Update, Remove, Save functions
    
    func add(taskWithName name: String, notes: String?, due: Date?) {
        
    }
    
    func update(task: Task, name: String, notes: String?, due: Date?) {
        
    }
    
    func remove(task: Task) {
        
    }
    
    func saveToPersistentStore() {
        
    }
    
    func fetchTasks() -> [Task] {
        return mockTasks
    }
    
    func toggleIsCompleteFor(task: Task) {
        task.isComplete = !task.isComplete
    }
    
}









