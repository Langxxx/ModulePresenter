//
//  Modules.swift
//  ModuleB
//
//  Created by lang on 09/04/2018.
//  Copyright © 2018 Beary Innovative. All rights reserved.
    //

import Foundation


public protocol ModuleAProtocol: Modulable {
    func showView2(from: UIViewController)
}

public protocol ModuleBProtocol: Modulable {
    func showView2(from: UIViewController)
}
