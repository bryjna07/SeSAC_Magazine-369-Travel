//
//  TravelTableViewController.swift
//  Magazine+369+Travel
//
//  Created by YoungJin on 7/11/25.
//

import UIKit
import Toast

final class TravelTableViewController: UITableViewController {
    
    private var list: [Travel] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(CellType.travel.nib, forCellReuseIdentifier: CellType.travel.id)
        
        tableView.register(CellType.ad.nib, forCellReuseIdentifier: CellType.ad.id)
        
        title = Text.travelTitle
        
        let data = TravelInfo()
       
        list = data.travel
    }
    
    //MARK: - Delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if list[indexPath.row].ad {
            view.makeToast("광고 셀입니다.", position: .bottom)
            
            let sb = UIStoryboard(name: "Main", bundle: nil)
            
            let vc = sb.instantiateViewController(withIdentifier: "AdViewController") as! AdViewController
            
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: true)
            
        } else {
            
            let sb = UIStoryboard(name: "Main", bundle: nil)
            
            let vc = sb.instantiateViewController(withIdentifier: "PlaceViewController") as! PlaceViewController
            
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    
    //MARK: - DataSource

    override func numberOfSections(in tableView: UITableView) -> Int {

        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
  
        return list.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if list[indexPath.row].ad {
            let cell = tableView.dequeueReusableCell(withIdentifier: CellType.ad.id, for: indexPath) as! AdCell
            
            cell.travel = list[indexPath.row]
            
            return cell

        } else {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: CellType.travel.id, for: indexPath) as! TravelCell

            cell.travel = list[indexPath.row]
            
            cell.likeButton.tag = indexPath.row // 셀 인덱스 정보 전달
            cell.likeButton.addTarget(self, action: #selector(likeButtonTapped), for: .touchUpInside)
            
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return list[indexPath.row].ad ? 90 : 180
    }
    
    //MARK: - ButtonAction
    
    @objc func likeButtonTapped(_ sender: UIButton) {
        let index = sender.tag
        list[index].like?.toggle()
        tableView.reloadRows(at: [IndexPath(row: index, section: 0)], with: .none)
    }
    
    
}
