//
//  NewsViewController.swift
//  RxNewsApp
//
//  Created by MAHIMA on 20/07/20.
//  Copyright © 2020 MAHIMA. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class NewsViewController: UITableViewController {
    
    //MARK:- IBOutelts
    
    @IBOutlet var newsTableView: UITableView!
    var articleListVM: ArticleListViewModel?
    let disposeBag = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "News"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        populateNews()
    }

    private func populateNews() {
        guard let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=78aed7e3e8c54c5db52e54370adffcd3") else {return}
        let resource = Resource<ArticlesList>(url: url)
        let request = URLRequest.load(resource: resource)
        request.subscribe(onNext: {[weak self] articleList in
            if let articles = articleList?.articles {
                self?.articleListVM = ArticleListViewModel(articles)
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            }
        }).disposed(by: disposeBag)
    }
        
    @IBAction func changeTapped(_ sender: Any) {
        self.articleListVM?.articleAt(0).title.accept("\(Int.random(in: 1..<5))")
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.articleListVM?.articlesVM.count ?? 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCell", for: indexPath) as? NewsCell else {return UITableViewCell()}
        let articleVM = articleListVM?.articlesVM[indexPath.row]
        articleVM?.title.asDriver(onErrorJustReturn: "").drive(cell.titleLabel.rx.text).disposed(by: disposeBag)
        articleVM?.description.asDriver(onErrorJustReturn: "").drive(cell.descriptionLabel.rx.text).disposed(by: disposeBag)
        return cell
    }

}
