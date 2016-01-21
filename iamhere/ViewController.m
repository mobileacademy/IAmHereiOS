//
//  ViewController.m
//  iamhere
//
//  Created by Mihai Iancu on 21/01/16.
//  Copyright © 2016 Mobile Academy. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>

#import "ViewController.h"

@interface ViewController ()

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

- (IBAction) pushSomething:(id)sender {
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    
    NSString *token = @"TBD-01234";
    NSString *msg = @"hello";
    NSDictionary *params = @{@"token": token, @"msg": msg};
    
    [manager POST:@"http://iamhere2.herokuapp.com/messages" parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", operation.responseString);
        NSLog(@"Error: %@", error);
    }];
}

@end
