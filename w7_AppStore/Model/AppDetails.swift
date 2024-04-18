//
//  AppDetails.swift
//  w7_AppStore
//
//  Created by 유림 on 4/18/24.
//

import Foundation

struct AppDetails: Codable {
    let id: Int
    let title: String
    let subTitle: String
    let stars: Int
    let evaluationCount: Int
    let developer: String
    let chart: Int
    let catagory: String
    let icon: String
    let images: String
}
