//
//  MagazineTableViewController.swift
//  Magazine+369+Travel
//
//  Created by YoungJin on 7/11/25.
//

import UIKit
import Kingfisher

class MagazineTableViewController: UITableViewController {
    
    var list: [Magazine] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "SeSAC TRAVEL"
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
        
        // 네임스페이스
        let cell = tableView.dequeueReusableCell(withIdentifier: "MagazineCell", for: indexPath) as! MagazineTableViewCell
        let data = list[indexPath.row]
        
        cell.titleLabel.text = data.title
        cell.subTitleLabel.text = data.subtitle
        cell.titleLabel.text = data.title
        
        cell.dateLabel.text = formatDate(data.date)
        
        let url = URL(string: list[indexPath.row].image)
        cell.photoimageView.kf.setImage(with: url)
        
        return cell
    }
    
    // Date 형식 변환
    private func formatDate(_ dateString: String) -> String {
        let forMattter = DateFormatter()
        forMattter.dateFormat = "yyMMdd"
        
        if let date = forMattter.date(from: dateString
        ) {
            forMattter.dateFormat = "yy년 MM월 dd일"
            return forMattter.string(from: date)
        } else { return ""}
    }
}
