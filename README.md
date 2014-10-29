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

You can also set several parameters for the grid, such as the grid step, vertically or horizontally:

```objc
@property (nonatomic, readwrite) int verticalGridStep;
@property (nonatomic, readwrite) int horizontalGridStep;
```

And to hide the grid just set the drawInnedGrid variable to false:

```objc
@property(nonatomic, readwrite) BOOL drawInnerGrid; 
```

If you don't want to fill the chart just set the fillColor variable to nil:

```objc
@property (nonatomic, readwrite) UIColor* fillColor;
```


Examples
---
You can clone the repo to see a simple example. I'm also using FSLineChart on [ChartLoot](https://github.com/ArthurGuibert/ChartLoot) if you want to see the integration in a bigger project.