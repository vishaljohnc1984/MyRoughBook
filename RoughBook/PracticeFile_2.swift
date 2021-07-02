//
//  PracticeFile_2.swift
//  RoughBook
//
//  Created by Vishal  John on 3/2/21.
//  Copyright © 2021 Vishal  John. All rights reserved.
//

import UIKit

class PracticeFile_2: NSObject {
    func executeAlgorithms() {
        self.sortedSubsequences(nnn: "dsc")
        self.sortedSubsequences()
        self.rearrangeArrayWithDefaultValue()
        self.reArrangeInPositiveNegativeOrder()
        self.MoveAllZerosToEnd()
        self.minSwapRequired()
        self.zigZag()
        self.replaceTwoConseqValues(inputArr: [5, 2, 1, 1, 2, 2])
        self.shuffleIntegers()
        self.distinctNeighbours()
    }
    
    func sortedSubsequences(nnn: String) {
        print("Overloading")
    }
    
    func sortedSubsequences() {
        var itemArr = [12, 11, 10, 5, 6, 2, 30]
        
        var resultArr = [Int]()
        for (index, item) in itemArr.enumerated() {
            if index + 1 >= itemArr.count{
                break
            }
            if item < itemArr[index + 1]{
                
                if (resultArr.count > 0 &&  item > resultArr.max()!){
                    resultArr.append(item)
                }
                
                resultArr.append(itemArr[index + 1])
            }else if resultArr.count > 0 &&  resultArr.max()! < itemArr[index + 1]{
                resultArr.append(itemArr[index + 1])
            }
        }
        
        print(resultArr)
    }
    
    /*
     Rearrange an array such that arr[i] = i
     Given an array of elements of length N, ranging from 0 to N – 1. All elements may not be present in the array. If the element is not present then there will be -1 present in the array. Rearrange the array such that A[i] = i and if i is not present, display -1 at that place.
     Input : arr = {-1, -1, 6, 1, 9, 3, 2, -1, 4, -1}
     Output : [-1, 1, 2, 3, 4, -1, 6, -1, -1, 9]
     */
    func rearrangeArrayWithDefaultValue() {
        var itemArr = [19, 7, 0, 3, 18, 15, 12, 6, 1, 8,
                       11, 10, 9, 5, 13, 16, 2, 14, 17, 4]
        
        var isSwapped = false
        for j in 0..<itemArr.count{
            if itemArr[j] != j{
                
                for i in j + 1..<itemArr.count{
                    if j == itemArr[i]{
                        itemArr.swapAt(j, i)
                        isSwapped = true
                        break
                    }
                }
                
                if !isSwapped{
                    itemArr[j] = -1
                }
            }
            
        }
        
        print(itemArr)
    }
    
    func reArrangeInPositiveNegativeOrder() {
        var inputArr = [-1, 2, -3, 4, 5, 6, -7, 8, 9]
        
        var negativeArr: [Int] = []
        var positiveArr: [Int] = []
        
        for(_, item) in inputArr.enumerated(){
            if item < 0{
                negativeArr.append(item)
            }else{
                positiveArr.append(item)
            }
        }
        
        let negativeArrCount = negativeArr.count
        let positiveArrCount = positiveArr.count
        
        var resultArr: [Int] = []
        if negativeArrCount > positiveArrCount{
            for (index, item) in negativeArr.enumerated() {
                resultArr.append(item)
                if index + 1 <=  positiveArrCount{
                    resultArr.append(positiveArr[index])
                }
                
            }
        }else{
            for (index, item) in positiveArr.enumerated() {
                resultArr.append(item)
                if index + 1 <=  negativeArrCount{
                    resultArr.append(negativeArr[index])
                }
                
            }
        }
        
        print(resultArr)
    }
    
    func MoveAllZerosToEnd() {
        var itemArr = [0, 1, 9, 8, 4, 0, 0, 2, 7, 0, 6, 0, 9]
        var resultArr: [Int] = []
        
        var cnt = 0
        for (index, item) in itemArr.enumerated() {
            if item == 0{
                cnt += 1
            }else{
                resultArr.append(item)
            }
        }
        
        for i in 0..<cnt{
            resultArr.append(0)
        }
        
        print(resultArr)
    }
    
    /* Minimum swaps required to bring all elements less than or equal to k together
     Given an array of n positive integers and a number k. Find the minimum number of swaps required to bring all the numbers less than or equal to k together.
     
     Input:  arr[] = {2, 1, 5, 6, 3}, k = 3
     Output: 1
     */
    
