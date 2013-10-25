//
//  BluetoothChatViewController.h
//  BluetoothChat
//
//  Created by Wei-Meng Lee on 3/2/10.
//  Copyright Apple Inc 2010. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GameKit/GameKit.h>
#import <AVFoundation/AVFoundation.h>

@interface BluetoothChatViewController : UIViewController 
    <GKVoiceChatClient, GKPeerPickerControllerDelegate, GKSessionDelegate> {
	
    GKSession *currentSession;
    
    IBOutlet UIButton *connect;
    IBOutlet UIButton *disconnect;	
}

@property (nonatomic, retain) GKSession *currentSession;
@property (nonatomic, retain) UIButton *connect;
@property (nonatomic, retain) UIButton *disconnect;

-(IBAction) btnMute:(id) sender;
-(IBAction) btnUnmute:(id) sender;
-(IBAction) btnConnect:(id) sender;
-(IBAction) btnDisconnect:(id) sender;

@end

