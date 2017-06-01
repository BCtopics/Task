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
        
        let _ = Task(name: name, notes: notes, due: due)
        saveToPersistentStore()
        tasks = fetchTasks()
        
    }
    
    func update(task: Task, name: String, notes: String?, due: Date?) {
        
        task.name = name
        task.notes = notes
        task.due = due as NSDate?
        saveToPersistentStore()
        tasks = fetchTasks()
        
    }
    
    func remove(task: Task) {
        
        task.managedObjectContext?.delete(task)
        saveToPersistentStore()
        tasks = fetchTasks()
        
    }
    
    func toggleIsCompleteFor(task: Task) {
        task.isComplete = !task.isComplete
        saveToPersistentStore()
    }
    
    
    // MARK: Persistence
    
    private func saveToPersistentStore() {
        
        do {
            try CoreDataStack.context.save()
        } catch {
            print("Error saving Managed Object Context. Items not saved.")
        }
    }
    
    private func fetchTasks() -> [Task] {
        let request: NSFetchRequest<Task> = Task.fetchRequest()
        return (try? CoreDataStack.context.fetch(request)) ?? []
    }
    
}









