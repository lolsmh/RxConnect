//
//  RxKeyboard+Connect.swift
//  RxConnect
//
//  Created by Даниил Храповицкий on 09.08.2021.
//

#if canImport(RxKeyboard) && !RX_NO_MODULE

import RxSwift
import RxCocoa
import RxKeyboard

public extension RxKeyboard {
    
    /// Connects target-object with observing code provided by a **connectClosure**
    /// - Parameters:
    ///   - object: Target, witch Dispose Bag will be used in process of connecting
    ///   - connectClosure: Provides a reactive extension of a class on witch connect is used, and a ReactiveConnector
    class func connect(_ object: NSObject, connectClosure: (RxKeyboardType, ReactiveConnector) -> Void) {
        connectClosure(instance, ReactiveConnector(object))
    }
    
    /// Connects target-object with observing code provided by a **connectBuilder**
    /// - Parameters:
    ///   - object: Target, witch Dispose Bag will be used in process of connecting
    ///   - connectBuilder: Result Builder, that provides a reactive extension of a class on witch connect is used
    class func connect(_ object: NSObject, @ConnectionBuilder connectBuilder: (RxKeyboardType) -> [Disposable]) {
        connectBuilder(instance).forEach { disposable in
            disposable.disposed(by: object.rx.disposeBag)
        }
    }
}

#endif
