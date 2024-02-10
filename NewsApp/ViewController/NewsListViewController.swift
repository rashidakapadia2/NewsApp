//
//  NewsListViewController.swift
//  NewsApp
//
//  Created by cirrius on 26/01/24.
//

import UIKit

class NewsListViewController: UIViewController, linkTappedDelegate {
    func linkWasTapped(for linkNews: NewsResult?) {
        guard let url = URL(string: linkNews?.sourceURL ?? "https://www.google.com") else { return }
    }
    
    
    //MARK: Variable
    var viewModel: ListViewModelProtocol?
    
    //MARK: IBOutlets
    //    @IBOutlet weak var newsListTableView: UITableView!
    
    var newsListTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //        setupUI()
        configureViewController()
        configureTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchNews()
    }
    
    private func configureViewController() {
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "News"
    }
    
    private func configureTableView() {
        newsListTableView = UITableView(frame: view.bounds)
        view.addSubview(newsListTableView)
        
        newsListTableView.delegate = self
        newsListTableView.dataSource = self
        newsListTableView.register(NewsTableViewCell.self, forCellReuseIdentifier: "NewsTableViewCell")
    }
    
    init(viewModel: ListViewModelProtocol) {
        super.init(nibName: "NewsListViewController", bundle: nil)
        self.viewModel = viewModel
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //    func setupUI() {
    //        newsListTableView.delegate = self
    //        newsListTableView.dataSource = self
    //        newsListTableView.register(UINib(nibName: "NewsTableViewCell", bundle: nil), forCellReuseIdentifier: "NewsTableViewCell")
    //    }
    
    func fetchNews() {
        viewModel?.fetchNewsData(topic: "wars", completion: { result in
            switch result {
            case .success(_):
                DispatchQueue.main.async {
                    self.newsListTableView.reloadData()
                }
                
            case .failure(let err):
                print("\(err)")
            }
        })
    }
    
}

extension NewsListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.arrNewsResult?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsTableViewCell") as! NewsTableViewCell
        cell.set(news: viewModel?.arrNewsResult?[indexPath.row])
        cell.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        let viewmodel = DetailViewModel(result: viewModel?.arrNewsResult?[indexPath.row])
        let viewController: NewsDetailViewController = NewsDetailViewController(viewModel: viewmodel)
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}

//extension NewsListViewController: UITableViewDelegate, UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        viewModel?.arrNewsResult?.count ?? 0
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsTableViewCell", for: indexPath) as! NewsTableViewCell
//        cell.setupData(model: viewModel?.arrNewsResult?[indexPath.row])
//        return cell
//    }
//
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let viewmodel = DetailViewModel(result: viewModel?.arrNewsResult?[indexPath.row])
//        let viewController: NewsDetailViewController = NewsDetailViewController(viewModel: viewmodel)
//        self.navigationController?.pushViewController(viewController, animated: true)
//    }
//
//}
