//
//  NewsTableViewCell.swift
//  NewsApp
//
//  Created by cirrius on 26/01/24.
//

import UIKit
import SDWebImage

class NewsTableViewCell: UITableViewCell {
    
    //MARK: IBOutlets
    @IBOutlet weak var lblHeadline: UILabel!
    @IBOutlet weak var lblSummary: UILabel!
    @IBOutlet weak var lblAuthorName: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var lblExtraInfo: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setupData(model: NewsResult?){
        self.lblHeadline.text = model?.title
        self.lblAuthorName.text = model?.creator?.joined(separator: ",")
        self.lblSummary.text = model?.content
        self.lblExtraInfo.text = model?.category?.joined(separator: ",")
        self.lblDate.text = model?.pubDate
        //Date
        self.imageView?.sd_setImage(with: URL(string: (model?.imageURL ?? "")))
        
    }
    
}
