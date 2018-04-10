//
//  ModulePresenter.swift
//  ModulePresenter
//
//  Created by lang on 09/04/2018.
//  Copyright © 2018 Beary Innovative. All rights reserved.
//

import Foundation

public class ModulePresenter {
    public static let shared = ModulePresenter()
    private init() {
        registerNotification()
    }

    fileprivate var _storege: [String: ModuleService] = [:]
}


extension ModulePresenter {
    public func register(for module: Modulable.Type) {
        assert(Thread.isMainThread)
        let key = _key(for: module.self)
        guard _storege[key] == nil else {
            fatalError("ERROR: duplicate registration: \(module)")
        }
        _storege[key] = module.shared
    }

    public func unregister(for module: Modulable.Type){
        assert(Thread.isMainThread)
        let key = _key(for: module.self)
        _storege[key] = nil
    }
}

extension ModulePresenter {
    public func invoke<M>(in moduel: M.Type, action: (M?) -> ()) {
        assert(Thread.isMainThread)
        let module = _storege.first(where: { _, m in m is M })?.value as? M
        action(module)
    }
}


private extension ModulePresenter {
    func _key(for module: Modulable.Type) -> String {
        return String(describing: module)
    }
}


extension ModulePresenter {
    @objc private func didEnterBackgroundNotification(_ notification: Notification) {
        _storege.forEach { _, module in
            module.didEnterBackground(UIApplication.shared)
        }
    }

    @objc private func willEnterForegroundNotification(_ notification: Notification) {
        _storege.forEach { _, module in
            module.willEnterForeground(UIApplication.shared)
        }
    }

    @objc private func didFinishLaunchingNotification(_ notification: Notification) {
        _storege.forEach { _, module in
            module.didFinishLaunching(UIApplication.shared)
        }
    }

    @objc private func didBecomeActiveNotification(_ notification: Notification) {
        _storege.forEach { _, module in
            module.didBecomeActive(UIApplication.shared)
        }
    }

    @objc private func willResignActiveNotification(_ notification: Notification) {
        _storege.forEach { _, module in
            module.willResignActive(UIApplication.shared)
        }
    }

    @objc private func didReceiveMemoryWarningNotification(_ notification: Notification) {
        _storege.forEach { _, module in
            module.didReceiveMemoryWarning(UIApplication.shared)
        }
    }

    @objc private func willTerminateNotification(_ notification: Notification) {
        _storege.forEach { _, module in
            module.willTerminate(UIApplication.shared)
        }
    }
}

extension ModulePresenter {
    func registerNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(didEnterBackgroundNotification), name: .UIApplicationDidEnterBackground, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(willEnterForegroundNotification), name: .UIApplicationWillEnterForeground, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(didFinishLaunchingNotification), name: .UIApplicationDidFinishLaunching, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(didBecomeActiveNotification), name: .UIApplicationDidBecomeActive, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(willResignActiveNotification), name: .UIApplicationWillResignActive, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(didReceiveMemoryWarningNotification) , name: .UIApplicationDidReceiveMemoryWarning, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(willTerminateNotification), name: .UIApplicationWillTerminate, object: nil)
    }
}
