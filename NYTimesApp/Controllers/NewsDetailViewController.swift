//
//  NewsDetailViewController.swift
//  NYTimesApp
//
//  Created by Blessy Elizabeth Saini on 7/28/21.
//

import UIKit

class NewsDetailViewController: UIViewController {
    @IBOutlet weak var lblTitle:UILabel!
    @IBOutlet weak var lblbyLine:UILabel!
    @IBOutlet weak var lblPublishedDate:UILabel!
    @IBOutlet weak var lblSection:UILabel!
    @IBOutlet weak var lblAbstrct:UILabel!
    @IBOutlet weak var imgNews:UIImageView!
    var newsDetails:Result?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblTitle.text = newsDetails?.title
        lblSection.text = newsDetails?.section
        lblAbstrct.text = newsDetails?.abstract
        lblPublishedDate.text = newsDetails?.publishedDate
        lblbyLine.text = newsDetails?.byline
        if let imageURL = (newsDetails?.media?.first?.mediaMetadata?.last)?.url
        {
            self.imgNews.downloaded(from: URL(string: imageURL)!)
        }
        // Do any additional setup after loading the view.
    }

}
