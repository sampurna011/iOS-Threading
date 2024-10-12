
import Foundation
import PlaygroundSupport



/* Sample to create custom thread using Thread class*/

class CustomThread {
    func creaThread()  {
        let thread: Thread = Thread(target: self, selector: #selector(threadSelector), object: nil)
        thread.start()
    }
    
    @objc func threadSelector() {
        print("Thread is started")
    }
}


let thread = CustomThread()
thread.creaThread()
