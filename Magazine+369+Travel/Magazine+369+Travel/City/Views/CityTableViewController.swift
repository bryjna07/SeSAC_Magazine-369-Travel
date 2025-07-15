//
//  CityTableViewController.swift
//  Magazine+369+Travel
//
//  Created by YoungJin on 7/15/25.
//

import UIKit

class CityTableViewController: UITableViewController {

    @IBOutlet var searchTextField: UITextField!
    
    @IBOutlet var segmentControl: UISegmentedControl!
    
    var list: [City] = []
    
    var filterList: [City] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(CellType.city.nib, forCellReuseIdentifier: CellType.city.id)
        list = CityInfo().city
        
        tableView.rowHeight = 200
        tableView.separatorStyle = .none
        
        segmentControl.removeAllSegments()
        
        segmentControl.insertSegment(withTitle: "모두", at: 0, animated: true)
        segmentControl.insertSegment(withTitle: "국내", at: 1, animated: true)
        segmentControl.insertSegment(withTitle: "해외", at: 2, animated: true)
        
        segmentControl.selectedSegmentIndex = 0
        
        segmentedValueChanged(segmentControl)
        
    }
    
    @IBAction func segmentedValueChanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            filterList = list
        case 1:
            filterList = list.filter { $0.domesticTravel == true }
        case 2:
            filterList = list.filter { $0.domesticTravel == false }
        default:
            filterList = list
    
        }
        tableView.reloadData()
    }
    
//    private func changeList(_ domestic: Bool) {
//        tableView.reloadData()
//    }
    

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return filterList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: CellType.city.id, for: indexPath) as! CityCell
        
        cell.city = filterList[indexPath.row]
        
        return cell
    }
    

    
}
