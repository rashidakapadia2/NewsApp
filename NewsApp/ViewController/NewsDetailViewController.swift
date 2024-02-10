//
//  NewsDetailViewController.swift
//  NewsApp
//
//  Created by cirrius on 26/01/24.
//

import UIKit

class NewsDetailViewController: UIViewController {
    
    //MARK: Variable
    var viewModel: DetailViewModelProtocol?
    
    //MARK: IBOutlets
    
    @IBOutlet weak var imgView: UIImageView!
    
    @IBOutlet weak var lblCategory: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var lblSource: UILabel!
    @IBOutlet weak var lblDetail: UILabel!
    @IBOutlet weak var lblAuthor: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var VStack: UIStackView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupData()
    }
    
    //    override func viewWillAppear(_ animated: Bool) {
    //        super.viewWillAppear(animated)
    //        setupData()
    //    }
    
    init(viewModel: DetailViewModelProtocol) {
        super.init(nibName: "NewsDetailViewController", bundle: nil)
        self.viewModel = viewModel
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        view.backgroundColor = .systemBackground
        title = "Details"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func setupData(){
        let model = viewModel?.result
        self.lblTitle.text = model?.title
        self.lblAuthor.text = model?.creator?.joined(separator: ",")
        self.lblDetail.text = model?.description
        self.lblCategory.text = model?.category?.joined(separator: ",")
        self.lblDate.text = model?.pubDate
        self.lblSource.text = model?.link
        //Date
        self.imgView?.sd_setImage(with: URL(string: (model?.imageURL ?? "")))
        
    }
    
}
