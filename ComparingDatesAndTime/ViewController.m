//
//  ViewController.m
//  ComparingDatesAndTime
//
//  Created by Stefan Claussen on 24/09/2014.
//  Copyright (c) 2014 One foot after the other. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
//    NSDate *_pomodoroStartTime;
//    NSDate *_pomodoroFinishTime;
}

@property (strong, nonatomic)NSDate *pomodoroStartTime;
@property (strong, nonatomic)NSDate *pomodoroFinishTime;


@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self setPomodoroStartTime:[NSDate date]];
    [self logPomodoroStartTime];
    self.pomodoroFinishTime = [self.pomodoroStartTime dateByAddingTimeInterval:25*60];
    [self logPomodoroFinishTime];
    [self comparingTwoDates];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - logging pomodoro information.

- (void)logPomodoroStartTime
{
    NSDateFormatter *pomodoroStartDateFormatter=[[NSDateFormatter alloc] init];
    [pomodoroStartDateFormatter setDateFormat:@"HH:mm:ss"];
    NSLog(@"%@", [pomodoroStartDateFormatter stringFromDate:self.pomodoroStartTime]);
}

- (void)logPomodoroFinishTime
{
    NSDateFormatter *pomodoroFinishDateFormatter=[[NSDateFormatter alloc] init];
    [pomodoroFinishDateFormatter setDateFormat:@"HH:mm:ss"];
    NSLog(@"%@", [pomodoroFinishDateFormatter stringFromDate:self.pomodoroFinishTime]);
}

#pragma mark - Comparing points in time

- (void)comparingTwoDates
{
    NSTimeInterval timeDifference = [self.pomodoroFinishTime timeIntervalSinceDate:self.pomodoroStartTime];
    
    double minutes = timeDifference / 60;
    double hours = minutes / 60;
    double seconds = timeDifference;
    double days = minutes / 1440;

    NSLog(@" days = %.0f,hours = %.2f, minutes = %.0f,seconds = %.0f", days, hours, minutes, seconds);

    if (seconds >= 1)
    NSLog(@"Pomodoro finish time is greater than the start time");
    else
    NSLog(@"Pomodoro start time is greater than the finish time");
}

@end
