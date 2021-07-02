//
//  PracticeTest.swift
//  RoughBook
//
//  Created by Vishal  John on 2/15/21.
//  Copyright © 2021 Vishal  John. All rights reserved.
//

import UIKit

public class PracticeTest: NSObject {
    
    static var fff: Int = 2
    
    func executeMethods() {
        self.findContinuousSubArray()
        self.findPeakElement()
        self.greatestThreeNos()
        self.reArrangeAllIndex()
        self.moveAllNegativeToEnd()
        self.arrangeGivenNumbers()
        self.MaxMin()
        self.rearrangeArray2()
        self.reorderArray()
        self.doubleArray()
        self.rotate(element: 3)
        self.rearrangeArray()
        self.findRepeatingElements()
    }
    
    func findRepeatingElements() {

        let inputArr = [4, 2, 4, 5, 2, 3, 1]
        
        var resultArr = [Int]()
        for (index, item) in inputArr.enumerated() {
            
            for i in index + 1..<inputArr.count{
                if item == inputArr[i]{
                    resultArr.append(item)
                }
            }
        }
        
        print(resultArr)
    }
    
    //    Given an array of integers. Find a peak element in it. An array element is a peak if it is NOT smaller than its neighbours. For corner elements, we need to consider only one neighbour.
        func findPeakElement() {
    //        let inputArr = [5, 10, 20, 15]
            let inputArr = [10, 20, 15, 2, 23, 90, 67]
            var output = 0
            
            for (index, item) in inputArr.enumerated() {
                if index == 0{
                    if item > inputArr[index + 1]{
                        output = item
                        break
                    }
                }else if index == inputArr.count - 1{
                    if item > inputArr[index]{
                        output = item
                        break
                    }
                }else{
                    if item > inputArr[index - 1] && item > inputArr[index + 1]{
                        output = item
                        break
                    }
                }
            }
            
            print(output)
        }
    
    //    [2, 5, 3, 1, 4, 7, 9, 3, 6]
    func addTwoSum(arr: [Int], target: Int) {
        var dict: [Int: Int] = [:]
        
        for (index, element) in arr.enumerated() {
            let diff = target - element
            if let savedVal = dict[diff]{
                print(index, savedVal)
                break
            }
            
            dict[element] = index
        }
    }
    
    func addThreeSum(arr: [Int], target: Int) {
        var diff = 0
        var lowIndex = 0
        var highIndex = arr.count - 1
        
        for (index, element) in arr.enumerated() {
            lowIndex += 1
            diff = target - element
            while lowIndex < highIndex {
                if arr[lowIndex] + arr[highIndex] > diff{
                    highIndex -= 1
                }else if arr[lowIndex] + arr[highIndex] < diff{
                    lowIndex += 1
                }else{
                    print(element, arr[lowIndex], arr[highIndex])
                    return
                }
            }
            
            lowIndex = 0
            highIndex = arr.count - 1
        }
        
        
    }
    
    //    Given two integer arrays of same size, “arr[]” and “index[]”, reorder elements in “arr[]” according to given index array. It is not allowed to given array arr’s length.
    
    func reorderArray() {
        let arr = [50, 40, 70, 60, 90]
        var index = [3,  0,  4,  1,  2]
        
        var resultArr = [Int]()
        for i in 0..<arr.count{
            resultArr.append(0)
        }
        
        for (index, item) in index.enumerated() {
            resultArr[item] = arr[index]
            
        }
        
        print(resultArr, index.sorted())
    }
    
