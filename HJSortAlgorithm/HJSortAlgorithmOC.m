//
//  HJSortAlgorithmOC.m
//  HJSortAlgorithm
//
//  Created by HeJun on 03/08/2017.
//  Copyright © 2017 HeJun. All rights reserved.
//

#import "HJSortAlgorithmOC.h"

@implementation HJSortAlgorithmOC

/**
 * 冒泡排序
 */
+ (NSArray<NSNumber *> *)bubbleSortWithDataList:(NSArray<NSNumber *> *)dataList {
	
	NSMutableArray<NSNumber *> *results = [dataList mutableCopy];
	
	NSTimeInterval startTime = [NSProcessInfo processInfo].systemUptime;
	
	/** sort start */
	NSNumber *temp;
	for (NSInteger i = 0; i < results.count - 1; i++) {
		for (NSInteger j = 0; j < results.count - 1 - i; j++) {
			if (results[j] > results[j + 1]) {
				temp = results[j];
				results[j] = results[j + 1];
				results[j + 1] = temp;
			}
		}
	}
	/** sort end */
	
	NSTimeInterval endTime = [NSProcessInfo processInfo].systemUptime;
	NSTimeInterval costTime = endTime - startTime;
	
	NSLog(@"costTime : %f", costTime);
	
	return results;
}

/**
 * 选择排序
 */
+ (NSArray<NSNumber *> *)selectionSortWithDataList:(NSArray <NSNumber *> *)dataList {
	
	NSMutableArray<NSNumber *> *results = [dataList mutableCopy];
	
	NSTimeInterval startTime = [NSProcessInfo processInfo].systemUptime;
	
	/** sort start */
	//寻找最小值
	NSInteger minIndex;
	NSNumber *temp;
	for (NSInteger i = 0; i < results.count; i++) {
		minIndex = i;
		for (NSInteger j = i + 1; j < results.count; j++) {
			if (results[j] < results[minIndex]) {
				minIndex = j;
			}
		}
		//交换
		temp = results[i];
		results[i] = results[minIndex];
		results[minIndex] = temp;
	}
	/** sort end */
	
	NSTimeInterval endTime = [NSProcessInfo processInfo].systemUptime;
	NSTimeInterval costTime = endTime - startTime;
	
	NSLog(@"costTime : %f", costTime);
	
	return results;
}

/**
 * 插入排序
 */
+ (NSArray<NSNumber *> *)insertionSortWithDataList:(NSArray <NSNumber *> *)dataList {
	
	NSMutableArray<NSNumber *> *results = [dataList mutableCopy];
	
	NSTimeInterval startTime = [NSProcessInfo processInfo].systemUptime;
	
	/** sort start */
	NSInteger preIndex;
	NSNumber *currentValue;
	for (NSInteger i = 1; i < results.count; i++) {
		preIndex = i - 1;
		currentValue = results[i];
		NSInteger j = preIndex;
		for (; j >= 0; j--) {
			if (results[j] > currentValue) {
				results[j + 1] = results[j];
			} else {
				break;
			}
		}
		results[j + 1] = currentValue;
	}
	/** sort end */
	
	NSTimeInterval endTime = [NSProcessInfo processInfo].systemUptime;
	NSTimeInterval costTime = endTime - startTime;
	
	NSLog(@"costTime : %f", costTime);
	
	return results;
}

/**
 * 希尔排序
 */
+ (NSArray<NSNumber *> *)shellSortWithDataList:(NSArray <NSNumber *> *)dataList {
	
	NSMutableArray<NSNumber *> *results = [dataList mutableCopy];
	
	NSTimeInterval startTime = [NSProcessInfo processInfo].systemUptime;
	
	/** sort start */
	NSInteger gap = 1;
	NSNumber *temp;
	while (gap < results.count / 3) {
		gap = gap * 3 + 1;
	}
	for (; gap > 0; gap = gap / 3) {
		for (NSInteger i = gap; i < results.count; i++) {
			temp = results[i];
			NSInteger j = i - gap;
			for (; j >= 0 && results[j] > temp; j = j - gap) {
				results[j + gap] = results[j];
			}
			results[j + gap] = temp;
		}
		NSLog(@"gap : %ld", gap);
		
	}
	/** sort end */
	
	NSTimeInterval endTime = [NSProcessInfo processInfo].systemUptime;
	NSTimeInterval costTime = endTime - startTime;
	
	NSLog(@"costTime : %f", costTime);
//	NSLog(@"results : %@", results);//打印有限制，无法打印完全
	printf("%s", [results.description UTF8String]);
	
	return results;
}

/**
 * 归并排序
 */
