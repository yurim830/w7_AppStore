//
//  AppStoreViewController.swift
//  w7_AppStore
//
//  Created by 유림 on 4/11/24.
//

import UIKit

class AppStoreViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.register(UINib(nibName: AppStoreTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: AppStoreTableViewCell.identifier) // 셀 등록
        tableView.dataSource = self
    }
    
    // 뷰 높이, 너비 구하기
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
//        let width = UIScreen.main.bounds.width
//        let height = UIScreen.main.bounds.height
    }
}

extension AppStoreViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: AppStoreTableViewCell.identifier, for: indexPath) as? AppStoreTableViewCell else {
            return UITableViewCell()
        }
        return cell
    }
    
    
}
