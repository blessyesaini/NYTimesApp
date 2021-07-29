//
//  NewsListTableViewCell.swift
//  NYTimesApp
//
//  Created by Blessy Elizabeth Saini on 7/28/21.
//

import UIKit

class NewsListTableViewCell: UITableViewCell {

    @IBOutlet weak var lblTitle:UILabel!
    @IBOutlet weak var lblbyLine:UILabel!
    @IBOutlet weak var lblPublishedDate:UILabel!
    @IBOutlet weak var imgNews:UIImageView!
    
    func setCellValus(result:Result) {
        self.lblTitle.text = result.title
        self.lblbyLine.text = result.byline
        self.lblPublishedDate.text = result.publishedDate
        self.imgNews.layer.cornerRadius = self.imgNews.frame.width/2
        self.imgNews.layer.masksToBounds = true
        
        if let imageURL = (result.media?.first?.mediaMetadata?.first)?.url
        
        {
            self.imgNews.downloaded(from: URL(string: imageURL)!)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
extension UIImageView {
    func downloaded(from url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFit) {  // for swift 4.2 syntax just use ===> mode: UIView.ContentMode
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() {
                self.image = image
            }
        }.resume()
    }
}
