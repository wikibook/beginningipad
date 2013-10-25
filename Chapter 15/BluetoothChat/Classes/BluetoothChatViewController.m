//
//  BluetoothChatViewController.m
//  BluetoothChat
//
//  Created by Wei-Meng Lee on 3/2/10.
//  Copyright Apple Inc 2010. All rights reserved.
//

#import "BluetoothChatViewController.h"

@implementation BluetoothChatViewController

@synthesize currentSession;
@synthesize connect;
@synthesize disconnect;

GKPeerPickerController *picker;
NSString *recorderFilePath;

AVAudioPlayer *audioPlayer;

- (IBAction) btnConnect:(id) sender {
    //---Select a nearby Bluetooth device---
    picker = [[GKPeerPickerController alloc] init];
    picker.delegate = self;
    picker.connectionTypesMask = GKPeerPickerConnectionTypeNearby;  
    
    [connect setHidden:YES];
    [disconnect setHidden:NO];
    
    [picker show];    
}

-(IBAction) btnDisconnect:(id) sender {
	
    //---disconnected from the other device---
    [self.currentSession disconnectFromAllPeers];
    [self.currentSession release];
    currentSession = nil;
    
    [connect setHidden:NO];
    [disconnect setHidden:YES];
}

- (void)peerPickerController:(GKPeerPickerController *)picker 
              didConnectPeer:(NSString *)peerID 
                   toSession: (GKSession *) session {
	
    self.currentSession = session;
    session.delegate = self;
    [session setDataReceiveHandler: self withContext:nil];
    picker.delegate = nil;
    [picker dismiss];
    [picker autorelease];    	
}

- (void)peerPickerControllerDidCancel:(GKPeerPickerController *)picker {	
    picker.delegate = nil;
    [picker autorelease];
    
    [connect setHidden:NO];
    [disconnect setHidden:YES];	
}

-(IBAction) btnMute:(id) sender {	
    //---mute the voice chat---
    [GKVoiceChatService defaultVoiceChatService].microphoneMuted = YES;    	
}

-(IBAction) btnUnmute:(id) sender {	
    //---unmute the voice chat---
    [GKVoiceChatService defaultVoiceChatService].microphoneMuted = NO;	
}

//---returns a unique ID that identifies the local user---
-(NSString *) participantID
{
    return currentSession.peerID;
}

-(void) voiceChatService:(GKVoiceChatService *) voiceChatService
                sendData:(NSData *) data
         toParticipantID:(NSString *)participantID {
	
    [currentSession sendData:data toPeers:
	 [NSArray arrayWithObject:participantID] 
				withDataMode:GKSendDataReliable error:nil];
	
}

- (void)session:(GKSession *)session 
           peer:(NSString *)peerID 
 didChangeState:(GKPeerConnectionState)state {
	
    switch (state)
    {
        case GKPeerStateConnected:
        {            
            //---plays an audio file---
            NSString *soundFilePath = [[NSBundle mainBundle] 
									   pathForResource:@"beep" ofType:@"wav"];
			
            NSURL *fileURL = [[NSURL alloc] 
							  initFileURLWithPath: soundFilePath];
			
            AVAudioPlayer *audioPlayer =
			[[AVAudioPlayer alloc] initWithContentsOfURL:fileURL 
												   error:nil];
			
            [fileURL release];
            [audioPlayer play];            
            
            NSError *error;
            AVAudioSession *audioSession = 
			[AVAudioSession sharedInstance];
			
            if (![audioSession  
				  setCategory:AVAudioSessionCategoryPlayAndRecord 
				  error:&error]) {
                NSLog(@"Error setting the AVAudioSessionCategoryPlayAndRecord category: %@", 
					  [error localizedDescription]);
            }
            
            if (![audioSession setActive: YES error: &error]) {
                NSLog(@"Error activating audioSession: %@", 
					  [error description]);
            }
            
            [GKVoiceChatService defaultVoiceChatService].client = self;
            
            //---initiating the voice chat---
            if (![[GKVoiceChatService defaultVoiceChatService] 
				  startVoiceChatWithParticipantID:peerID error:&error]) {
                NSLog(@"Error starting startVoiceChatWithParticipantID: %@", 
					  [error userInfo]);
            }
        } break;
            
        case GKPeerStateDisconnected:
        {
            [[GKVoiceChatService defaultVoiceChatService] 
			 stopVoiceChatWithParticipantID:peerID];
            
            [self.currentSession release];
            currentSession = nil;        
            
            [connect setHidden:NO];
            [disconnect setHidden:YES];
			
        } break;
    }
}

- (void) receiveData:(NSData *)data 
            fromPeer:(NSString *)peer 
           inSession:(GKSession *)session 
             context:(void *)context {
	
    //---start the voice chat when initiated by the client---
    [[GKVoiceChatService defaultVoiceChatService] 
	 receivedData:data fromParticipantID:peer];
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [connect setHidden:NO];
    [disconnect setHidden:YES];

    [super viewDidLoad];
}

// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return YES;
}

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}

- (void)dealloc {
    [super dealloc];
}

@end
