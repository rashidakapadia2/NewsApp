//
//  NewsTableViewCell.swift
//  NewsApp
//
//  Created by cirrius on 26/01/24.
//

import UIKit
import SDWebImage

protocol linkTappedDelegate: AnyObject {
    func linkWasTapped(for linkNews: NewsResult?)
}

class NewsTableViewCell: UITableViewCell {
    
    static let reuseIdentifier = "StoryCell"
    
    weak var delegate: linkTappedDelegate!
    
    var news: NewsResult!
    
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
    
    //    func setupData(model: NewsResult?){
    //        self.lblHeadline.text = model?.title
    //        self.lblAuthorName.text = model?.creator?.joined(separator: ",")
    //        self.lblSummary.text = model?.content
    //        self.lblExtraInfo.text = model?.category?.joined(separator: ",")
    //        self.lblDate.text = model?.pubDate
    //        //Date
    //        self.imageView?.sd_setImage(with: URL(string: (model?.imageURL ?? "")))
    //
    //    }
    
    let linkButton = Button()
    let titleLabel = TitleLabel(textAlignment: .left, fontSize: 16)
    let authorLabel = BodyLabel(textAlignment: .left, fontSize: 12)
    let upVoteLabel = SymbolView(symbol: UIImage(systemName: "arrow.up")!)
    let commentLabel = SymbolView(symbol: UIImage(systemName: "text.bubble")!)
    let timeOfPost = SymbolView(symbol: UIImage(systemName: "clock")!)
    
    
    let footerStackView = UIStackView()
    let headerStackView = UIStackView()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configure()
        configureFooterStackView()
        configureHeaderStackView()
        configureLinkButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(news: NewsResult?) {
        self.news = news
        
        linkButton.set(title: "Link")
        titleLabel.text = news?.title
        authorLabel.text = "By: \(String(describing: news?.creator?.joined(separator: ",")))"
        //        upVoteLabel.set(text: String(news?.aiTag))
        //            commentLabel.set(text: String(news?.category?.joined(separator: ",")))
        //        timeOfPost.set(text: String(news?.pubDate))
    }
    
    private func configureLinkButton() {
        linkButton.addTarget(self, action: #selector(linkButtonTapped), for: .touchUpInside)
    }
    
    @objc func linkButtonTapped() {
        delegate.linkWasTapped(for: news)
    }
    
    private func configure() {
        contentView.addSubview(headerStackView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(authorLabel)
        contentView.addSubview(footerStackView)
        
        footerStackView.translatesAutoresizingMaskIntoConstraints = false
        headerStackView.translatesAutoresizingMaskIntoConstraints = false
        
        let padding: CGFloat = 20
        
        NSLayoutConstraint.activate([
            
            headerStackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            headerStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            
            
            titleLabel.topAnchor.constraint(equalTo: headerStackView.bottomAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -40),
            
            authorLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            authorLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            
            footerStackView.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: 11),
            footerStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            footerStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -14)
            
        ])
    }
    
    private func configureHeaderStackView() {
        headerStackView.axis = .horizontal
        headerStackView.spacing = 5
        
        
        headerStackView.addArrangedSubview(linkButton)
    }
    
    private func configureFooterStackView() {
        // StackView is layedout to be Horizontal with spacing of 10.
        footerStackView.axis = .horizontal
        footerStackView.spacing = 10
        
        footerStackView.addArrangedSubview(upVoteLabel)
        footerStackView.addArrangedSubview(commentLabel)
        footerStackView.addArrangedSubview(timeOfPost)
    }
    
}
