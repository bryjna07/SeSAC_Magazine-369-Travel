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
    
    @IBOutlet var collectionView: UICollectionView!
    
    var list: [City] = []
    
    var filterList: [City] = []
    
    var searchList: [City] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        list = CityInfo().city
        setUpSearchBar()
        setUpSegmentedControl()
        setUpCollectionView()
    }
    
    private func setUpSearchBar() {
        searchBar.delegate = self
    }
    
    private func setUpSegmentedControl() {
        segmentedControl.removeAllSegments()
        
        for (index, type) in SegmentType.allCases.enumerated() {
            segmentedControl.insertSegment(withTitle: type.title, at: index, animated: true)
        }
        
        segmentedControl.selectedSegmentIndex = SegmentType.all.rawValue
        segmentedValueChanged(segmentedControl)
    }
    
    private func setUpCollectionView() {
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(CellType.city.nib, forCellWithReuseIdentifier: CellType.city.id)
        
        let layout = UICollectionViewFlowLayout()
        let cellWidth = UIScreen.main.bounds.width - 16 * 3
        layout.itemSize = .init(width: cellWidth / 2, height: cellWidth / 2 + 68)
        layout.sectionInset = .init(top: 16, left: 16, bottom: 16, right: 16)
        layout.minimumInteritemSpacing = 16 // 셀과 셀 사이
        layout.minimumLineSpacing = 16 // 위 아래 간격
        layout.scrollDirection = .vertical
        collectionView.collectionViewLayout = layout
        collectionView.showsVerticalScrollIndicator = false
        
    }
    
    @IBAction func segmentedValueChanged(_ sender: UISegmentedControl) {
        guard let selectedType = SegmentType(rawValue: sender.selectedSegmentIndex) else {
                return
            }
            
            filterList = selectedType.filtered(from: list)
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
        
        collectionView.reloadData()
    }
}

extension CityViewController : UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let text = searchBar.text, !text.trimmingCharacters(in: .whitespaces).isEmpty else {
            searchList = filterList
            collectionView.reloadData()
            return
        }
        updateSearchList(text)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        updateSearchList(searchText)
    }
    
}

extension CityViewController : UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return searchList.isEmpty ? filterList.count : searchList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellType.city.id, for: indexPath) as! CityCollectionViewCell
        
        let data = searchList.isEmpty ? filterList[indexPath.row] : searchList[indexPath.row]
        
        cell.city = data
        
        cell.cityNameLabel.searchTextColor(targetString: searchBar.text ?? "", color: .yellow)
        
        cell.explainLabel.searchTextColor(targetString: searchBar.text ?? "", color: .yellow)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "CityDetailViewController") as! CityDetailViewController
        
        let data = searchList.isEmpty ? filterList[indexPath.row] : searchList[indexPath.row]
        
        vc.city = data
        
        present(vc, animated: true)
    }
}
