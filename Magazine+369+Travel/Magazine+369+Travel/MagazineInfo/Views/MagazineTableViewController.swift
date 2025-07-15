//
//  MagazineTableViewController.swift
//  Magazine+369+Travel
//
//  Created by YoungJin on 7/11/25.
//

import UIKit

final class MagazineTableViewController: UITableViewController {
    
    private var list: [Magazine] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(CellType.magazine.nib, forCellReuseIdentifier: CellType.magazine.id)
        
        title = Text.magazineTitle
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        
        tableView.rowHeight = UITableView.automaticDimension
        
        let magazine = MagazineInfo()
        list = magazine.magazine
        
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
       
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return list.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: CellType.magazine.id, for: indexPath) as! MagazineCell
        
        cell.magazine = list[indexPath.row]

        return cell
    }
}
