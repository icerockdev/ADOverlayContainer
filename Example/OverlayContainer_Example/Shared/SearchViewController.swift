//
//  SearchViewController.swift
//  OverlayContainer_Example
//
//  Created by Gaétan Zanella on 29/11/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    let header = Bundle.main.loadNibNamed("DetailHeaderView", owner: self, options: nil)![0] as! UIView
    let tableView = UITableView()

    // MARK: - UIViewController

    override func loadView() {
        view = UIView()
        setUpView()
        title = "Search"
    }

    // MARK: - UITableViewDataSource

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") ?? UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.textLabel?.text = "Row \(indexPath.row)"
        cell.textLabel?.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

    // MARK: - Private

    private func setUpView() {
        view.backgroundColor = .white
        view.addSubview(tableView)
        view.addSubview(header)
        header.heightAnchor.constraint(equalToConstant: 70).isActive = true
        header.pinToSuperview(edges: [.left, .right])
        if #available(iOS 11.0, *) {
            header.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        } else {
            header.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor).isActive = true
        }
        tableView.alwaysBounceVertical = false
        tableView.dataSource = self
        tableView.pinToSuperview(edges: [.left, .right, .bottom])
        tableView.topAnchor.constraint(equalTo: header.bottomAnchor).isActive = true
        tableView.delegate = self
    }
}
