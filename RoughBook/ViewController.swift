//
//  ViewController.swift
//  RoughBook
//
//  Created by Vishal  John on 1/18/21.
//  Copyright © 2021 Vishal  John. All rights reserved.
//

import UIKit

enum ImageFetchingError: Error {
    case timeout
    case unknown
}

enum carError: Error{
    case LowFuel
    case BreakDown
}

enum ssss: Error {
    case test
    case test2
}

final class ViewController: UIViewController {
    
    static var ddssd = 3
    @IBOutlet weak var imageCollectionView: UICollectionView!
    let result = { (success: Int) -> Int in
        return 10 * success
    }
    
    
    let king = { (val: Int) -> Bool in
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let ffff = Calendar.current.date(byAdding: .quarter, value: 1, to: Date())
        print(ffff)

        
        let item = ["A", "B", "E", "F"]
        let indexes = item.enumerated().filter{$0.element == "B"}.map{$0.offset}.first
        print(indexes)
        
        

        do {
            try self.getErrorData()
        } catch ssss.test {
            print("csdc")
        } catch ssss.test2{
            print("casc")
        } catch{
            print("csac")
        }
        
        print(self.addTwoVal(val: "dcs"))
        self.addTwoVals(inputVal: [2, 5, 3, 1, 4, 7, 9, 3, 6], target: 9)
        self.getFibonacci()
        self.multipleRotation(inputVal: [1, 3, 5, 7, 9])
        self.replaceEveryElement()
        self.reorderArr()
        self.rearrangeSmallLarge()
        self.reArrangeevenGreaterOdd()
        self.reArrangePosNeg()
        self.rearrangeAnArray()
        self.reverseAnArray()
        self.rearrangeArray()
        self.searchAnElement()
        let keyArr = ["AP", "BP", "CP"]
        let valArr = [1, 2, 3]
        let pairs = zip(keyArr, valArr)
        let dict = Dictionary(uniqueKeysWithValues: pairs)
        print(dict["BP"])
        
        self.onEdit(val: 1, onSuccess: { (result) in
            print(result)
        }) { (err) in
            print(err)
        }
        
        do{
            try self.validateCarProblem()
        }catch(carError.BreakDown){
            print("BreakDown")
        }catch(carError.LowFuel){
            print("LowFuel")
        }catch{
            print("Nothing")
        }
        
    }
    
    func addTwoVals(inputVal: [Int], target: Int) {
        var dict: [Int: Int] = [:]
        
        for (_, element) in inputVal.enumerated() {
            let diff = target - element
            
            if let rr = dict[diff]{
                print(element, rr)
                break
            }
            
            dict[diff] = diff
        }
    }
    
    func getErrorData() throws -> Error {
        let i = 4
        if i == 4{
            throw ssss.test
        }
    }
    
//    March 02 2021 (Revision)
    
    /*
     Given k sorted arrays of size n each, merge them and print the sorted output.
     arr[][] = { {1, 3, 5, 7},
     {2, 4, 6, 8},
     {0, 9, 10, 11}} ;
     Output: 0 1 2 3 4 5 6 7 8 9 10 11
     */
    
    func mergeKSortedArrays() {
        var itemArr = [[1, 3, 5, 7], [2, 4, 6, 8], [0, 9, 10, 11]]
        var tempArr: [Int] = []
        
        for (index, item) in itemArr.enumerated() {
            tempArr.append(contentsOf: item)
        }
        
        print(tempArr.sorted())
        
        
//        var itemArr = [[1, 3, 5, 7], [2, 4, 6, 8], [0, 9, 10, 11]]
//        var tempArr = itemArr.flatMap { $0 }
//        print(tempArr.sorted())
    }
    
    /*
     Input : arr = {-1, -1, 6, 1, 9, 3, 2, -1, 4, -1}
     Output : [-1, 1, 2, 3, 4, -1, 6, -1, -1, 9]
  
     */
    func rearrangeArray() {
        var itemArr = [19, 7, 0, 3, 18, 15, 12, 6, 1, 8,
        11, 10, 9, 5, 13, 16, 2, 14, 17, 4]
        
        
        for i in 0..<itemArr.count{
            
            if i != itemArr[i]{
                var isReplaced = false
                
                for j in i + 1..<itemArr.count{
                    if i == itemArr[j]{
                        itemArr.swapAt(i, j)
                        isReplaced = true
                        break
                    }
                }
                
                if !isReplaced{
                    if itemArr[i] >= 0 && itemArr[i] < itemArr.count{
                        itemArr[itemArr[i]] = itemArr[i]
                    }
                    itemArr[i] = -1
                }
            }
            
            
        }
        
        print(itemArr)
    }
    
    func searchAnElement() {
        let itemArr = [30, 40, 50, 10, 20]
        let k = 10
        for (index, item) in itemArr.enumerated(){
            if item == k{
                print("Output \(index)")
                break
            }
        }
    }
    
