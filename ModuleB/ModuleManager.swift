//
//  ModuleManager.swift
//  ModuleB
//
//  Created by lang on 09/04/2018.
//  Copyright © 2018 Beary Innovative. All rights reserved.
//

import Foundation
import ModulePresenter

public class ModuleBManager: ModuleBProtocol {
    public static let shared: ModuleService = ModuleBManager()
    private init() {  }
    public func showView2(from: UIViewController) {
        from.show(ViewController_2(), sender: nil)
    }
}
