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

@property (nonatomic, strong) IBOutlet FSLineChart *chart;
@property (nonatomic, strong) IBOutlet FSLineChart *chartWithDates;
@property (nonatomic, strong) IBOutlet FSLineChart *chartWithGradient;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadSimpleChart];
    [self loadChartWithDates];
    [self loadGradientChart];
}

#pragma mark - Setting up the charts

- (void)loadSimpleChart {
    NSMutableArray* chartData = [NSMutableArray arrayWithCapacity:10];
    
    for(int i=0;i<10;i++) {
        int r = (rand() + rand()) % 1000;
        chartData[i] = [NSNumber numberWithInt:r + 200];
    }
    
    // Setting up the line chart
    self.chart.verticalGridStep = 5;
    self.chart.horizontalGridStep = 9;
    
    self.chart.labelForIndex = ^(NSUInteger item) {
        return [NSString stringWithFormat:@"%lu",(unsigned long)item];
    };
    
    self.chart.labelForValue = ^(CGFloat value) {
        return [NSString stringWithFormat:@"%.f", value];
    };
    
    [self.chart setChartData:chartData];
}

- (void)loadChartWithDates {
    // Generating some dummy data
    NSMutableArray* chartData = [NSMutableArray arrayWithCapacity:7];
    for(int i=0;i<7;i++) {
        chartData[i] = [NSNumber numberWithFloat: (float)i / 30.0f + (float)(rand() % 100) / 500.0f];
    }
    
    NSArray* months = @[@"January", @"February", @"March", @"April", @"May", @"June", @"July"];
    
    // Setting up the line chart
    _chartWithDates.verticalGridStep = 6;
    _chartWithDates.horizontalGridStep = 3;
    _chartWithDates.fillColor = nil;
    _chartWithDates.displayDataPoint = YES;
    _chartWithDates.dataPointColor = [UIColor fsOrange];
    _chartWithDates.dataPointBackgroundColor = [UIColor fsOrange];
    _chartWithDates.dataPointRadius = 2;
    _chartWithDates.color = [_chartWithDates.dataPointColor colorWithAlphaComponent:0.3];
    _chartWithDates.valueLabelPosition = ValueLabelLeftMirrored;
    
    _chartWithDates.labelForIndex = ^(NSUInteger item) {
        return months[item];
    };
    
    _chartWithDates.labelForValue = ^(CGFloat value) {
        return [NSString stringWithFormat:@"%.02f €", value];
    };
    
    [_chartWithDates setChartData:chartData];
}

- (void)loadGradientChart {
//    FSLineChart * lineChart = [[FSLineChart alloc] initWithFrame:CGRectMake(20, 260 + 166 + 10, [UIScreen mainScreen].bounds.size.width - 40, 166)];
    _chartWithGradient.verticalGridStep = 4;
//    _chartWithGradient.horizontalGridStep = 10;
    
    _chartWithGradient.labelForIndex = ^(NSUInteger item) {
        return [NSString stringWithFormat:@"%lu",(unsigned long)item];
    };
    
    _chartWithGradient.labelForValue = ^(CGFloat value) {
        return [NSString stringWithFormat:@"%.f", value];
    };
    
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    //gradient direction
    gradientLayer.startPoint = CGPointMake(0, 0);
    gradientLayer.endPoint   = CGPointMake(0, 1);
    
    //gradient colors
    gradientLayer.colors = @[(__bridge id)[UIColor redColor].CGColor,
                             (__bridge id)[UIColor yellowColor].CGColor,
                             (__bridge id)[UIColor greenColor].CGColor
                             ];
    //gradient position for colors
    gradientLayer.locations = @[@(0.3f), @(0.7f),@(0.9f)];
    
    _chartWithGradient.fillColor                 = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.5];
    /**
     *  gradient only effect when fillColor isn't nil;
     */
//    _chartWithGradient.gradientLayer             = gradientLayer;
    _chartWithGradient.lineWidth                 = 0.2;
    _chartWithGradient.color                     = [UIColor fsLightBlue];
    _chartWithGradient.valueLabelPosition        = ValueLabelLeft;
    _chartWithGradient.valueLabelTextColor       = [UIColor fsDarkGray];
    _chartWithGradient.indexLabelTextColor       = [UIColor fsDarkGray];
    _chartWithGradient.bezierSmoothing           = YES;
    
    NSMutableArray* chartData = [NSMutableArray arrayWithCapacity:101];
    for(int i=0;i<101;i++) {
//        chartData[i] = [NSNumber numberWithFloat:(float)i / 30.0f + (float)(rand() % 100) / 200.0f];
        chartData[i] = [NSNumber numberWithFloat:(float)(arc4random() % 200) + 1];
    }
    
    [_chartWithGradient setChartData:chartData];
}

@end