    func invokeService(val: Int, onSuccess: @escaping (_ success: Bool) -> Void, onFailure: @escaping (_ failure: Bool) -> Void) {
        onFailure(true)
    }
    
    
    func addTwoVal<T: Comparable>(val: T?) -> T {
        if let ggg = val as? Int{
            return (ggg + 10) as! T
        }else{
            return "casc" as! T
        }
    }
    
    func reverseAnArray() {
        let itemArr = [4, 5, 1, 2]
        
        var resultArr: [Int] = []
        for (Index2, Item2) in itemArr.enumerated() {
            let indx = itemArr.count - 1 - Index2
            resultArr.append(itemArr[indx])
        }
        
        print(resultArr)
    }
    
//    Input : arr[] = {1, 2, 3, 4, 5, 6, 7}
//    Output : 4 5 3 6 2 7 1

    func rearrangeAnArray() {
        var itemArr = [1, 2, 3, 4, 5, 6, 7]
        
        let midSize = itemArr.count/2
        print(midSize)
        let leftArr = itemArr[0...midSize]
        let rightArr = itemArr[midSize + 1..<itemArr.count]
        
        var resultArr: [Int] = []
        
        for i in 0...midSize{
            resultArr.append(leftArr[i])
            if midSize + 1 + i < itemArr.count{
                resultArr.append(rightArr[midSize + 1 + i])
            }
            
        }
        
        print(resultArr)
       
    }
    
    func reArrangePosNeg() {
        let itemArr = [-1, 2, -3, 4, 5, 6, -7, 8, 9]
        var posArr: [Int] = []
        var negArr: [Int] = []
        
        var resultArr: [Int] = []
        
        for (_, item) in itemArr.enumerated() {
            if item > 0{
                posArr.append(item)
            }else{
                negArr.append(item)
            }
        }
        
        if posArr.count > negArr.count{
            for (index, item) in posArr.enumerated() {
                resultArr.append(item)
                if index < negArr.count {
                    resultArr.append(negArr[index])
                }
            }
        }else{
            for (index, item) in negArr.enumerated() {
                resultArr.append(item)
                if index < posArr.count {
                    resultArr.append(posArr[index])
                }
            }
        }
        
        print(resultArr)
    }
   
    func reArrangeevenGreaterOdd()  {
        let itemArr = [1, 3, 2]
        let tempArr = itemArr.sorted()
        let leftArr = tempArr[0..<tempArr.count/2]
        let rightArr = tempArr[tempArr.count/2..<tempArr.count]
        var resultArr: [Int] = []
        for i in 0..<tempArr.count/2{
            resultArr.append(leftArr[i])
            resultArr.append(rightArr[i + 2])
        }
        
        print(resultArr)
    }
    
    func rearrangeSmallLarge() {
        var itemArr = [1, 2, 3, 4].sorted()
        
        var resultArr: [Int] = []
        
        let iseven = itemArr.count/2 % 2 == 0
        
        for (index, item) in itemArr.enumerated() {
            if iseven{
                if index < itemArr.count/2{
                    resultArr.append(item)
                    resultArr.append(itemArr[itemArr.count - index - 1])
                }else{
                    break
                }
            }else{
                if index <= itemArr.count/2{
                    resultArr.append(item)
                    resultArr.append(itemArr[itemArr.count - index - 1])
                }else{
                    break
                }
            }
            
            
        }
        
        print(resultArr)
    }
    
    func reorderArr() {
        var itemArr = [50, 40, 70, 60, 90]
        let index = [3,  0,  4,  1,  2]
        
        var resultArr = Array<Int>(repeating: 0, count: itemArr.count)
        
        for (index, item) in index.enumerated() {
            resultArr[item] = itemArr[index]
        }
        
        print(resultArr)
    }
    
    func replaceEveryElement() {
        var itemArr = [2, 3, 4, 5, 6]
        var resultArr: [Int] = []
        
        for(index, item) in itemArr.enumerated(){
            if index == 0{
                if index + 2 < itemArr.count{
                    resultArr.append(item * itemArr[index + 1])
                    resultArr.append(item * itemArr[index + 2])
                }
                
            }else if index + 1 == itemArr.count{
                resultArr.append(item * itemArr[index - 1])
            }
            else{
                if index + 2 < itemArr.count{
                    resultArr.append(item * itemArr[index + 2])
                }
            }
            
        }
        
        print(resultArr)
    }
    
    /*
     Input : arr[] = {1, 3, 5, 7, 9}
             k1 = 1
             k2 = 3
             k3 = 4
             k4 = 6
     Output : 3 5 7 9 1
              7 9 1 3 5
              9 1 3 5 7
              3 5 7 9 1
     */
    
    var k = 6
    func multipleRotation(inputVal: [Int]) {
        var inputArr = inputVal
        
        
        let kVal = inputVal[0]
        inputArr.remove(at: 0)
        inputArr.insert(kVal, at: inputArr.count)
        
        k -= 1
        if k > 0{
            self.multipleRotation(inputVal: inputArr)
        }else{
            print(inputArr)
        }
    }
    
