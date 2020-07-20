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
    let disposeBag = DisposeBag()
    var articles = [Article]()
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
                self?.articles = articles
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            }
        }).disposed(by: disposeBag)
    }
        
        
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.articles.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCell", for: indexPath) as? NewsCell else {return UITableViewCell()}
        cell.titleLabel.text = articles[indexPath.row].title
        cell.descriptionLabel.text = articles[indexPath.row].description
        return cell
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
