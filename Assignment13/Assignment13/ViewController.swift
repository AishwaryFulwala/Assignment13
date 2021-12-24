//
//  ViewController.swift
//  Assignment13
//
//  Created by DCS on 24/12/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  private let myTableView = UITableView()
  
  private var temp = [Weather]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    title = "Weather App"
    
    self.temp = ApiHandler.shared.getWeather()
        
    DispatchQueue.main.async {
            self.myTableView.reloadData()
    }
    
    view.addSubview(myTableView)
    setupTableView()
  }
  
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    
    myTableView.frame = view.frame
  }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
  
  private func setupTableView() {
    myTableView.dataSource = self
    myTableView.delegate = self
    myTableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return temp.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
    let t = temp[indexPath.row]
    cell.textLabel?.text = "\(t.location.name) | Celcius : \(t.current.temp_c) | Fahrenheit : \(t.current.temp_f)"
    return cell
  }
}