    func validateCarProblem() throws -> carError {
        
        let a = 1
        if a == 1{
            throw carError.BreakDown
        }
        
        throw carError.LowFuel
    }
    
    /*
     1   2   7
     4   5   8
     7   8   9
     */
    func rotateMatrix() {
        var firstArr = [1, 4, 7]
        var secondArr = [2, 5, 8]
        var thirdArr = [3, 7, 9]
        
        var firstVal = 0
        var secondVal = 0
        var thirdVal = 0
        
        for i in 0..<firstArr.count{
            
            for j in 0..<secondArr.count{
                secondVal = secondArr[j]
                secondArr[j] = firstArr[i]
                break
            }
            
            for k in 0..<thirdArr.count{
                thirdArr[k] = secondVal
                
                break
            }
        }
        
    }
    
    var limit = 5
    func getFibonacci(n : Int = 0) {
        var itemArr = Array<Int>(repeating: 0, count: limit)
        
        var tempVal = 1
        var prevVal = 0
        for i in 0..<itemArr.count {
            tempVal = tempVal + prevVal
            prevVal = tempVal
            print(tempVal)
        }
    }
    
    
    func factorial(n: Int) -> Int {
        if n < 1{
            return 1
        }
        
        return n * factorial(n: n - 1)
    }
    
    func fibonacci(n: Int) -> Int {
        if n < 1{
            return 0
        }else if n == 1 || n == 2{
            return n - 1
        }else{
            return fibonacci(n: n-1) + fibonacci(n: n - 2)
        }
    }
    
    func permutations(_ n: Int, _ a: inout Array<Character>) {
        if n == 1 { print(a); return}
        for i in 0..<n-1 {
            permutations(n-1, &a)
            a.swapAt(n-1, (n % 2 != 1) ? 0 : i)
        }
        
        permutations(n-1, &a)
    }
    
    //    [2, 5, 3, 1, 4, 7, 9, 3, 6]
    //    [6, 3, 9, 7, 4, 1, 3, 5, 2]
    func addTwoSum() {
        //        let arr = [2, 5, 3, 1, 4, 7, 9, 3, 6]
        let arr = ["A", "N", "C"]
        for (Index, Item) in arr.enumerated() {
            
            let totalVal = arr.filter { $0 == Item }.count
            
            for i in Index + 1..<arr.count{
                print("Iteration \(Index)-->\(arr[i])")
            }
            
            
            for (Index2, Item2) in arr.enumerated() {
                let indx = arr.count - 1 - Index2
                if Index == indx { break }
                print("Second Logic Iteration \(Index2)--> \(arr[indx])")
            }
        }
    }
    
    func onEdit(val: Int, onSuccess: @escaping (_ success: Bool) -> Void, onFailure: @escaping (_ failure: Bool) -> Void) {
        onFailure(true)
    }
}

class Result: NSObject {
    var image: UIImage?
    var fetchErr: ImageFetchingError = .unknown
}

extension ViewController{
    func collectionMethods <T: Comparable>(val: [T?]) -> (Test: Int, Test2: Int) {
        let filteredVal = val.flatMap { return $0 }
        if let inputVal = filteredVal as? [Int]{
            let index = inputVal.firstIndex(of: 5)
            let filterVal = inputVal.filter { $0 == 5 }.count > 0
            print(index!)
            print(filterVal)
            print("TotalValue-->\(inputVal.reduce(100, +))")
        }else if let inputVal = filteredVal as? [String]{
            let ggg = inputVal.firstIndex(of: "A")
            print(ggg!)
            let filterVal = inputVal.filter { $0.contains("A") }.count > 0
            print(filterVal)
        }
        
        return (10, 20)
    }
    
    func addClosure(n: Int, Success: @escaping (_ success: Bool) -> Void, Failure: @escaping (_ failure: Bool) -> Void) {
        print(self.onDelete(val: 20, Success: { (result) in
            print(result)
        }, Failure: { (err) in
            print(err)
        }))
        
        
        Failure(true)
    }
    
    func onDelete(val: Int, Success: @escaping (_ success: Bool) -> Void, Failure: @escaping (_ failure: Bool) -> Void) {
        Failure(false)
    }
    
    
//    [2,4,3,5,4,3,5,4,2]
    func moveOddNosToRightAfterSwap(arr: [Int]) -> Int {
        var moveCount = 0
        var tempArr = arr
        for (index, item) in arr.enumerated(){
            
            if item % 2 != 0{
                for (Index2, Item2) in tempArr.enumerated() {
                    let indx = tempArr.count - 1 - Index2
                    if index == indx { break }
                    
                    if tempArr[indx] % 2 == 0{
                        tempArr.swapAt(index, indx)
                        moveCount += 1
                        break
                    }
                }
            }
            
        }
        
        
        return moveCount
    }
}

struct Employee {
    var names = "Test"
    static var name = "Test"
    static let dog = "German Shephered"
    
    init(sss: String) {
        self.names = sss
    }
    
    mutating func addFFF() {
        self.names = "vdsvsdv"
    }
}
