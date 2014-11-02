FSLineChart
===========

A line chart library for iOS.

Screenshots
---
<img src="Screenshots/fslinechart.png" width="320px" />&nbsp;
<img src="Screenshots/fslinechart2.png" width="320px" />

Installing FSLineChart
---
Add the contents of the FSLineChart project to your directory or simply add the following line to your Podfile:

    pod "FSLineChart"

How to use
---
FSLineChart is a subclass of UIView so it can be added as regular view. The block structure allows you to format the values displayed on the chart the way you want. Here is a simple example:

```objc
NSArray* months = @[@"January", @"February", @"March", @"April", @"May", @"June", @"July"];
    
FSLineChart* lineChart = [[FSLineChart alloc] initWithFrame:CGRectMake(20, 260, [UIScreen mainScreen].bounds.size.width - 40, 166)];

lineChart.labelForIndex = ^(NSUInteger item) {
    return months[item];
};

lineChart.labelForValue = ^(CGFloat value) {
    return [NSString stringWithFormat:@"%.02f €", powf(10,value)];
};

[lineChart setChartData:chartData];
```

You can also set several parameters. All those properties are available:

```objc
// Index label properties
@property (nonatomic, strong) UIFont* indexLabelFont;
@property (nonatomic) UIColor* indexLabelTextColor;
@property (nonatomic) UIColor* indexLabelBackgroundColor;

// Value label properties
@property (nonatomic, strong) UIFont* valueLabelFont;
@property (nonatomic) UIColor* valueLabelTextColor;
@property (nonatomic) UIColor* valueLabelBackgroundColor;
@property (nonatomic) ValueLabelPositionType valueLabelPosition;

// Number of visible step in the chart
@property (nonatomic, readwrite) int gridStep;
@property (nonatomic, readwrite) int verticalGridStep;
@property (nonatomic, readwrite) int horizontalGridStep;

// Margin of the chart
@property (nonatomic, readwrite) CGFloat margin;

// Let you change the axis color and the axis line width
@property (nonatomic, readwrite) UIColor* axisColor;
@property (nonatomic, readwrite) CGFloat axisLineWidth;

// Chart parameters
@property (nonatomic, readwrite) UIColor* color;
@property (nonatomic, readwrite) UIColor* fillColor;
@property (nonatomic, readwrite) CGFloat lineWidth;

// Grid parameters
@property (nonatomic, readwrite) BOOL drawInnerGrid;
@property (nonatomic, readwrite) UIColor* innerGridColor;
@property (nonatomic, readwrite) CGFloat innerGridLineWidth;

// Smoothing
@property (nonatomic, readwrite) BOOL bezierSmoothing;
@property (nonatomic, readwrite) CGFloat bezierSmoothingTension;

// Animations
@property (nonatomic, readwrite) CGFloat animationDuration;
```


Examples
---
You can clone the repo to see a simple example. I'm also using FSLineChart on [ChartLoot](https://github.com/ArthurGuibert/ChartLoot) if you want to see the integration in a bigger project.