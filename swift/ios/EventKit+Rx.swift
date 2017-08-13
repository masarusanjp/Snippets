//
//  EventKit+Rx.swift
//  CalendarNotification
//
//  Created by Ichikawa Masaru on 2017/08/07.
//  Copyright © 2017年 masaichi. All rights reserved.
//

import Foundation
import EventKit
import RxSwift

extension Reactive where Base: EKEventStore {
    func requestAccess(to entityType: EKEntityType) -> Observable<Bool> {
        let store = base
        return Observable<Bool>.create { observable in
            store.requestAccess(to: entityType) { (succeeded, error) in
                if let error = error {
                    observable.onError(error)
                } else {
                    observable.onNext(succeeded)
                    observable.onCompleted()
                }
            }
            return Disposables.create()
        }
    }
}
