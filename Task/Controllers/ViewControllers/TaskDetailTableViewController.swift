//
//  TaskDetailTableViewController.swift
//  Task
//
//  Created by Will morris on 5/8/19.
//  Copyright © 2019 devmtn. All rights reserved.
//

import UIKit

class TaskDetailTableViewController: UITableViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var dueTextField: UITextField!
    @IBOutlet weak var notesTextView: UITextView!
    @IBOutlet var dueDatePicker: UIDatePicker!
  
    
    var task: Task? {
        didSet {
            updateViews()
        }
    }
    
    var dueDateValue: Date?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        dueTextField.inputView = dueDatePicker
        
        if let task = task {
            title = task.name
        } else {
            title = "New Task"
        }
        
        updateViews()
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        if let name = nameTextField.text {
            if let task = task {
                TaskController.shared.update(task: task, name: name, notes: notesTextView?.text, due: dueDateValue)
            } else {
                TaskController.shared.add(taskWithName: name, notes: notesTextView?.text, due: dueDateValue)
            }
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func datePickerValueChanged(_ sender: UIDatePicker) {
        dueDateValue = dueDatePicker.date
        dueTextField.text = dueDatePicker.date.stringValue()
    }
    @IBAction func userTappedView(_ sender: Any) {
        dueTextField.resignFirstResponder()
        nameTextField.resignFirstResponder()
        notesTextView.resignFirstResponder()
    }
    
    
     func updateViews() {
        if let task = task {
            nameTextField?.text = task.name
            notesTextView?.text = task.notes
            dueTextField?.text = task.due?.stringValue()
        }
    }
    
}
