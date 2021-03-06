//
//  ViewController.m
//  Fullscreen
//
//  Created by Dolice on 2013/05/25.
//  Copyright (c) 2013年 Dolice. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, retain) UINavigationBar *navigationBar;
@property (nonatomic, retain) UIToolbar *toolBar;
@property (nonatomic) BOOL isFullscreen;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //ナビゲーションバー初期化
    _navigationBar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
    [self.view addSubview:_navigationBar];
    
    //ツールバー初期化
    _toolBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height - 44, 320, 44)];
    [self.view addSubview:_toolBar];
    
    //ボタン初期化
    UIButton *fullscreenButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    fullscreenButton.frame = CGRectMake(self.view.center.x - 50, self.view.center.y - 22, 100, 44);
    [fullscreenButton setTitle:@"Fullscreen"
            forState:UIControlStateNormal];
    [fullscreenButton sizeToFit];
    [fullscreenButton addTarget:self
               action:@selector(fullscreenEvent:)
     forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:fullscreenButton];
    
    //フルスクリーンフラグ初期化
    _isFullscreen = NO;
}

- (IBAction)fullscreenEvent:(id)sender
{
    //フルスクリーンフラグ切り替え
    _isFullscreen = !_isFullscreen;
    
    //ステータスバーを非表示にする
    [[UIApplication sharedApplication] setStatusBarHidden:_isFullscreen];
    
    //ナビゲーションバーを非表示にする
    _navigationBar.hidden = _isFullscreen;
    
    //ツールバーを非表示にする
    _toolBar.hidden = _isFullscreen;
}

@end