    //    Find the largest three distinct elements in an array
    //Given an array with all distinct elements, find the largest three elements. Expected time complexity is O(n) and extra space is O(1).
    func greatestThreeNos() {
        var inputArr = [10, 4, 3, 50, 23, 90]
        var first = 0
        var second = 0
        var third = 0
        for i in 0..<inputArr.count {
            if inputArr[i] > first {
                third = second
                second = first
                first = inputArr[i]
            }else if(inputArr[i] > second){
                third = second
                second = inputArr[i]
            }else if(inputArr[i] > third){
                third = inputArr[i]
            }
        }
        
        print(first, second, third)
    }
    
    
    /*    Rearrange array such that even index elements are smaller and odd index elements are greater
     Input  : arr[] = {2, 3, 4, 5}
     Output : arr[] = {2, 4, 3, 5}
     Explanation : Elements at even indexes are
     smaller and elements at odd indexes are greater
     than their next elements
     
     Note : Another valid answer
     is arr[] = {3, 4, 2, 5}
     
     Input  :arr[] = {6, 4, 2, 1, 8, 3}
     Output :arr[] = {4, 6, 1, 8, 2, 3}
     */
    func reArrangeAllIndex() {
        var inputArr = [2, 3, 4, 5]
        for i in 0..<inputArr.count{
            for j in i + 1..<inputArr.count{
                print("Val--> \(inputArr[i])--\(inputArr[j])")
                
                if (inputArr[i] % 2 == 0) {
                    if inputArr[i] > inputArr[j]{
                        inputArr.swapAt(i, j)
                    }
                }else{
                    if inputArr[j] % 2 == 0 && inputArr[i] < inputArr[j]{
                        inputArr.swapAt(i, j)
                    }
                }
                break
            }
        }
        
        print(inputArr)
    }
    
    
    func moveAllNegativeToEnd() {
        let inputArr = [-5, 7, -3, -4, 9, 10, -1, 11]
        var positiveArr = [Int]()
        var negativeArr = [Int]()
        
        for(_, Item) in inputArr.enumerated(){
            if(Item < 0){
                negativeArr.append(Item)
            }else{
                positiveArr.append(Item)
            }
        }
        
        print(positiveArr + negativeArr)
    }
    
    
    //    Given an array of numbers, arrange them in a way that yields the largest value. For example, if the given numbers are
    //    {54, 546, 548, 60}, the arrangement 6054854654 gives the largest value. And if the given numbers are {1, 34, 3, 98, 9, 76, 45, 4}, then the arrangement 998764543431 gives the largest value.
    
    func arrangeGivenNumbers() {
        let inputArr = [54, 546, 548, 60]
        
        var resultArr = [Int]()
        
        for i in 0..<inputArr.count {
            
            var highVal = 0
            var isExists = false
            for j in i + 1..<inputArr.count{
                isExists = resultArr.filter { $0 == inputArr[j] }.count > 0
                if(!isExists){
                    let left = Int(String(inputArr[i]) + String(inputArr[j]))
                    let right = Int(String(inputArr[j]) + String(inputArr[i]))
                    if left! > right! {
                        highVal = inputArr[i]
                    }else{
                        highVal = inputArr[j]
                    }
                }else{
                    break
                }
                
            }
            
            if(highVal > 0){
                resultArr.append(highVal)
            }
            
        }
        
        print(resultArr)
    }
    
    //    Given a sorted array of positive integers, rearrange the array alternately i.e first element should be maximum value, second minimum value, third second max, fourth second min and so on.
    //    Input: arr[] = {1, 2, 3, 4, 5, 6, 7}
    //    Output: arr[] = {7, 1, 6, 2, 5, 3, 4}
    func MaxMin() {
        let arr = [1, 2, 3, 4, 5, 6, 7]
        var resultArr = [Int]()
        
        var isEven = false
        if arr.count % 2 == 0{
            isEven = true
        }
        
        for (Index, Item) in arr.enumerated() {
            
            if isEven == true && (arr.count / 2) == Index + 1 {
                break
            }else{
                let middleVal = arr[(arr.count - 1)/2]
                if Item == middleVal{
                    resultArr.append(Item)
                    break
                }
            }
            
            for (_, Item2) in arr.enumerated() {
                let indx = arr.count - 1 - Index
                if Index == indx { break }
                if Item > arr[indx] {
                    resultArr.append(Item)
                    resultArr.append(arr[indx])
                }else{
                    resultArr.append(arr[indx])
                    resultArr.append(Item)
                }
                
                break
            }
            
        }
        print(resultArr)
    }
    
