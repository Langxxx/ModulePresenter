//
//  ModulePresenter+Extension.swift
//  ModulePresenter
//
//  Created by lang on 09/04/2018.
//  Copyright © 2018 Beary Innovative. All rights reserved.
//

import UIKit

public protocol ModuleService {
    func didEnterBackground(_ application: UIApplication)
    func willEnterForeground(_ application: UIApplication)
    func didFinishLaunching(_ application: UIApplication)
    func didBecomeActive(_ application: UIApplication)
    func willResignActive(_ application: UIApplication)
    func didReceiveMemoryWarning(_ application: UIApplication)
    func willTerminate(_ application: UIApplication)

}

public extension ModuleService {
    func didEnterBackground(_ application: UIApplication) {}
    func willEnterForeground(_ application: UIApplication) {}
    func didFinishLaunching(_ application: UIApplication) {}
    func didBecomeActive(_ application: UIApplication) {}
    func willResignActive(_ application: UIApplication) {}
    func didReceiveMemoryWarning(_ application: UIApplication) {}
    func willTerminate(_ application: UIApplication) {}
}


public protocol Singletonbility {
    static var shared: ModuleService { get }
}

public typealias Modulable = ModuleService & Singletonbility
