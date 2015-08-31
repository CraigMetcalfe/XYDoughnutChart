#import <objc/runtime.h>
#import "NSIndexPath+XYDoughnutChart.h"

static void *NSIndexPathXYDoughnutChartSliceKey;

@implementation NSIndexPath (XYDoughnutChart)

+ (NSIndexPath *)indexPathForSlice:(NSUInteger)slice
{
    NSIndexPath *index = [[NSIndexPath alloc] init];
    index.slice = slice;
    return index;
}

- (void)setSlice:(NSInteger)slice {
    objc_setAssociatedObject(self, &NSIndexPathXYDoughnutChartSliceKey, @(slice), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSUInteger)slice {
    return [(NSNumber *)objc_getAssociatedObject(self, &NSIndexPathXYDoughnutChartSliceKey) unsignedIntegerValue];
}

@end
