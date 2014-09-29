//
//  ViewController.m
//  ComparingDatesAndTime

//Simple tasks that might want to do with dates and time.
//- Store the current date and a future date as a property
//- Log a date
//- CompareTwoDates

#import "ViewController.h"

@interface ViewController ()

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

    if (seconds > 1)
    {
    NSLog(@"Pomodoro finish time is greater than the start time");
    }
    else if (seconds < 1) //i.e seconds are negative
    {
        NSLog(@"Pomodoro start time is greater than the finish time");
    }
    else if (seconds == 0)
    {
        NSLog(@"Pomodoro start time is equal to the finish time");
    }
    else
        NSLog(@"Something is wrong");
}

@end
