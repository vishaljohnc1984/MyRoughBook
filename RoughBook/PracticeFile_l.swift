//
//  PracticeFile_l.swift
//  RoughBook
//
//  Created by Vishal  John on 2/28/21.
//  Copyright © 2021 Vishal  John. All rights reserved.
//

import UIKit

class PracticeFile_l: PracticeTest {
    
    func callMethods() {
        logAdd(2, 4)
        var fff = logAdd(3, 5)
        print(fff)
        self.execute()
        self.mergeKSortedArrays()
        self.reArrangePosNegInArr()
        self.rotationOfArrayNTimes()
        self.findKSmallestValInArray()
        self.rearrangeArr()
        self.findRotationCount(itemArr: [7, 9, 11, 12, 15])
    }
    
    @discardableResult func logAdd(_ a: Int, _ b: Int) -> Int {
        let c = a + b
        print(c)
        return c
    }
    
    @inlinable func foo( bar: () -> Void ) {
        bar()
    }
    
    func execute() {
        foo {
            print("Executed")
        }
    }
    
    func mergeKSortedArrays() {
        let itemArrCount = 4
        let arrCount = 3
        let itemArr: [[Int]] = [[1, 5, 6, 8], [2, 4, 10, 12], [3, 7, 9, 11], [13, 14, 15, 16]]
        
        var outputArr: [Int] = []
        for i in 0..<itemArr.count {
            let splitArr = itemArr[i]
            outputArr.append(contentsOf: splitArr)
        }
        
        print(outputArr.sorted())
    }
    
    func findKSmallestValInArray() {
        let itemArr = [7, 10, 4, 3, 20, 15]
        let kVal = 4
        
        let sortedArr = itemArr.sorted()
        for i in 0..<sortedArr.count{
            if(i == kVal - 1){
                print(sortedArr[i])
                break
            }
        }
        
        let kLargestVal = 4
        for (Index2, Item2) in sortedArr.enumerated() {
            let indx = sortedArr.count - 1 - Index2
            if Index2 == kLargestVal - 1{
                print(sortedArr[indx])
                break
            }
        }
    }
    
    func reArrangePosNegInArr() {
        var itemArr = [-12, 11, 0, -5, 6, 0, -7, 5, -3, -6]
        var negativeArr: [Int] = []
        var positiveArr: [Int] = []
        
        for (index, item) in itemArr.enumerated(){
            if item == 0{
                positiveArr.insert(0, at: 0)
            }else{
                if item < 0{
                    negativeArr.append(item)
                }else{
                    positiveArr.append(item)
                }
            }
            
        }
        
        print(negativeArr + positiveArr)
    }
    
    func rotationOfArrayNTimes() {
        let itemArr = [1, 3, 5, 7, 9]
        let kNo = 4
        
        var tempArr = itemArr
        
        for (index, item) in itemArr.enumerated(){
            if index == kNo{ break }
            tempArr.append(item)
            tempArr.remove(at: 0)
        }
        
        print(tempArr)
    }
    
    //    Rearrange an array such that ‘arr[j]’ becomes ‘i’ if ‘arr[i]’ is ‘j’ | Set 1
    
    //    Given an array of size n where all elements are distinct and in range from 0 to n-1, change contents of arr[] so that arr[i] = j is changed to arr[j] = i.
    //    Input: arr[]  = {1, 3, 0, 2};
    //    Output: arr[] = {2, 0, 3, 1};
    func rearrangeArr() {
        let itemArr = [2, 0, 1, 4, 5, 3]
        var tempArr = itemArr
        
        for (index, item) in itemArr.enumerated(){
            tempArr[item] = index
        }
        
        print(tempArr)
        
    }
    
    //    Find the Rotation Count in Rotated Sorted array]
    //    Consider an array of distinct numbers sorted in increasing order. The array has been rotated (clockwise) k number of times. Given such an array, find the value of k.
    var cnt = 0
    func findRotationCount(itemArr: [Int]) {
        
        var isSorted = true
        
        for i in 0..<itemArr.count {
            if i + 1 < itemArr.count{
                if itemArr[i] > itemArr[i+1] {
                    isSorted = false
                    break
                }
            }
        }
        
        if !isSorted {
            cnt += 1
            var tempArr = itemArr
            let movableVal = tempArr[0]
            tempArr.append(movableVal)
            tempArr.remove(at: 0)
            self.findRotationCount(itemArr: tempArr)
        }else{
            print("Rotation Count--> \(cnt)")
        }
    }
    
    //    Maximum sum of i*arr[i] among all rotations of a given array
    //    Given an array arr[] of n integers, find the maximum that maximizes the sum of the value of i*arr[i] where i varies from 0 to n-1
    var maxVal = 0
    var iterationCount = 0
    func findMaxValFromAllRotation(itemArr: [Int]) {
        iterationCount += 1
        var output = 0
        for(index, item) in itemArr.enumerated(){
            output += index * item
        }
        
        if output > maxVal{
            maxVal = output
        }
        
        var tempArr = itemArr
        tempArr.insert(itemArr[itemArr.count - 1], at: 0)
        tempArr.remove(at: itemArr.count)
        
        
        if iterationCount == itemArr.count{
            print(maxVal)
            return
        }
        
        findMaxValFromAllRotation(itemArr: tempArr)
    }
    
    //    Find maximum value of Sum( i*arr[i]) with only rotations on given array allowed
    //    Given an array, only rotation operation is allowed on array. We can rotate the array as many times as we want. Return the maximum possible summation of i*arr[i].
    func findMaxValByRotatingArr(itemArr: [Int]) {
        
        let target = 330
        var outputArr = [Int]()
        var outputVal = 0
        for (Index, Item) in itemArr.enumerated() {
            outputVal += Index * Item
            outputArr.append(Item)
            if outputVal == target{
                print(outputArr)
                return
            }
        }
        
        var tempArr = itemArr
        tempArr.insert(itemArr[itemArr.count - 1], at: 0)
        tempArr.remove(at: tempArr.count - 1)
        findMaxValByRotatingArr(itemArr: tempArr)
    }
    
    func rotateArrByOne() {
        var c = 10
        var v = c
        c = 25
        print(v)
        var arr = [2, 4, 6, 5, 7, 8]
        let item = arr[arr.count - 1]
        var outputArr = arr
        
        outputArr.insert(item, at: 0)
        outputArr.remove(at: outputArr.count - 1)
        
        print(outputArr)
        
    }
    
    
    //    Split the array and add the first part to the end
    //    There is a given an array and split it from a specified position, and move the first part of array add to the end.
    func splitAndAddToEnd() {
        let arr = [10, 3, 5, 2, 6, 7, 8]
        let splitIndex = 3
        var leftArr: [Int] = []
        var rightArr: [Int] = []
        
        
        for i in 0..<arr.count {
            if i > splitIndex {
                leftArr.append(arr[i])
            }else{
                rightArr.append(arr[i])
            }
        }
        
        print(leftArr + rightArr)
    }
    
}
