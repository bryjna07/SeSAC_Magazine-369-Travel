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

        title = Text.magazineTitle
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        
        tableView.rowHeight = 420
        
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
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Cell.magazineCellid, for: indexPath) as! MagazineTableViewCell
        
        cell.magazine = list[indexPath.row]

        return cell
    }
}
