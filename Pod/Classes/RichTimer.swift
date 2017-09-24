//
//  RichTimer.swift
//  Pods
//
//  Created by Pilipenko Dima on 4/1/16.
//
//

import Foundation

public extension Timer {
    class func once(_ value: TimeInterval, completion: @escaping () -> Void) -> Timer {
        return initTimer(value, userInfo: VoidBox(nilCompletion: completion), repeats: false)
    }
    
    class func every(_ value: TimeInterval, completion: @escaping () -> Void) -> Timer {
        return initTimer(value, userInfo: VoidBox(nilCompletion: completion), repeats: true)
    }
    
    class func once<T>(_ value: TimeInterval, arguments: T, completion: @escaping (T) -> Void) -> Timer {
        return initTimer(value, userInfo: Box(arguments, completion: completion), repeats: false)
    }
    
    class func every<T>(_ value: TimeInterval, arguments: T, completion: @escaping (T) -> Void) -> Timer {
        return initTimer(value, userInfo: Box(arguments, completion: completion), repeats: true)
    }
    
    @objc class func timerDidFired(timer: Timer) {
        let box = timer.userInfo! as! Boxable
        box.lookInside()
    }
    
    private class func initTimer(_ ti: TimeInterval, userInfo: AnyObject, repeats: Bool = false) -> Timer {
        return Timer.scheduledTimer(timeInterval: ti, target: self, selector: #selector(timerDidFired(timer:)), userInfo: userInfo, repeats: repeats)
    }
}

private class VoidBox: Boxable {
    typealias CompletionType = () -> Void
    
    private var _completion: CompletionType!
    
    init(nilCompletion completion: @escaping CompletionType) {
        self._completion = completion
    }
    
    func lookInside() {
        _completion()
    }
    
    deinit {
        _completion = nil
    }
}

private class Box<T>: Boxable {
    typealias CompletionType = (T) -> Void
    
    private var _arguments: T!
    private var _completion: CompletionType!
    
    init(_ arguments: T!, completion: @escaping CompletionType) {
        self._arguments = arguments
        self._completion = completion
    }
    
    func lookInside() {
        _completion(_arguments)
    }
    
    deinit {
        _arguments = nil
        _completion = nil
    }
}

private protocol Boxable {
    func lookInside()
}
