//
//  ViewController.m
//  FSLineChart
//
//  Created by Arthur GUIBERT on 30/09/2014.
//  Copyright (c) 2014 Arthur GUIBERT. All rights reserved.
//

#import "ViewController.h"
#import "FSLineChart.h"
#import "UIColor+FSPalette.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //[self.view addSubview:[self chart1]];
    [self.view addSubview:[self chart3]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Creating the charts

-(FSLineChart*)chart1 {
    // Generating some dummy data
    NSMutableArray* chartData = [NSMutableArray arrayWithCapacity:10];
    srand(time(nil));
    for(int i=0;i<10;i++) {
        int r = (rand() + rand()) % 1000;
        chartData[i] = [NSNumber numberWithInt:r + 200];
    }
    // Creating the line chart
    FSLineChart* lineChart = [[FSLineChart alloc] initWithFrame:CGRectMake(20, 60, [UIScreen mainScreen].bounds.size.width - 40, 166)];
    lineChart.verticalGridStep = 5;
    lineChart.horizontalGridStep = 9;
    //lineChart.fillColor = nil;
    lineChart.labelForIndex = ^(NSUInteger item) {
        return [NSString stringWithFormat:@"%lu",(unsigned long)item];
    };
    lineChart.labelForValue = ^(CGFloat value) {
        return [NSString stringWithFormat:@"%.f", value];
    };
    [lineChart setChartData:chartData];
    return lineChart;
}
-(FSLineChart*)chart2 {
    // Generating some dummy data
    NSMutableArray* chartData = [NSMutableArray arrayWithCapacity:101];
    for(int i=0;i<101;i++) {
        chartData[i] = [NSNumber numberWithFloat:(float)i / 30.0f + (float)(rand() % 100) / 200.0f];
    }
    // Creating the line chart
    FSLineChart* lineChart = [[FSLineChart alloc] initWithFrame:CGRectMake(20, 260, [UIScreen mainScreen].bounds.size.width - 40, 166)];
    lineChart.verticalGridStep = 4;
    lineChart.horizontalGridStep = 2;
    lineChart.color = [UIColor fsOrange];
    lineChart.fillColor = nil;
    lineChart.labelForIndex = ^(NSUInteger item) {
        return [NSString stringWithFormat:@"%lu%%",(unsigned long)item];
    };
    lineChart.labelForValue = ^(CGFloat value) {
        return [NSString stringWithFormat:@"%.f €", value];
    };
    [lineChart setChartData:chartData];
    return lineChart;
}
-(FSLineChart*)chart3 {
    // Generating some dummy data
    NSMutableArray* chartData = [NSMutableArray arrayWithCapacity:13];
    for(int i=0;i<13;i++) {
        chartData[i] = [NSNumber numberWithFloat: (float)i / 30.0f + (float)(rand() % 100) / 500.0f];
    }
    NSArray* months = @[@"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"11", @"12", @"13"];
    // Creating the line chart
    FSLineChart* lineChart = [[FSLineChart alloc] initWithFrame:CGRectMake(20, 60, [UIScreen mainScreen].bounds.size.width - 40, 166)];
    lineChart.verticalGridStep = 3;
    lineChart.horizontalGridStep = 12; // 151,187,205,0.2
    lineChart.color = [UIColor colorWithRed:246.0f/255.0f green:146.0f/255.0f blue:30.0f/255.0f alpha:1.0f];
    lineChart.fillColor = [UIColor colorWithRed:246.0f/255.0f green:146.0f/255.0f blue:30.0f/255.0f alpha:0.3];
    lineChart.bezierSmoothing = NO;
    lineChart.valueLabelBackgroundColor = [UIColor clearColor];
    lineChart.valueLabelPosition = ValueLabelLeftInside;
    lineChart.drawVerticalGrid = NO;
    
     lineChart.labelForIndex = ^(NSUInteger item) {
     return months[item];
     };
     lineChart.labelForValue = ^(CGFloat value) {
     return [NSString stringWithFormat:@"%.0f", value];
     };
    [lineChart setChartData:chartData];
    return lineChart;
}

@end
