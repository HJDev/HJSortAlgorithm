//
//  HJSortAlgorithmOC.h
//  HJSortAlgorithm
//
//  Created by HeJun on 03/08/2017.
//  Copyright © 2017 HeJun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HJSortAlgorithmOC : NSObject

/**
 * 冒泡排序
 */
+ (NSArray<NSNumber *> *)bubbleSortWithDataList:(NSArray <NSNumber *> *)dataList;

/**
 * 选择排序
 */
+ (NSArray<NSNumber *> *)selectionSortWithDataList:(NSArray <NSNumber *> *)dataList;

/**
 * 插入排序
 */
+ (NSArray<NSNumber *> *)insertionSortWithDataList:(NSArray <NSNumber *> *)dataList;

/**
 * 希尔排序
 */
+ (NSArray<NSNumber *> *)shellSortWithDataList:(NSArray <NSNumber *> *)dataList;

/**
 * 归并排序
 */
+ (NSArray<NSNumber *> *)mergeSortWithDataList:(NSArray <NSNumber *> *)dataList;

/**
 * 快速排序
 */
+ (NSArray<NSNumber *> *)quickSortWithDataList:(NSArray <NSNumber *> *)dataList;

/**
 * 堆排序
 */
+ (NSArray<NSNumber *> *)heapSortWithDataList:(NSArray <NSNumber *> *)dataList;

/**
 * 计数排序
 */
+ (NSArray<NSNumber *> *)countingSortWithDataList:(NSArray <NSNumber *> *)dataList;

/**
 * 桶排序
 */
+ (NSArray<NSNumber *> *)bucketSortWithDataList:(NSArray <NSNumber *> *)dataList;

/**
 * 基数排序
 */
+ (NSArray<NSNumber *> *)radixSortWithDataList:(NSArray <NSNumber *> *)dataList;

@end
