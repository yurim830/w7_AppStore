//
//  AppStoreViewController.swift
//  w7_AppStore
//
//  Created by 유림 on 4/11/24.
//

import UIKit

class AppStoreViewController: UIViewController {
    var apps: [AppDetails]?
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        apps = readJSONFromFile()
        tableView.dataSource = self
        tableView.register(UINib(nibName: AppStoreTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: AppStoreTableViewCell.identifier) // 셀 등록
    }
    
    // MARK: - Json에서 파일 읽어오는 함수
    func readJSONFromFile() -> [AppDetails]? {
        guard let path = Bundle.main.path(forResource: "AppsJson", ofType: "json") else { return nil }
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe) // error thrown
            let decoder = JSONDecoder()
            let apps = try decoder.decode([AppDetails].self, from: data) // error thrown
            return apps
        } catch {
            print("Error reading JSON file: \(error)")
            return nil
        }
    }
}

// MARK: TableView 세팅
extension AppStoreViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return apps?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: AppStoreTableViewCell.identifier, for: indexPath) as? AppStoreTableViewCell else {
            return UITableViewCell()
        }
        cell.selectionStyle = .none
        return cell
    }
    
    
}
