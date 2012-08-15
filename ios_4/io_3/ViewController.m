//
//  ViewController.m
//  io_3
//
//  Created by ilya on 08.08.12.
//  Copyright (c) 2012 ilya. All rights reserved.
//

#import "ViewController.h"
#import "MyCustomCell.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>{
    
}

@property (strong, nonatomic) IBOutlet UIButton *btn;
@property (strong, nonatomic) IBOutlet UILabel *lbl;
@property (strong, nonatomic) IBOutlet UITableView *tbl;
@property (strong, nonatomic) NSArray *items;
- (IBAction)btn:(UIButton *)sender ;
@property (strong, nonatomic) IBOutlet MyCustomCell *tmpCell;


@end

@implementation ViewController
@synthesize tmpCell;

@synthesize btn;
@synthesize lbl;
@synthesize tbl;
@synthesize items;

-(id) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if(self){
        self.items = @[ @"One", @"Two", @"Three", @"Four", @"Five", @"Six",
        @"Seven", @"Eight", @"Nine", @"Ten", @"Eleven", @"Tw"];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCompose target:self action:@selector(barButtonItemTap:)];
    
    //TODO: hw
    //btn.contentStretch = CGRectMake(0.45, 0, 0.1, 1);
    [btn setBackgroundImage: [[UIImage imageNamed:@"btn_white"] stretchableImageWithLeftCapWidth:7 topCapHeight:0] forState:UIControlStateNormal];
}

-(void)barButtonItemTap{
    NSLog(@"barButtonItemTap");
}

- (IBAction)btn:(UIButton *)sender {
    //UIViewController *newCtrl = [[UIViewController alloc]init];
    //self.title = @"Hello";
    //[self.navigationController pushViewController:newCtrl animated:YES];
    [UIView animateWithDuration:2 delay:0
        options:UIViewAnimationOptionCurveEaseInOut | UIViewAnimationOptionRepeat
        animations:^{
            lbl.alpha = 0.0;
        }
        completion:^(BOOL finished){
            NSLog(@"completion");
        }];
}

- (void)viewDidUnload
{
    [self setBtn:nil];
    [self setLbl:nil];
    [self setTbl:nil];
    [self setTmpCell:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.items.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 65;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString* cellId = @"MyCell";
    MyCustomCell* cell = (MyCustomCell*)[tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell){
        [[NSBundle mainBundle] loadNibNamed:@"MyCustomCell" owner:self options:nil];
        cell = self.tmpCell;
        self.tmpCell = nil;
        NSLog(@"Created the new cell %@ for row: %d", cell, indexPath.row);
    } else{
        NSLog(@"Reused the cell %@ for row: %d", cell, indexPath.row);
    }
    cell.textLabel.text = [self.items objectAtIndex:indexPath.row];
    cell.detailTextLabel.text =[indexPath description];
    if (indexPath.row == 2){
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }
    return cell;
}

@end
