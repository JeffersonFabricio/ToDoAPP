//
//  ListCollectionViewCell.swift
//  ToDoAPP
//
//  Created by aluno on 23/08/20.
//  Copyright © 2020 CESAR School. All rights reserved.
//

import UIKit

class ListCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var todoOneLabel: UILabel!
    @IBOutlet weak var todoTwoLabel: UILabel!
    @IBOutlet weak var todoThreeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

}

extension ListCollectionViewCell {
    
    func configure(with model: TodoModel.ModelType, todoModels: [TodoModel]) {
        
        contentView.backgroundColor = model.typeColor
        
        titleLabel.text = model.typeDescription
        
        // todoOneLabel.text = model.todoDescription
        // todoTwoLabel.text = model.todoDescription
        // todoThreeLabel.text = model.todoDescription
        
    }
}

