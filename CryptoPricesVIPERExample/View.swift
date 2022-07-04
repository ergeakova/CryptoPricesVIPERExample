//
//  View.swift
//  CryptoPricesVIPERExample
//
//  Created by Erge Gevher Akova on 5.07.2022.
//

import Foundation
import UIKit

protocol AnyView{
    var presenter: AnyPresenter? {get set}
    func updateTable(with cryptos: [Crypto])
    func updateTable(with error: String)
}

class CryptoView: UIViewController, AnyView, UITableViewDelegate, UITableViewDataSource{
  
    var presenter: AnyPresenter?
    var cryptos: [Crypto] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(tableView)
        view.addSubview(messageLabel)
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
        messageLabel.frame = CGRect(x: view.frame.width / 2 - 100, y: view.frame.height / 2 - 25, width: 200, height: 50)
    }
    
    private var tableView: UITableView = {
       let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        table.isHidden = true
        return table
    }()
    
    private var messageLabel: UILabel = {
       let label = UILabel()
        label.isHidden = false
        label.text = "Downloading..."
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    func updateTable(with cryptos: [Crypto]){
        DispatchQueue.main.async {
            self.cryptos = cryptos
            self.messageLabel.isHidden = true
            self.tableView.reloadData()
            self.tableView.isHidden = false
        }
    }
    func updateTable(with error: String){
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cryptos.count
    }
    
}
