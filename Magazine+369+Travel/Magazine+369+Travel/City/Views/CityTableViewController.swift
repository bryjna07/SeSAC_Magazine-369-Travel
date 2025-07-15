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
    
    var searchList: [City] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchTextField.delegate = self

        tableView.register(CellType.city.nib, forCellReuseIdentifier: CellType.city.id)
        list = CityInfo().city
        
        tableView.rowHeight = 200
        tableView.separatorStyle = .none
        
        searchTextField.returnKeyType = .done
        
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
        updateSearchList(searchTextField.text)
    }
    
    @IBAction func textFieldEditingChanged(_ sender: UITextField) {
        updateSearchList(sender.text)
    }
    
    func updateSearchList(_ searchText: String?) {
        guard let text = searchText, !text.trimmingCharacters(in: .whitespaces).isEmpty  else {
            searchList = filterList
            tableView.reloadData()
            return
        }
        
        // 공백처리
        let trimText = text.trimmingCharacters(in: .whitespaces)
        
        searchList = filterList.filter { city in
            
                let nameSearch = city.name.contains(trimText)
                let explainSearch = city.explain.contains(trimText)
            
                // 대소문자 구분 X
                let englishNameSearch = city.englishName.lowercased().contains(trimText.lowercased())

                return nameSearch || explainSearch || englishNameSearch
            }

            tableView.reloadData()
        }
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return searchList.isEmpty ? filterList.count : searchList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: CellType.city.id, for: indexPath) as! CityCell
        
        let data = searchList.isEmpty ? filterList[indexPath.row] : searchList[indexPath.row]
            cell.city = data
        
        return cell
    }
}

extension CityTableViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder() // 키보드 내리기
        updateSearchList(textField.text)
        return true
    }
}
