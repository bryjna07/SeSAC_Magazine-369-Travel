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
        
        tableView.register(UINib(nibName: Cell.adCellid, bundle: nil), forCellReuseIdentifier: Cell.adCellid)
        
        title = Text.travelTitle
        
        let data = TravelInfo()
       
        list = data.travel
        
        
    }

    override func numberOfSections(in tableView: UITableView) -> Int {

        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
  
        return list.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if list[indexPath.row].ad {
            let cell = tableView.dequeueReusableCell(withIdentifier: Cell.adCellid, for: indexPath) as! AdCell
            
            cell.travel = list[indexPath.row]
            return cell
        } else {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: Cell.travelCellid, for: indexPath) as! TravelTableViewCell

            cell.travel = list[indexPath.row]
            
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return list[indexPath.row].ad ? 90 : 180
    }

}
