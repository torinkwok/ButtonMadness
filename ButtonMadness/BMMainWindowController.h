///:
/*****************************************************************************
 **                                                                         **
 **                               .======.                                  **
 **                               | INRI |                                  **
 **                               |      |                                  **
 **                               |      |                                  **
 **                      .========'      '========.                         **
 **                      |   _      xxxx      _   |                         **
 **                      |  /_;-.__ / _\  _.-;_\  |                         **
 **                      |     `-._`'`_/'`.-'     |                         **
 **                      '========.`\   /`========'                         **
 **                               | |  / |                                  **
 **                               |/-.(  |                                  **
 **                               |\_._\ |                                  **
 **                               | \ \`;|                                  **
 **                               |  > |/|                                  **
 **                               | / // |                                  **
 **                               | |//  |                                  **
 **                               | \(\  |                                  **
 **                               |  ``  |                                  **
 **                               |      |                                  **
 **                               |      |                                  **
 **                               |      |                                  **
 **                               |      |                                  **
 **                   \\    _  _\\| \//  |//_   _ \// _                     **
 **                  ^ `^`^ ^`` `^ ^` ``^^`  `^^` `^ `^                     **
 **                                                                         **
 **                       Copyright (c) 2014 Tong G.                        **
 **                          ALL RIGHTS RESERVED.                           **
 **                                                                         **
 ****************************************************************************/

#import <Cocoa/Cocoa.h>

// BMMainWindowController class
@interface BMMainWindowController : NSWindowController

#pragma mark Pop Up Box
@property ( assign ) IBOutlet NSBox* _popUpBox;
    // Nib based controls
    @property ( assign ) IBOutlet NSPopUpButton* _nibBasedPopUpDown;
    @property ( assign ) IBOutlet NSPopUpButton* _nibBasedPopUpRight;
        @property ( assign ) IBOutlet NSMenu* _nibBasedPopUpRightMenu;

    // Code based controls
    @property ( assign ) IBOutlet NSView* _popUpBoxPlaceHolderUp;
        @property ( retain ) NSPopUpButton* _codeBasedPopUpDown;

    @property ( assign ) IBOutlet NSView* _popUpBoxPlaceHolderDown;
        @property ( retain ) NSPopUpButton* _codeBasedPopUpRight;

#pragma mark Button Box
@property ( assign ) IBOutlet NSBox* _buttonBox;
    // Nib based controls
    @property ( assign ) IBOutlet NSButton* _nibBasedBevelButton;
    @property ( assign ) IBOutlet NSButton* _nibBasedSquareButton;

    // Code based controls
    @property ( assign ) IBOutlet NSView* _buttonBoxPlaceHolderUp;
        @property ( retain ) NSButton* _codeBasedBevelButton;
    @property ( assign ) IBOutlet NSView* _buttonBoxPlaceHolderDown;
        @property ( retain ) NSButton* _codeBasedSquareButton;

#pragma mark Segmented 

+ ( id ) mainWindowController;

@end // BMMainWindowController

/////////////////////////////////////////////////////////////////////////////

/****************************************************************************
 **                                                                        **
 **      _________                                      _______            **
 **     |___   ___|                                   / ______ \           **
 **         | |     _______   _______   _______      | /      |_|          **
 **         | |    ||     || ||     || ||     ||     | |    _ __           **
 **         | |    ||     || ||     || ||     ||     | |   |__  \          **
 **         | |    ||     || ||     || ||     ||     | \_ _ __| |  _       **
 **         |_|    ||_____|| ||     || ||_____||      \________/  |_|      **
 **                                           ||                           **
 **                                    ||_____||                           **
 **                                                                        **
 ***************************************************************************/
///:~