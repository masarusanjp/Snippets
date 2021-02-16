final class Throttle {
    typealias Handler = () -> Void
    typealias DateFactory = () -> Date
    private let throttleSeconds: TimeInterval
    private var lastSentTime: Date?
    private var lastUncalledHandler: Handler?
    private let now: DateFactory
    init(throttleSeconds: Double, dateFactory: @escaping DateFactory = { Date() }) {
        self.throttleSeconds = throttleSeconds
        self.now = dateFactory
    }

    func executeLatest(handler: @escaping Handler) {
        let nextInterval: TimeInterval
        if let lastSentTime = lastSentTime {
            let interval = lastSentTime.timeIntervalSince(now())
            nextInterval = max(0, throttleSeconds - interval)
        } else {
            nextInterval = 0
        }
        if nextInterval <= 0 {
            executeNow(handler)
            return
        }
        let hasLatestHandler = lastUncalledHandler != nil
        lastUncalledHandler = handler
        if hasLatestHandler {
            return
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + nextInterval) { [weak self] in
            if let handler = self?.lastUncalledHandler {
                self?.executeNow(handler)
            }
        }
    }
    private func executeNow(_ handler: Handler) {
        handler()
        lastUncalledHandler = nil
        lastSentTime = now()
    }
}
