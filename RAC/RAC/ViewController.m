//
//  ViewController.m
//  RAC
//
//  Created by Hector on 2017/1/3.
//  Copyright © 2017年 Hector. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self creatSignal];

}

- (void)creatSignal{
    RACSignal *signal = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        [subscriber sendNext:@1];
        
        [subscriber sendCompleted];
        
        
        return [RACDisposable disposableWithBlock:^{
            
        }];
    }];
    
    [signal subscribeNext:^(id x) {
        NSLog(@"接受信号%@",x);
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
