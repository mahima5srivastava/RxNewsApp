//
//  ArticleViewModel.swift
//  RxNewsApp
//
//  Created by MAHIMA on 21/07/20.
//  Copyright © 2020 MAHIMA. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

struct ArticleViewModel {
    
    var article: Article
    var title = BehaviorRelay.init(value: "")
    var description = BehaviorRelay.init(value: "")
    init(_ article: Article) {
        self.article = article
        self.title.accept(article.title ?? "")
        self.description.accept(article.description ?? "")
    }
    
}
