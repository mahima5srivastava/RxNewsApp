//
//  ArticleModel.swift
//  RxNewsApp
//
//  Created by MAHIMA on 20/07/20.
//  Copyright © 2020 MAHIMA. All rights reserved.
//

import Foundation

struct Article: Codable {
    var title: String?
    let description: String?
}

struct ArticlesList: Codable {
    let articles: [Article]?
}
