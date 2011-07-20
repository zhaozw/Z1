//
//  HelloWorldLayer.m
//  Z1_game
//
//  Created by Doug Whitmore on 7/17/11.
//  Copyright Good Doug 2011. All rights reserved.
//


#import "Z1SplashScreen.h"
#import "Z1MenuScreen.h"

@implementation Z1SplashScreen

@synthesize menuScreen = _menuScreen;

+(CCScene *) scene
{
	CCScene *scene = [CCScene node];
	
	Z1SplashScreen *layer = [Z1SplashScreen node];
	
	[scene addChild: layer];
	
	return scene;
}

- (void) dealloc
{
    [_menuScreen release];
    
    [super dealloc];
}

-(id) init
{
	if(( self = [self initWithEffectNames:[NSArray arrayWithObjects:@"GDParticleStarfield", nil]] )) 
    {
        self.menuScreen = [Z1MenuScreen scene];
        
        self.isKeyboardEnabled = YES;
        
        CGSize size = [[CCDirector sharedDirector] winSize];
		CCSprite* background = [CCSprite spriteWithFile:@"menu.png"];
        background.position = ccp(size.width / 2.0, size.height /2);
        [self addChild:background z:0];
        
        // add press any key label
        CCLabelTTF* pressKeyLabel = [CCLabelTTF labelWithString:@"Press any key" fontName:@"Helvetica" fontSize:48];
        pressKeyLabel.position = ccp(size.width / 2.0, 100.0);
        pressKeyLabel.opacity = 0.0;
        CCFadeIn* fadeAction = [CCFadeIn actionWithDuration:1.0];
        CCDelayTime* delayAction = [CCDelayTime actionWithDuration:0.5];
        [pressKeyLabel runAction:[CCSequence actions:delayAction, fadeAction, nil]];
        [self addChild:pressKeyLabel z:10];
	}
	return self;
}

- (BOOL) ccKeyUp:(NSEvent *)event
{
    
    [[CCDirector sharedDirector] replaceScene:self.menuScreen];
    
    return YES;
}

@end
