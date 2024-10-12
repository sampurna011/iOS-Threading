import Foundation


// NSLock is used to lock the code to acieve thread safe code


class Counter {
    var count = 0
    let lock = NSLock()
    
    func increment() {
        lock.lock()
        count += 1
        lock.unlock()
    }
    
    func decrement() {
        lock.lock()
        count -= 1
        lock.unlock()
    }
}

let counter = Counter()
DispatchQueue.concurrentPerform(iterations: 10) { _ in
    counter.increment()
}

DispatchQueue.concurrentPerform(iterations: 5) { _ in
    counter.decrement()
}

print(counter.count)
