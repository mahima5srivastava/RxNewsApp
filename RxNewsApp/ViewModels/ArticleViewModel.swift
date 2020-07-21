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
    
    let article: Article
    
    init(_ article: Article) {
        self.article = article
    }
    
}

extension ArticleViewModel {
    
    var title: Observable<String> {
        return Observable<String>.just(article.title ?? "")
    }
    
    var description: Observable<String> {
        return Observable<String>.just(article.description ?? "")
    }
    
}
