import Foundation
import UIKit

//func additionOfTwoNumbers<T: Numeric>(num1: T, num2: T)
//{
//    var answers = num1 + num2
//    print("Addition of two numbers: \(num1 + num2)")
//
//}
//
//
//struct Addition<Element>{
//
//    var items = [Element]()
//
//    mutating func push(_ item: Element){
//        items.append(item)
//    }
//
//    mutating func pop() -> Element{
//        return items.removeLast()
//    }
//}
//
//
//func displayMessageForInteger() {
//    var add = Addition <Double>()
//    add.push(9)
//    add.push(10)
//    add.pop()
//    add.push(100)
//
//    print(add.items)
//}
//
//func displayMessageForCharacter() {
//    var str = Addition <String>()
//    str.push("Ahmed")
//    str.push("Saeed")
//    str.pop()
//    print(str.items)
//}
//
//additionOfTwoNumbers(num1: 10, num2: 10)
//displayMessageForInteger()
//displayMessageForCharacter()
//
//let driving = {
//    print("I am driving")
//}
//
//func travel(action: () -> Void){
//    print("I have reached")
//    action()
//    print("Hello")
//
//}
//
//travel(action: driving)





/*struct Employee {
    
    func EmployeeRecords(){
        debugPrint("Syncing Employee records...")
        Thread.sleep(forTimeInterval: 2)
        debugPrint("Syncing for employee is Completed!")
    }
}

struct Department {
    func DepartmentRecords(){
        debugPrint("Syncing Department records...")
        Thread.sleep(forTimeInterval: 3)
        debugPrint("Syncing for Department is completed!")
    }
}

struct SyncManager {
    
    func SyncOperations(){
        
        let serialQueue = DispatchQueue.init(label: "Ahmed")
        
        serialQueue.async {
            let employee = Employee()
            employee.EmployeeRecords()
        }
        
        serialQueue.async {
            let department = Department()
            department.DepartmentRecords()
        }
        
        serialQueue.async {
            debugPrint("Syncing Project completed!")
        }
        
        let EmployeeOpeartion = BlockOperation()
        EmployeeOpeartion.addExecutionBlock {
            let employee = Employee()
            employee.EmployeeRecords()
        }

        let DepartmentOperation = BlockOperation()
        DepartmentOperation.addExecutionBlock {
            let department = Department()
            department.DepartmentRecords()
        }

        EmployeeOpeartion.addDependency(DepartmentOperation)

        let operationQueue = OperationQueue()
        operationQueue.addOperation(EmployeeOpeartion)
        operationQueue.addOperation(DepartmentOperation)
        
    }
}

let object = SyncManager()
object.SyncOperations() */

//
//struct Bank {
//    var accountAmount: Double
//    {
//    didSet {
//        displayAmount()
//    }
//        willSet(accountAmount){
//        print("New account Balance is: \(accountAmount)")
//    }
//
//    }
//
//    mutating func addingAmountInAccount (amount: Double) {
//        accountAmount += amount
//    }
//
//    mutating func withDrawAmount (amount: Double) {
//        accountAmount -= amount
//    }
//
//    func displayAmount () {
//        print("balance is: \(accountAmount)")
//    }
//
//}
//
//var obj = Bank(accountAmount: 10000)
//obj.addingAmountInAccount(amount: 23232)




struct NewsFeed: Codable {
    
    var status: String = ""
    var totalResults: Int = 0
    var articles: [Articles]?
    
}

struct Articles: Codable {
    
    var author: String?
    var title: String?
    var description: String?
    var url: String?
    var urlToImage: String?
    var content: String?
    var publishedAt: String?
}


let urlString = "https://newsapi.org/v2/everything?q=tesla&from=2021-12-17&sortBy=publishedAt&apiKey=a2ed984d0d98462ea859ddcae2417ebb"

let url = URL(string: urlString)

let session = URLSession.shared

let dataTask = session.dataTask(with: url!) { (data, response, error) in
    
    if error == nil && data != nil {
        // Passing Jason
        let decorder = JSONDecoder()
        
        do {
            let newsFeed = try decorder.decode(NewsFeed.self, from: data!)
            print(newsFeed)
        }
        catch {
            print("Error in JSON Passing")
        }
        
    }
        
}

dataTask.resume() // Makes the APi call

