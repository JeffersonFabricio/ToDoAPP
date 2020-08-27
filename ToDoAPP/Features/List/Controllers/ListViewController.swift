//
//  ListViewController.swift
//  ToDoAPP
//
//  Created by aluno on 10/08/20.
//  Copyright © 2020 CESAR School. All rights reserved.
//

import UIKit

final class ListViewController: UIViewController {

    @IBOutlet weak var fabButton: CircleButton!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var collectionView: UICollectionView!
    var isLandScape: Bool = false {
        didSet {
            animateViews()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTableView()
        configureCollectionView()
        
        configureNavigationBar()
        
        fabButton.isHidden = traitCollection.horizontalSizeClass == .regular
        isLandScape = traitCollection.horizontalSizeClass == .regular
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        
        isLandScape = newCollection.horizontalSizeClass == .regular
        fabButton.isHidden = isLandScape
        configureCollectionView(willTransition: true)
        tableView.reloadData()
    }

}

// MARK: Configuration methods extension
extension ListViewController {
    
    private func configureTableView() {
        // Configure table view
        tableView.delegate = self
        tableView.dataSource = self
        
        let nib = UINib(nibName: "ListTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "ListTableViewCellID")
        
    }
    
    private func configureCollectionView(willTransition: Bool = false) {
        
        // Configure collection view
        
        collectionView.delegate = self
        collectionView.dataSource = self
            
        var width = UIScreen.main.bounds.size.width
        var height = UIScreen.main.bounds.size.height
        
        if willTransition {
            width = UIScreen.main.bounds.size.height
            height = UIScreen.main.bounds.size.width
        }
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: ((width - 128) / 3), height: (height * 0.7))
        
        collectionView.collectionViewLayout = layout
        
        let nib = UINib(nibName: "ListCollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "ListCollectionViewCellID")
    }
    
    private func configureNavigationBar() {
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    private func animateViews() {
        UIView.animate(withDuration: 0.3) {
            self.tableView.isHidden = self.isLandScape
            self.collectionView.isHidden = !self.isLandScape
        }
    }
    
}

// MARK: Action methods extension
extension ListViewController {
    
    @IBAction func addButtonPressed(_ sender: Any) {
        guard let viewController = UIStoryboard(name: "Add", bundle: nil).instantiateInitialViewController() else {
            return
        }
        navigationController?.pushViewController(viewController, animated: true)
    }
    
}

extension ListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TodoDataSource.shared.todos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ListTableViewCellID") as? ListTableViewCell else {
            return UITableViewCell()
        }
        
        cell.configure(with: TodoDataSource.shared.todos[indexPath.row])
        return cell
    }
    
    
}

extension ListViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return TodoModel.ModelType.allTypes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ListCollectionViewCellID", for: indexPath) as? ListCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.configure(with: TodoModel.ModelType.allTypes[indexPath.row], todoModels: TodoDataSource.shared.todos)
        return cell
    }
    
    
}
