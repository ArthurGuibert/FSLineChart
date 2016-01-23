//
//  FSLineChartTests.m
//  FSLineChartTests
//
//  Created by Arthur GUIBERT on 30/09/2014.
//  Copyright (c) 2014 Arthur GUIBERT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "FSLineChart.h"

@interface FSLineChartTests : XCTestCase

@end

@implementation FSLineChartTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testInitialisation {
    FSLineChart* chart = [[FSLineChart alloc] init];
    XCTAssertNotNil(chart);
}

- (void)testBoundsNilChart {
    FSLineChart* chart = [[FSLineChart alloc] init];
    [chart setChartData:nil];
    
    XCTAssertEqual([chart minVerticalBound], 0);
    XCTAssertEqual([chart maxVerticalBound], 0);
}

- (void)testBoundsEmptyChart {
    FSLineChart* chart = [[FSLineChart alloc] init];
    [chart setChartData:@[]];
    
    XCTAssertEqual([chart minVerticalBound], 0);
    XCTAssertEqual([chart maxVerticalBound], 0);
}

- (void)testBoundsAllValuesToZero {
    FSLineChart* chart = [[FSLineChart alloc] init];
    [chart setChartData:@[@0,@0,@0]];
    
    XCTAssertEqual([chart minVerticalBound], 0);
    XCTAssertEqual([chart maxVerticalBound], 0);
}

- (void)testBounds {
    FSLineChart* chart = [[FSLineChart alloc] init];
    [chart setChartData:@[@0, @1, @-1]];
    
    XCTAssertGreaterThan([chart maxVerticalBound], 1);
    XCTAssertLessThan([chart minVerticalBound], -1);
}

- (void)testPerformanceExample {
    FSLineChart* chart = [[FSLineChart alloc] init];
    NSMutableArray* array = [[NSMutableArray alloc] init];
    
    for(int i=0;i<1000;i++) {
        [array addObject:[NSNumber numberWithInt:rand()]];
    }
    
    // Testing whether a 1000 values are processed between two frames (1/60th of a second)
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
        [chart setChartData:array];
    }];
}

@end
