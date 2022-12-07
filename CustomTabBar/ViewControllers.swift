//
//  ViewControllers.swift
//  CustomTabBar
//
//  Created by Dmitry Victorovich on 19.11.2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarItem.image = UIImage(systemName: "doc.circle")?.withBaselineOffset(fromBottom: 28.5)
        tabBarItem.tag = 1
    }
}

class ViewController2: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarItem.image = UIImage(systemName: "folder.circle")?.withBaselineOffset(fromBottom: 28.5)
        tabBarItem.tag = 2
    }
}

class ViewController3: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarItem.image = UIImage(systemName: "calendar.circle.fill")?.withBaselineOffset(fromBottom: 28.5)
        tabBarItem.tag = 3
    }
}

class ViewController4: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarItem.image = UIImage(systemName: "books.vertical.circle.fill")?.withBaselineOffset(fromBottom: 28.5)
        tabBarItem.tag = 4
    }
}

