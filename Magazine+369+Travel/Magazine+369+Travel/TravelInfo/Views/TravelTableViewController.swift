//
//  TravelTableViewController.swift
//  Magazine+369+Travel
//
//  Created by YoungJin on 7/11/25.
//

import UIKit

final class TravelTableViewController: UITableViewController {
    
    var list: [Travel] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.rowHeight = 80
    }

    override func numberOfSections(in tableView: UITableView) -> Int {

        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
  
        return list.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TravelCell", for: indexPath) as! TravelTableViewCell
        
        return cell
    }
  

}
