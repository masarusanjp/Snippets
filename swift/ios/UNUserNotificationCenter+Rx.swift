import Foundation
import UserNotifications
import RxSwift

extension Reactive where Base: UNUserNotificationCenter {
    func requestAccess(options: UNAuthorizationOptions) -> Observable<Bool> {
        let center = base
        return Observable<Bool>.create { observable in
            center.requestAuthorization(options: options) { (authorized, error) in
                if let error = error {
                    observable.onError(error)
                } else {
                    observable.onNext(authorized)
                    observable.onCompleted()
                }
            }
            return Disposables.create()
        }
    }

    func add(request: UNNotificationRequest) -> Observable<Void> {
        let center = base
        return Observable<Void>.create { observable in
            center.add(request) { error in
                if let error = error {
                    observable.onError(error)
                } else {
                    observable.onNext()
                    observable.onCompleted()
                }
            }
            return Disposables.create()
        }
    }
}
