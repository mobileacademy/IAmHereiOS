//
//  ViewController.m
//  iamhere
//
//  Created by Mihai Iancu on 21/01/16.
//  Copyright © 2016 Mobile Academy. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>

#import "ViewController.h"

@interface ViewController (){
    IBOutlet UILabel *_labelToken;
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

- (IBAction) pushSomething:(id)sender {
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    
    NSString *msg = @"hello";
    NSDictionary *params = @{@"token": _token, @"msg": msg};
    
    [manager POST:@"http://iamhere2.herokuapp.com/messages" parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", operation.responseString);
        NSLog(@"Error: %@", error);
    }];
}

- (void) setToken:(NSString *)token {
    _labelToken.text = token;
    _token = token;
}

@end
