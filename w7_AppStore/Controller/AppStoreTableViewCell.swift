//
//  AppStoreTableViewCell.swift
//  w7_AppStore
//
//  Created by 유림 on 4/11/24.
//

import UIKit

class AppStoreTableViewCell: UITableViewCell {
    
    static let identifier = "AppStoreTableViewCell"
    
    @IBOutlet weak var appIcon: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var evaluationCountLabel: UILabel!
    @IBOutlet weak var developerLabel: UILabel!
    @IBOutlet weak var chartLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var appScreen1: UIImageView!
    @IBOutlet weak var appScreen2: UIImageView!
    @IBOutlet weak var appScreen3: UIImageView!
    @IBOutlet weak var chartLabelView: UIView!

    

    override func awakeFromNib() { // xib에서 작업했을 경우 // 코드로만 그렸을 경우 init에서
        super.awakeFromNib()
        setupView()
        setupConstraints()
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) { // 셀의 선택 여부에 따라 실행되는 함수
        super.setSelected(selected, animated: animated)
//        setPreviewImageSize()
//        setPreviewImageShape()
//        setChartLabelView()
    }
    
    override func prepareForReuse() { // 셀이 reuse 될 때만 불려옴 (바닥 찍을 때)
        super.prepareForReuse()
//        setPreviewImageSize()
//        setPreviewImageShape()
//        setChartLabelView()
    }
    
    
    override func layoutSubviews() { // 불리는 타이밍이 여러번, 예측불가.
        super.layoutSubviews()
//        setPreviewImageSize()
//        setPreviewImageShape()
//        setChartLabelView()
    }

    // setupView(), setupConstraints()로 묶자!!
    func setupView() {
        setPreviewImageShape()
        setChartLabelView()
    }
    func setupConstraints() {
        setPreviewImageSize()
    }
    
    // MARK: - preview image layout
    func setPreviewImageSize() {
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
    
    func setPreviewImageShape() {
        appScreen1.layer.cornerRadius = 10
        appScreen2.layer.cornerRadius = 10
        appScreen3.layer.cornerRadius = 10
    }
    
    // MARK: - set label layout
    func setChartLabelView() {
        chartLabelView.layer.borderWidth = 1.2
        chartLabelView.layer.borderColor = UIColor.systemGray.cgColor
        chartLabelView.layer.cornerRadius = 3
    }
    
   
    func configure(_ app: AppDetails) {
        self.appIcon.image = UIImage(named: app.icon)
        self.titleLabel.text = app.title
        self.subTitleLabel.text = app.subTitle
        self.evaluationCountLabel.text = app.evaluationCount
        self.developerLabel.text = app.developer
        self.chartLabel.text = String(app.chart)
        self.categoryLabel.text = app.category
        self.appScreen1.image = UIImage(named: app.images[0])
        self.appScreen2.image = UIImage(named: app.images[1])
        self.appScreen3.image = UIImage(named: app.images[2])
    }
}
