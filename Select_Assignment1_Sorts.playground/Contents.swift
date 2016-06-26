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

//SortTestCase(method: bogoSort)
//SortTestCase(method: selectSort)
//SortTestCase(method: quickSortNew)
//SortTestCase(method: mergeSort)
