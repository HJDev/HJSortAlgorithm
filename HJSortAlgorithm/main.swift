//
//  main.swift
//  HJSortAlgorithm
//
//  Created by HeJun on 03/08/2017.
//  Copyright © 2017 HeJun. All rights reserved.
//

import Foundation

// MARK: - START
var sortList: NSMutableArray = NSMutableArray.init()

for _ in 0..<100000 {
	let sortItem = arc4random()
	
	sortList.add(NSNumber.init(value: sortItem))
}
//let defaults = UserDefaults.standard
//defaults.set(sortList, forKey: "sortItem")
//defaults.synchronize()

//let defaults = UserDefaults.standard
//sortList = defaults.value(forKey: "sortItem") as! NSMutableArray



/** 冒泡排序 */
//let sortedList = HJSortAlgorithmOC.bubbleSort(withDataList: sortList as! [NSNumber])

/** 选择排序 */
//let sortedList = HJSortAlgorithmOC.selectionSort(withDataList: sortList as! [NSNumber])

/** 插入排序 */
//let sortedList = HJSortAlgorithmOC.insertionSort(withDataList: sortList as! [NSNumber])

/** 希尔排序 */
//let sortedList = HJSortAlgorithmOC.shellSort(withDataList: sortList as! [NSNumber])

/** 归并排序 */
let sortedList = HJSortAlgorithmOC.mergeSort(withDataList: sortList as! [NSNumber])

/** 快速排序 */
//sortList = sortList.subarray(with: NSRange.init(location: 10000, length: 100)) as! NSMutableArray
//let sortedList = HJSortAlgorithmOC.quickSort(withDataList: sortList as! [NSNumber])

//print(sortedList ?? sortList)

//sortList = HJSortAlgorithm.bubbleSort(sortList)
//
//print(sortedList ?? sortList)