    //    Given an array of size n where all elements are distinct and in range from 0 to n-1, change contents of arr[] so that arr[i] = j is changed to arr[j] = i.
    //    Input: arr[]  = {1, 3, 0, 2};
    //    Output: arr[] = {2, 0, 3, 1};
    
    func rearrangeArray2() {
        var arr = [2, 0, 1, 4, 5, 3]
        
        var tempArr = arr as [Int]
        
        for (index, item) in arr.enumerated() {
            tempArr[item] = index
        }
        
        print(tempArr)
    }
    
    //    Double the first element and move zero to end.--> For a given array of n integers and assume that ‘0’ as an invalid number and all other as a valid number. Convert the array in such a way that if both current and next element is valid then double current value and replace the next number with 0. After the modification, rearrange the array such that all 0’s shifted to the end.
    func doubleArray() {
        var arr = [0, 2, 2, 2, 0, 6, 6, 0, 0, 8]
        var resArr = arr
        var tempArray = [Int]()
        var zeroCount = 0
        for k in 0..<arr.count {
            if arr[k] == 0{
                tempArray.append(0)
            }else{
                if arr.count > k + 1 && arr[k + 1] > 0{
                    tempArray.append(arr[k] * 2)
                    arr[k + 1] = 0
                }else{
                    tempArray.append(arr[k])
                }
            }
        }
        
        var finalArr = [Int]()
        
        for i in 0..<tempArray.count {
            if tempArray[i] == 0 {
                zeroCount += 1
            }else{
                finalArr.append(tempArray[i])
            }
        }
        
        for j in 0..<zeroCount {
            finalArr.append(0)
        }
        
    }
    
    //    Rearrange an array in order – smallest, largest, 2nd smallest, 2nd largest, ..
    func rearrangeArray() {
        let arr = [5, 8, 1, 4, 2, 9, 3, 7, 6]
        let sortedArr = arr.sorted()
        
        var tempArr = [Int]()
        for (index, item) in sortedArr.enumerated() {
            if tempArr.count == sortedArr.count{
                break
            }
            tempArr.append(item)
            
            for (_, _) in sortedArr.enumerated() {
                let indx = sortedArr.count - 1 - index
                if index == indx { break }
                tempArr.append(sortedArr[indx])
                
                break
            }
        }
    }
    
    func rotate(element: Int) {
        let arr = [1, 2, 3, 4, 5, 6, 7]
        let range: ClosedRange = 0...3
        
        print(range.first!)
        print(range.last!)
        //        print(range.highIndex)
        let isExists = arr.filter { $0 == element }.count > 0
        if isExists{
            var tempArray = [Int]()
            var updatedArr = [Int]()
            
            var isValFound = false
            for (index, item) in arr.enumerated() {
                if !isValFound{
                    tempArray.append(item)
                }else{
                    updatedArr.append(item)
                }
                
                if index == element - 1{
                    isValFound = true
                }
            }
            
            let resultArr = updatedArr + tempArray
            print(resultArr)
        }
        
    }
    
    
      func findContinuousSubArray() {
          let inputArr = [1, 4, 0, 0, 3, 10, 5]
          var target = 7
          
          var tempArr = [Int]()
          var resultArr = [Int]()
          var isCompleted = false
          
          for (Index, Item) in inputArr.enumerated() {
              
              for i in Index + 1..<inputArr.count{
                  let totalVal = tempArr.reduce(0, +)
                  if Item + totalVal + inputArr[i] > target{
                      tempArr.removeAll()
                      break
                  }else if Item + totalVal + inputArr[i] == target{
                      resultArr.append(Item)
                      resultArr += tempArr
                      resultArr.append(inputArr[i])
                      isCompleted = true
                      break
                  }else{
                      tempArr.append(inputArr[i])
                  }
              }
              
              if isCompleted {
                  break
              }
          }
          
          print(resultArr)
      }
}
