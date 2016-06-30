//: Playground - noun: a place where people can play

import UIKit

typealias SortMethod = ([Int]) -> [Int]

public class SortTestCase : XCTestCase {
    
    var sortMethod: SortMethod!
    
    init(method: SortMethod) {
        self.sortMethod = method
        super.init()
    }
    
    func testEmptyArray() {
        let list: [Int] = []
        XCTAssertEqual(sortMethod(list), [])
    }
    
    func testOneElementArray() {
        let list = [1]
        XCTAssertEqual(sortMethod(list), [1])
    }
    
    func testSortedList() {
        let list = [1,2,3]
        XCTAssertEqual(sortMethod(list), [1,2,3])
    }
    
    func testUnsortedList() {
        let list = [3, 2, 1]
        XCTAssertEqual(sortMethod(list), [1, 2, 3])
    }
    
    func testListWithDuplicate() {
        let list = [1, 2, 1]
        XCTAssertEqual(sortMethod(list), [1, 1, 2])
    }
    
    func testMergeSortOutPerformQuickSort() {
        let list = [10, 9, 8, 7, 6, 5, 4, 3, 2, 1]
        XCTAssertEqual(sortMethod(list), [1, 2, 3, 4, 5, 6, 7, 8, 9, 10])
    }
    
    func testQuickSortOutPerformMergeSort() {
//        let list = [10, 9, 8, 7, 6, 5, 4, 3, 2, 1]
//        XCTAssertEqual(sortMethod(list), [1, 2, 3, 4, 5, 6, 7, 8, 9, 10])
    }
}

func selectSort(list: [Int]) -> [Int] {
    print ("Start SelectSort")
    if list.count < 2 {
        return list
    }
    
    var newList = list
    
    for i in 0..<(newList.count-1) {
        var k = i
        
        for j in (i+1)..<newList.count {
            if newList[k] > newList[j] {
                k = j
            }
        }
        
        if k != i {
            let t = newList[i]
            newList[i] = newList[k]
            newList[k] = t
        }
    }
    
    return newList
}

func quickSortNew(list: [Int]) -> [Int] {
    if list.count < 2 {
        return list
    }
    
    return quickSortOperate(list, start: 0, end: (list.count - 1))
}

func quickSortOperate(list: [Int], start: Int, end: Int) -> [Int] {
    if start >= end {
        return list
    }
    
    var newList = list
    let pivotValue = newList[start]
    var left = start - 1
    var right = end + 1
    
    while (left < right) {
        repeat {
            left += 1
        } while newList[left] < pivotValue
        
        repeat {
            right -= 1
        } while pivotValue < newList[right]
        
        if left >= right {
            break
        }
        
        let t = newList[left]
        newList[left] = newList[right]
        newList[right] = t
    }
    
    newList = quickSortOperate(newList, start: start, end: right)
    newList = quickSortOperate(newList, start: right+1 , end: end)
    
    return newList
}

func mergeSort(list: [Int]) -> [Int] {
    let count = list.count
    
    if count < 2 {
        return list
    } else {
        let midPoint = count / 2
        
        
        var firstHalf = mergeSort(Array(list[0...(midPoint-1)]))
        var secondHalf = mergeSort(Array(list[midPoint...(count-1)]))
        
        var newList = [Int]()
        
        var i = 0
        var j = 0
        while (true) {
            
            if (i >= firstHalf.count) {
                for k in j..<(secondHalf.count) {
                    newList.append(secondHalf[k])
                }
                break;
            }
            
            if (j >= secondHalf.count) {
                for k in i..<(firstHalf.count) {
                    newList.append(firstHalf[k])
                }
                break;
            }
            
            if firstHalf[i] < secondHalf[j] {
                newList.append(firstHalf[i])
                i += 1
                continue
            }
            
            if firstHalf[i] >= secondHalf[j] {
                newList.append(secondHalf[j])
                j += 1
                continue
            }
        }
        
        return newList
    }
}


//SortTestCase(method: bogoSort)
//SortTestCase(method: selectSort)
//SortTestCase(method: quickSortNew)
//SortTestCase(method: mergeSort)
