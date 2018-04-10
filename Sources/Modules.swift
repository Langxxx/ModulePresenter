//
//  Modules.swift
//  ModuleB
//
//  Created by lang on 09/04/2018.
//  Copyright © 2018 Beary Innovative. All rights reserved.
//

/*
 每一个模块(组件)对应一个protocol, 定义了一个模块需要暴露给其他模块的接口，此文件由模块提供者负责维护。
 protocol为模块间的通信提供一个强类型的接口，且支持非常规参数
 */

import Foundation


public protocol ModuleAProtocol: Modulable {
    func showView2(from: UIViewController)
}

public protocol ModuleBProtocol: Modulable {
    func showView2(from: UIViewController)
}
