//
//  ViewController.m
//  RAC
//
//  Created by Hector on 2017/1/3.
//  Copyright © 2017年 Hector. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (nonatomic, copy) NSDictionary *dic;
@property (nonatomic, copy) NSString *str;

@property (nonatomic, strong) RACSignal *signal;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self creatSignal];
    
    [self rac];
    

    self.dic = @{@"ss":@"sss"};
    
    [self kvo];

    
//    [RACObserve(self, dic) subscribeNext:^(id x) {
//        
//    }];
    

}

- (void)creatSignal
{
   self.signal = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        [subscriber sendNext:@"ss"];
//        [subscriber sendCompleted];
        return [RACDisposable disposableWithBlock:^{
            NSLog(@"信号被销毁");
        }];
    }];
    
    [self.signal subscribeNext:^(id x) {
        NSLog(@"接受信号%@",x);
    }];
}

//8.1 RAC(TARGET, [KEYPATH, [NIL_VALUE]]):用于给某个对象的某个属性绑定。
- (void)rac
{
    RAC(self.titleLabel,text) = self.textField.rac_textSignal;
}

- (void)kvo
{
    [[self rac_valuesAndChangesForKeyPath:@"dic" options:NSKeyValueObservingOptionNew observer:nil] subscribeNext:^(id x) {
        
    }];
}

- (void)ss
{
    //    [RACObserve(self, dic) subscribeNext:^(id x) {
    //
    //    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