+ (NSArray<NSNumber *> *)mergeSortWithDataList:(NSArray <NSNumber *> *)dataList {
	
	NSMutableArray<NSNumber *> *results = [dataList mutableCopy];
	
	NSTimeInterval startTime = [NSProcessInfo processInfo].systemUptime;
	
	/** sort start(迭代法) */
	NSMutableArray<NSNumber *> *resultNew = [NSMutableArray array];
	NSInteger block, start;
	
	for (block = 1; block < results.count * 2; block = block * 2) {
		for (start = 0; start < results.count; start = start + 2 * block) {
			NSInteger low = start;
			NSInteger mid = (start + block) < results.count ? (start + block) : results.count;
			NSInteger high = (start + 2 * block) < results.count ? (start + 2 * block) : results.count;
			//两个块的起始下标及结束下标
			NSInteger start1 = low, end1 = mid;
			NSInteger start2 = mid, end2 = high;
			//开始对两个 block 进行归并排序
			while (start1 < end1 && start2 < end2) {
				resultNew[low++] = results[start1] < results[start2] ? results[start1++] : results[start2++];
			}
			while (start1 < end1) {
				resultNew[low++] = results[start1++];
			}
			while (start2 < end2) {
				resultNew[low++] = results[start2++];
			}
		}
		NSMutableArray<NSNumber *> *temp = [results mutableCopy];
		results = [resultNew mutableCopy];
		resultNew = [temp mutableCopy];
	}
	resultNew = [results mutableCopy];
	/** sort end */
	
	NSTimeInterval endTime = [NSProcessInfo processInfo].systemUptime;
	NSTimeInterval costTime = endTime - startTime;
	
	NSLog(@"costTime : %f", costTime);
	printf("%s", results.description.UTF8String);
	
	return results;
}

/**
 * 快速排序
 */
+ (NSArray<NSNumber *> *)quickSortWithDataList:(NSArray<NSNumber *> *)dataList {
	
	NSMutableArray<NSNumber *> *results = [dataList mutableCopy];
	
	NSTimeInterval startTime = [NSProcessInfo processInfo].systemUptime;
	
	/** sort start */
	NSMutableArray *resultSort = [self quickSortRecursiveWithDataList:results start:0 end:results.count - 1];
	/** sort end */
	
	NSTimeInterval endTime = [NSProcessInfo processInfo].systemUptime;
	NSTimeInterval costTime = endTime - startTime;
	
	NSLog(@"costTime : %f", costTime);
	printf("%s", resultSort.description.UTF8String);
	
	return resultSort;
}
+ (NSMutableArray<NSNumber *> *)quickSortRecursiveWithDataList:(NSMutableArray<NSNumber *> *)dataList
														 start:(NSInteger)start
														   end:(NSInteger)end{
	
	if (start >= end) {
		return dataList;
	}
	
	NSNumber *mid = dataList[end];
	NSInteger left = start, right = end - 1;
	NSNumber *temp;
	while (left < right) {
		while (dataList[left] <= mid && left < right) {
			left++;
		}
		while (dataList[right] >= mid && left < right) {
			right--;
		}
		//交换
		temp = dataList[left];
		dataList[left] = dataList[right];
		dataList[right] = temp;
	}
	if (dataList[left] >= dataList[end]) {
		temp = dataList[left];
		dataList[left] = dataList[end];
		dataList[end] = temp;
	} else {
		left++;
	}
	
	dataList = [self quickSortRecursiveWithDataList:dataList start:start end:left - 1];
	dataList = [self quickSortRecursiveWithDataList:dataList start:left end:end];
	
	return dataList;
}

/**
 * 堆排序
 */
+ (NSArray<NSNumber *> *)heapSortWithDataList:(NSArray <NSNumber *> *)dataList {
	
	NSMutableArray<NSNumber *> *results = [dataList mutableCopy];
	
	NSTimeInterval startTime = [NSProcessInfo processInfo].systemUptime;
	
	/** sort start */
	/** sort end */
	
	NSTimeInterval endTime = [NSProcessInfo processInfo].systemUptime;
	NSTimeInterval costTime = endTime - startTime;
	
	NSLog(@"costTime : %f", costTime);
	NSLog(@"results : %@", results);
	
	return results;
}

/**
 * 计数排序
 */
+ (NSArray<NSNumber *> *)countingSortWithDataList:(NSArray <NSNumber *> *)dataList {
	
	NSMutableArray<NSNumber *> *results = [dataList mutableCopy];
	
	NSTimeInterval startTime = [NSProcessInfo processInfo].systemUptime;
	
	/** sort start */
	/** sort end */
	
	NSTimeInterval endTime = [NSProcessInfo processInfo].systemUptime;
	NSTimeInterval costTime = endTime - startTime;
	
	NSLog(@"costTime : %f", costTime);
	NSLog(@"results : %@", results);
	
	return results;
}

/**
 * 桶排序
 */
+ (NSArray<NSNumber *> *)bucketSortWithDataList:(NSArray <NSNumber *> *)dataList {
	
	NSMutableArray<NSNumber *> *results = [dataList mutableCopy];
	
	NSTimeInterval startTime = [NSProcessInfo processInfo].systemUptime;
	
	/** sort start */
	/** sort end */
	
	NSTimeInterval endTime = [NSProcessInfo processInfo].systemUptime;
	NSTimeInterval costTime = endTime - startTime;
	
	NSLog(@"costTime : %f", costTime);
	NSLog(@"results : %@", results);
	
	return results;
}

/**
 * 基数排序
 */
+ (NSArray<NSNumber *> *)radixSortWithDataList:(NSArray <NSNumber *> *)dataList {
	
	NSMutableArray<NSNumber *> *results = [dataList mutableCopy];
	
	NSTimeInterval startTime = [NSProcessInfo processInfo].systemUptime;
	
	/** sort start */
	/** sort end */
	
	NSTimeInterval endTime = [NSProcessInfo processInfo].systemUptime;
	NSTimeInterval costTime = endTime - startTime;
	
	NSLog(@"costTime : %f", costTime);
	NSLog(@"results : %@", results);
	
	return results;
}

@end
