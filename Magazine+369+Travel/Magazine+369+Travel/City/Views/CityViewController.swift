//
//  CityViewController.swift
//  Magazine+369+Travel
//
//  Created by YoungJin on 7/16/25.
//

import UIKit

final class CityViewController: UIViewController {

    @IBOutlet var searchBar: UISearchBar!
    
    @IBOutlet var segmentedControl: UISegmentedControl!
    
    @IBOutlet var tableView: UITableView!
    
    var list: [City] = []
    
    var filterList: [City] = []
    
    var searchList: [City] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        list = CityInfo().city
        setUpSearchBar()
        setUpSegmentedControl()
        setUpTableView()
    }

    private func setUpSearchBar() {
        searchBar.delegate = self
    }
    
    private func setUpSegmentedControl() {
        
        segmentedControl.removeAllSegments()
        
        segmentedControl.insertSegment(withTitle: "모두", at: 0, animated: true)
        segmentedControl.insertSegment(withTitle: "국내", at: 1, animated: true)
        segmentedControl.insertSegment(withTitle: "해외", at: 2, animated: true)
        
        segmentedControl.selectedSegmentIndex = 0
        
        segmentedValueChanged(segmentedControl)
    }
    
    private func setUpTableView() {
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.rowHeight = 200
        tableView.separatorStyle = .none
        
        tableView.register(CellType.city.nib, forCellReuseIdentifier: CellType.city.id)
        list = CityInfo().city
    }
    
    @IBAction func segmentedValueChanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            filterList = list
        case 1:
            filterList = list.filter { $0.domesticTravel }
        case 2:
            filterList = list.filter { !$0.domesticTravel }
        default:
            filterList = list
        }
        searchBarSearchButtonClicked(searchBar)
    }
    
    private func updateSearchList(_ searchText: String) {
        
        // 공백처리
        let trimText = searchText.trimmingCharacters(in: .whitespaces)
        
        searchList = filterList.filter { city in
            
                let nameSearch = city.name.contains(trimText)
                let explainSearch = city.explain.contains(trimText)
            
                // 대소문자 구분 X
                let englishNameSearch = city.englishName.lowercased().contains(trimText.lowercased())

                return nameSearch || explainSearch || englishNameSearch
            }

            tableView.reloadData()
        }
}

extension CityViewController : UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let text = searchBar.text, !text.trimmingCharacters(in: .whitespaces).isEmpty else {
            searchList = filterList
            tableView.reloadData()
            return
        }
        updateSearchList(text)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        updateSearchList(searchText)
    }
    
}

extension CityViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return searchList.isEmpty ? filterList.count : searchList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: CellType.city.id, for: indexPath) as! CityCell
        
        let data = searchList.isEmpty ? filterList[indexPath.row] : searchList[indexPath.row]
            cell.city = data
        
        return cell
    }
}
