//
//  ViewController.swift
//  NYTimesApp
//
//  Created by Blessy Elizabeth Saini on 7/28/21.
//

import UIKit

class MostPopularNewsListViewController: UIViewController
    
{
    @IBOutlet weak var tblViewNewsList:UITableView!
    let newsListViewModel = NewsListResultsViewModel()
    var newsResult = [Result]() {
        didSet {
            DispatchQueue.main.async {
                self.tblViewNewsList.reloadData()
            }
        }
    }
    //Mark: view life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
     setTableViewValues()
     callAPIFunction()
     
    }
}

extension MostPopularNewsListViewController {
    func setTableViewValues() {
        tblViewNewsList.rowHeight = UITableView.automaticDimension
        tblViewNewsList.estimatedRowHeight = 120
        tblViewNewsList.register(UINib(nibName: AppCells.newsListCell.getName(), bundle: nil), forCellReuseIdentifier: AppCells.newsListCell.getName())
    }
    func callAPIFunction() {
        if GeneralHandler().testConnection() {
            newsListViewModel.getMostPupularNewsFeed(section: "all-sections", period: 7){results in
                guard let newsData = results else {
                    
                    return
                
                }
                self.newsResult = newsData
            }
        }
        else{
            GeneralHandler().showAlert(controller: self, message: "Not connected to Internet")
        }
    }
}
//MARK:- Tableview delegate and datasource methods
extension MostPopularNewsListViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        newsResult.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: AppCells.newsListCell.getName(), for: indexPath) as! NewsListTableViewCell
        cell.setCellValus(result: newsResult[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let detailsVC  = self.storyboard?.instantiateViewController(identifier: "NewsDetailViewController") as! NewsDetailViewController
        detailsVC.newsDetails = newsResult[indexPath.row]
        self.navigationController?.pushViewController(detailsVC, animated: true)
    }
    
}
