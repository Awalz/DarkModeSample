//
//  ViewController.swift
//  DarkMode
//
//  Created by Andrew on 2017-09-15.
//  Copyright © 2017 Walzy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var sections = ["Section 1", "Section 2", "Section 3"]
    var titles = [["First", "Second", "Third"], ["Red", "Blue", "Yellow"], ["Cat", "Dog", "Fish"]]
    var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView                 = UITableView(frame: view.frame, style: .grouped)
        tableView.backgroundColor = Palette.backgroundColor
        tableView.delegate        = self
        tableView.dataSource      = self
        view.addSubview(tableView)
        NotificationCenter.default.addObserver(self, selector: #selector(colorsUpdated), name: Notification.Name(rawValue: "colorUpdated"), object: nil)
        navigationItem.title = "Sample App"
        navigationController?.navigationBar.setTheme()
        
        // Add Two Finger Swipe Gesture
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(twoFingerSwipe(_:)))
        panGesture.minimumNumberOfTouches = 2
        panGesture.maximumNumberOfTouches = 2
        tableView.addGestureRecognizer(panGesture)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc private func colorsUpdated() {
        tableView.backgroundColor = Palette.backgroundColor
        navigationController?.navigationBar.setTheme()
        tableView.reloadData()
    }
    
    @objc private func twoFingerSwipe(_ pan: UIPanGestureRecognizer) {
        let translation = pan.translation(in: view).y
        
        if translation > 100.0 && isDarkMode == false {
            isDarkMode = true
        }
        
        if translation < -100.0 && isDarkMode == true {
            isDarkMode = false
        }
    }
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor      = Palette.secondaryBackgroundColor
        cell.textLabel?.textColor = Palette.accentColor
        cell.textLabel?.font      = UIFont.systemFont(ofSize: 16.0, weight: Palette.fontWeight)
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return CGFloat.leastNormalMagnitude
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return nil
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerLabel             = UILabel(frame: CGRect(x: 0.0, y: 0.0, width: view.frame.width, height: 40.0))
        headerLabel.backgroundColor = Palette.backgroundColor
        headerLabel.textColor       = Palette.textColor
        headerLabel.textAlignment   = .center
        headerLabel.text            = sections[section]
        return headerLabel
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40.0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40.0
    }
    
}

extension ViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.selectionStyle = .none
        cell.textLabel?.text = titles[indexPath.section][indexPath.row]
        return cell
    }
    
}
