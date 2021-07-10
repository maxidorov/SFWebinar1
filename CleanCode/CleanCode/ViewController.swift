//
//  ViewController.swift
//  CleanCode
//
//  Created by Maxim V. Sidorov on 6/24/21.
//

import UIKit

protocol P {
  func f()
}

final class ViewController: UIViewController {

  let tableView = UITableView()
  let cellID = "cell"

  override func viewDidLoad() {
    super.viewDidLoad()

    tableView.delegate = self
    tableView.dataSource = self
    tableView.register(
      UITableViewCell.self,
      forCellReuseIdentifier: cellID
    )

    view.addSubview(tableView)
  }

  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    tableView.frame = view.bounds
  }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(
    _ tableView: UITableView,
    numberOfRowsInSection section: Int
  ) -> Int {
    10
  }

  func tableView(
    _ tableView: UITableView,
    cellForRowAt indexPath: IndexPath
  ) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: cellID)!
    cell.textLabel?.text = "Hello"
    return cell
  }
}

extension ViewController: P {
  func f() {
    print("Hello")
  }
}
