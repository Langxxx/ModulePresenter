//
//  ViewController_1.swift
//  ModuleA
//
//  Created by lang on 09/04/2018.
//  Copyright © 2018 Beary Innovative. All rights reserved.
//

import UIKit
import ModulePresenter

public class ViewController_1: UIViewController {
    override public func loadView() {
        super.loadView()
        view.backgroundColor = .white
        tabBarItem = UITabBarItem(title: "ModuelA", image: UIImage(), selectedImage: UIImage())

        let buttons = [UIButton(), UIButton()]
        let config = [("Show View 2", #selector(showView2)), ("Show View in moduleB ", #selector(showViewInModuleB))]
        zip(buttons, config).forEach { (button, config) in
            button.setTitle(config.0, for: .normal)
            button.addTarget(self, action: config.1, for: .touchUpInside)
            button.setTitleColor(.black, for: .normal)
        }
        let stack = UIStackView(arrangedSubviews: buttons)
        stack.distribution = .fillEqually
        stack.axis = .vertical
        view.addSubview(stack)
        stack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stack.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stack.widthAnchor.constraint(equalToConstant: 300),
            stack.heightAnchor.constraint(equalToConstant: 200)
        ])
    }

    @objc func showView2() {
        show(ViewController_2(), sender: nil)
    }

    @objc func showViewInModuleB() {
        ModulePresenter.shared.invoke(in: ModuleBProtocol.self) { moduleA in
            moduleA?.showView2(from: self)
        }
    }
}



class ViewController_2: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        title = "Moduel_A_View2"
    }
}
