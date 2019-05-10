//
//  ButtonTableViewCell.swift
//  Task
//
//  Created by Will morris on 5/8/19.
//  Copyright © 2019 devmtn. All rights reserved.
//

import UIKit

protocol ButtonTableViewCellDelegate: class {
    func buttonCellButtonTapped(_ sender: ButtonTableViewCell)
}

class ButtonTableViewCell: UITableViewCell {

    @IBOutlet weak var taskNameLabel: UILabel!
    @IBOutlet weak var completedButton: UIButton!
    
    @IBAction func completedButtonTapped(_ sender: UIButton) {
        delegate?.buttonCellButtonTapped(self)
    }
    
    weak var delegate: ButtonTableViewCellDelegate?
    
    func updateButton(_ isComplete: Bool) {
        
        let imageName = isComplete ? "complete" : "incomplete"
        completedButton.setImage(UIImage(named: imageName), for: .normal)
    }
    
}


extension ButtonTableViewCell {
    
    func update(withTask task: Task) {
        taskNameLabel.text = task.name
        updateButton(task.isComplete)
    }
    
}
