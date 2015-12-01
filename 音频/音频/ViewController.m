//
//  ViewController.m
//  音频
//
//  Created by tarena on 15/12/1.
//  Copyright © 2015年 tarena. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>
@interface ViewController ()
@property (assign,nonatomic)SystemSoundID sysID;
@property (strong,nonatomic)AVAudioPlayer *player;


@end

@implementation ViewController
-(AVAudioPlayer *)player{
    if (!_player) {
        NSURL *url = [[NSBundle mainBundle] URLForResource:@"AllOfMe" withExtension:@"mp3"];
        _player = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    }
    return _player;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    
    
    
    
}

- (IBAction)playShortAudio:(id)sender {
    //
    NSString *shortPath = [[NSBundle mainBundle] pathForResource:@"audio.wav" ofType:nil];
    NSURL *url = [NSURL fileURLWithPath:shortPath];
    
    AudioServicesCreateSystemSoundID((__bridge CFURLRef _Nonnull)(url),&_sysID );
    AudioServicesPlayAlertSound(_sysID);
}
- (IBAction)playlocalAudio:(id)sender {
    [self.player play];
    
    
}
- (IBAction)pauseLocalAudio:(id)sender {
    if (self.player.playing) {
        [self.player pause];
    }
}

- (IBAction)cancelAudio:(id)sender {
    [self.player stop];
    self.player = nil;
}

@end
