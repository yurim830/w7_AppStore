//
//  AppStoreTableViewCell.swift
//  w7_AppStore
//
//  Created by 유림 on 4/11/24.
//

import UIKit

class AppStoreTableViewCell: UITableViewCell {
    
    static let identifier = "AppStoreTableViewCell"
    
    @IBOutlet weak var appScreenView: UIView!
    @IBOutlet weak var appScreen1: UIImageView!
    @IBOutlet weak var appScreen2: UIImageView!
    @IBOutlet weak var appScreen3: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setImageSize()
    }
    
    func setImageSize() {
        let width = UIScreen.main.bounds.width
        let height = UIScreen.main.bounds.height
        let imageWidth = (width - (30 + 20)) / 3
        let imageHeight = height / width * imageWidth
        
        NSLayoutConstraint.activate([
            appScreen1.widthAnchor.constraint(equalToConstant: imageWidth),
            appScreen1.heightAnchor.constraint(equalToConstant: imageHeight),
            appScreen2.widthAnchor.constraint(equalToConstant: imageWidth),
            appScreen2.heightAnchor.constraint(equalToConstant: imageHeight),
            appScreen3.widthAnchor.constraint(equalToConstant: imageWidth),
            appScreen3.heightAnchor.constraint(equalToConstant: imageHeight)
        ])
    }
}
