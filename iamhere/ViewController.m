//
//  ViewController.m
//  iamhere
//
//  Created by Mihai Iancu on 23/01/16.
//  Copyright © 2016 Mobile Academy. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () {
    IBOutlet UILabel *labelToken;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) setToken:(NSString *)token {
    labelToken.text = token;
    _token = token;
}

- (IBAction) pushSomething:(id)sender {
    NSLog(@"will do a push with token %@", _token);
}
@end