    func minSwapRequired() {
        var inputArr = [2, 7, 9, 5, 8, 7, 4]
        let k = 5
        var swapCount = 0
        
        var tempArr = [Int]()
        
        for i in 0..<inputArr.count{
            if inputArr[i] < k{
                continue
            }
            
            for j in i + 1..<inputArr.count{
                if inputArr[j] <= k{
                    inputArr.swapAt(i, j)
                    swapCount += 1
                    break
                }
            }
        }
        
        print(swapCount)
    }
    
    //    a<b>c
    func zigZag() {
        let itemArr = [4, 3, 7, 8, 6, 2, 1]
        let sortedArr = itemArr.sorted()
        
        let tempArr = sortedArr
        var newArr = tempArr[1..<tempArr.count]
        
        for i in 1..<newArr.count {
            if i == 1 || i%2 != 0{
                newArr.swapAt(i, i + 1)
            }
        }
        
        var resultArr: [Int] = []
        resultArr.append(tempArr[0])
        
        print(resultArr + newArr)
    }
    
    /*
     Form minimum number from given sequence
     
     Given a pattern containing only I’s and D’s. I for increasing and D for decreasing. Devise an algorithm to print the minimum number following that pattern. Digits from 1-9 and digits can’t repeat.
     
     Input: D        Output: 21
     Input: I        Output: 12
     Input: DD       Output: 321
     Input: II       Output: 123
     Input: DIDI     Output: 21435
     Input: IIDDD    Output: 126543
     Input: DDIDDIID Output: 321654798
     */
    func formMinNumber() {
        var inputStr = "DIDI"
        var inputArr = Array(inputStr)
        
        var outputArr: [Int] = []
        
        let maxVal = inputArr.count + 1
        
        for i in 0..<maxVal{
            if inputArr[i] == "D"{
                outputArr.append(maxVal - i)
            }else{//I
                outputArr.append(i + 1)
            }
        }
    }
    
    /* Replace two consecutive equal values with one greater
     You are given an array of size ‘n’. You have to replace every pair of consecutive values ‘x’ by a single value ‘x+1’ every time until there is no such repetition left and then print the new array.
     Input : 5, 2, 1, 1, 2, 2
     Output : 5 4
     */
    
    
    func replaceTwoConseqValues(inputArr: [Int]) {
        var itemArr = inputArr
        
        for i in 0..<itemArr.count{
            
            for j in i + 1..<itemArr.count{
                if itemArr[j] == itemArr[i]{
                    itemArr[i] = itemArr[i] + 1
                    itemArr.remove(at: j)
                    self.replaceTwoConseqValues(inputArr: itemArr)
                }
                break
            }
        }
        
        print(itemArr)
    }
    
    
    /*Given an array, find whether it is possible to obtain an array having distinct neighbouring elements by swapping two neighbouring array elements.
     Input : 1 1 2
     Output : YES
     swap 1 (second last element) and 2 (last element),
     to obtain 1 2 1, which has distinct neighbouring
     elements .
     */
    func distinctNeighbours() {
        var itemArr = [1, 1, 2, 3, 1]
        
        for k in 0..<itemArr.count {
            if k + 1 == itemArr.count{
                break
            }
            
            if itemArr[k + 1] != itemArr[k] {
                continue
            }
            
            if itemArr[k + 2] != itemArr[k + 1] {
                itemArr.swapAt(k + 1, k + 2)
            }
        }
        
        print(itemArr)
    }
    
    /*    Shuffle 2n integers as a1-b1-a2-b2-a3-b3-..bn without using extra space
     We have an array of the form {a0, a1, a2….., an, b0, b1, b2, …..bn} and our task is to rearrange the same in theform given below by using O(1) space-
     {a0, b0, a1, b1, a2, b2………..an, bn}
     Input : arr[] = {1, 3, 5, 7, 2, 4, 6, 8}
     Output : {1, 2, 3, 4, 5, 6, 7, 8}*/
    
    func shuffleIntegers() {
        var itemArr = [1, 3, 5, 7, 2, 4, 6, 8]
        
        let middleVal = itemArr.count/2
        let leftArr = itemArr[0..<middleVal]
        let rightArr = itemArr[middleVal..<itemArr.count]
        var outputArr = [Int]()
        
        for i in 0..<middleVal {
            outputArr.append(leftArr[i])
            outputArr.append(rightArr[middleVal + i])
        }
        
        print(outputArr)
    }
    
}
