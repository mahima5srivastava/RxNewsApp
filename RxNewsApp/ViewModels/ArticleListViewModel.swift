//
//  ArticleListViewModel.swift
//  RxNewsApp
//
//  Created by MAHIMA on 21/07/20.
//  Copyright © 2020 MAHIMA. All rights reserved.
//

import Foundation

import Foundation
import RxSwift
import RxCocoa

struct ArticleListViewModel {
    let articlesVM: [ArticleViewModel]
}

extension ArticleListViewModel {
    
    init(_ articles: [Article]) {
        self.articlesVM = articles.compactMap(ArticleViewModel.init)
    }
    
}

extension ArticleListViewModel {
    
    func articleAt(_ index: Int) -> ArticleViewModel {
        return self.articlesVM[index]
    }
}


