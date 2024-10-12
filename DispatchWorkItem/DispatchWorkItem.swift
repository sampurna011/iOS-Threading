import Foundation


let workItem = DispatchWorkItem {
    sleep(2)
    //print("hello work itme")
}

DispatchQueue.global().async(execute: workItem)   // This is encapsulation

//workItem.wait()

workItem.notify(queue: .main) {
    //print("Task completed")
}


//DispatchQueue.global().async {
//    sleep(1)
//    print("excuted")
//}


// Priority in Dispatch queue

let workItem1 = DispatchWorkItem(qos: .userInteractive) {
    sleep(3)
    //print("hello work itme 1")
}

let workItem2 = DispatchWorkItem(qos: .userInitiated) {
    sleep(1)
    //print("hello work itme 2")
}

let workItem3 = DispatchWorkItem(qos: .utility) {
    sleep(1)
   // print("hello work itme 3")
}

let workItem4 = DispatchWorkItem(qos: .background) {
    sleep(1)
    //print("hello work itme 4")
}


let queue = DispatchQueue(label: "qwertyu")
queue.async(execute: workItem1)
queue.async(execute: workItem2)
queue.async(execute: workItem3)
queue.async(execute: workItem4)


//
let cancelWorkItem = DispatchWorkItem {
    sleep(5)
    //print("hello work itme 4")
}


let cancelQueue = DispatchQueue(label: "qwertyu")
cancelQueue.async(execute: cancelWorkItem)

cancelWorkItem.cancel()

if cancelWorkItem.isCancelled {
    //print("Canceled")
}

//
var modifyWorkItem = DispatchWorkItem {
    sleep(5)
    print("modify work item completed")
}


DispatchQueue.global().async(execute: modifyWorkItem)
modifyWorkItem.cancel()

modifyWorkItem = DispatchWorkItem {
    sleep(2)
    print("modify work item modified")
}

DispatchQueue.global().async(execute: modifyWorkItem)




// DispatchWorkItemFlags
