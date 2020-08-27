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
       	   
		if !todoModels.isEmpty {
			todoOneLabel.text = todoModels[0].todoDescription
			todoTwoLabel.text = todoModels[1].todoDescription
			todoThreeLabel.text = todoModels[2].todoDescription
		} else {
			todoOneLabel.text = ""
			todoTwoLabel.text = ""
			todoThreeLabel.text = ""
		}
        
    }
}

