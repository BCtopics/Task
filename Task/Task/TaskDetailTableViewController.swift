//
//  TaskDetailTableViewController.swift
//  Task
//
//  Created by Bradley GIlmore on 5/31/17.
//  Copyright © 2017 Bradley Gilmore. All rights reserved.
//

import UIKit

class TaskDetailTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: IBActions
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        updateTask()
        let _ = navigationController?.popViewController(animated: true)
    }
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        let _ = navigationController?.popViewController(animated: true)
    }
    
    @IBAction func datePickerValueChanged(_ sender: UIDatePicker) {
        self.taskDueTextField.text = sender.date.stringValue()
        self.dueDateValue = sender.date
    }
    
    @IBAction func userTappedView(_ sender: Any) {
        self.taskNameTextField.resignFirstResponder()
        self.taskDueTextField.resignFirstResponder()
        self.taskNotesTextView.resignFirstResponder()
    }
    
    //MARK: Private Functions
    
    private func updateTask() {
        
        guard let name = taskNameTextField.text else { return }
        let due = dueDateValue
        let notes = taskNotesTextView.text
        
        if let task = self.task {
            TaskController.shared.update(task: task, name: name, notes: notes, due: due)
        } else {
            TaskController.shared.add(taskWithName: name, notes: notes, due: due)
        }
    }
    
    private func updateViews() {
        guard let task = task, isViewLoaded else { return }
        
        title = task.name
        taskNameTextField.text = task.name
        taskDueTextField.text = (task.due as Date?)?.stringValue()
        taskNotesTextView.text = task.notes
    }
    
    //MARK: Internal Properties
    
    var task: Task? {
        didSet {
            updateViews()
        }
    }
    
    var dueDateValue: Date?

    //MARK: - IBOutlets
    
    @IBOutlet weak var taskNameTextField: UITextField!
    @IBOutlet weak var taskDueTextField: UITextField!
    @IBOutlet weak var taskNotesTextView: UITextView!
    @IBOutlet var dueDatePicker: UIDatePicker!

}
