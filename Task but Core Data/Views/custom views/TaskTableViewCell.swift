//
//  TaskTableViewCell.swift
//  Task but Core Data
//
//  Created by Gavin Craft on 4/27/21.
//

import UIKit

class TaskTableViewCell: UITableViewCell {
    //MARK: - iboutlets
    @IBOutlet weak var titleCell: UILabel!
    @IBOutlet weak var button: UIButton!
    
    
    //MARK: - properties
    var task:Task?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func updateCell(){
        guard let task = task else {return}
        titleCell.text = task.title
        guard let date = task.dueDate else {return}
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        let image = task.isComplete ? UIImage(systemName: "checkmark.square") : UIImage(systemName: "square")
        button.setImage(image, for: .normal)
    }
    @IBAction func buttonPressed(_ sender: Any) {
        guard let task = task else {return}
        task.isComplete.toggle()
        TaskController.shared.updateTask(task)
        let image = task.isComplete ? UIImage(systemName: "checkmark.square") : UIImage(systemName: "square")
        button.setImage(image, for: .normal)
    }
}
