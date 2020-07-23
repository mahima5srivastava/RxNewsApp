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
    
    //MARK:- PRoperties
    var title = BehaviorRelay.init(value: "")
    var description = BehaviorRelay.init(value: "")
    
    //MARK:- Initializer
    init(_ article: Article) {
        self.title.accept(article.title ?? "")
        self.description.accept(article.description ?? "")
    }
    
}
