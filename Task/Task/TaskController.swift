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
    
    let fetchedResultsController: NSFetchedResultsController<Task>
    
    // Mock Data
    var mockTasks: [Task] = {
        [ Task(name: "Task1"), Task(name: "Task2", notes: "Notes 1", due: Date()) ]
    }()
    
    //MARK: - Initializers
    
    init() {
        
        // Request
        let request: NSFetchRequest<Task> = Task.fetchRequest()
        
        // Adding Sort Descriptors to that request
        request.sortDescriptors = [NSSortDescriptor(key: "isComplete", ascending: true), NSSortDescriptor(key: "due", ascending: true)]
        
        // Creating actual controller with the request, and managedobjectcontext i've already created.
        fetchedResultsController = NSFetchedResultsController(fetchRequest: request, managedObjectContext: CoreDataStack.context, sectionNameKeyPath: "favorites", cacheName: nil) // Confused about the sectionNameKeyPath
        
//        fetchedResultsController.delegate = self
        
        // Perform Fetch
        do {
            try fetchedResultsController.performFetch()
        } catch {
            NSLog("Error performing fetch request: \(error.localizedDescription)")
        }
        
        
    }
    
    //MARK: - Add, Update, Remove, Save functions
    
    func add(taskWithName name: String, notes: String?, due: Date?) {
        
        let _ = Task(name: name, notes: notes, due: due)
        saveToPersistentStore()
        
    }
    
    func update(task: Task, name: String, notes: String?, due: Date?) {
        
        task.name = name
        task.notes = notes
        task.due = due as NSDate?
        saveToPersistentStore()
        
    }
    
    func remove(task: Task) {
        
        task.managedObjectContext?.delete(task)
        saveToPersistentStore()
        
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
    
}









