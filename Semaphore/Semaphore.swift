import Foundation



// Semaphore is used to control the shared asccess by the mupliple thread


class Counter {
    var count = 0
    let lock = NSLock()
    let semaphores = DispatchSemaphore(value: 1) // 1 represent that only one thread can access at one time
    
    func increment() {
        semaphores.wait() // value = 0
        count += 1
        semaphores.signal() // value = 1
    }
    
    func decrement() {
        semaphores.wait()
        count -= 1
        semaphores.signal()
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

