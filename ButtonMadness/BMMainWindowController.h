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

#pragma mark Pop Up Buttons Box
@property ( assign ) IBOutlet NSBox* _popUpButtonsBox;
    // Nib based controls
    @property ( assign ) IBOutlet NSPopUpButton* _nibBasedPopUpButtonDown;
    @property ( assign ) IBOutlet NSPopUpButton* _nibBasedPopUpButtonRight;
        @property ( copy ) IBOutlet NSMenu* _nibBasedPopUpButtonRightMenu;

    // Code based controls
    @property ( assign ) IBOutlet NSView* _popUpButtonsBoxPlaceholderUp;
        @property ( retain ) NSPopUpButton* _codeBasedPopUpButtonDown;

    @property ( assign ) IBOutlet NSView* _popUpButtonsBoxPlaceholderDown;
        @property ( retain ) NSPopUpButton* _codeBasedPopUpButtonRight;

#pragma mark Buttons Box
@property ( assign ) IBOutlet NSBox* _buttonsBox;
    // Nib based controls
    @property ( assign ) IBOutlet NSButton* _nibBasedBevelButton;
    @property ( assign ) IBOutlet NSButton* _nibBasedSquareButton;

    // Code based controls
    @property ( assign ) IBOutlet NSView* _buttonsBoxPlaceholderUp;
        @property ( retain ) NSButton* _codeBasedBevelButton;
    @property ( assign ) IBOutlet NSView* _buttonsBoxPlaceholderDown;
        @property ( retain ) NSButton* _codeBasedSquareButton;

#pragma mark Segmented Control Box
@property ( assign ) IBOutlet NSBox* _segmentedControlsBox;
    // Nib based controls
    @property ( assign ) IBOutlet NSSegmentedControl* _nibBasedSegmentedControl;

    // Code based control
    @property ( assign ) IBOutlet NSView* _segmentedControlsBoxPlaceholder;
        @property ( retain ) NSSegmentedControl* _codeBasedSegmentedControl;

#pragma mark Matrixes Box
@property ( assign ) IBOutlet NSBox* _matrixesBox;
    // Nib based controls
    @property ( assign ) IBOutlet NSMatrix* _nibBasedMatrix;

    // Code based controls
    @property ( assign ) IBOutlet NSView* _matrixesBoxPlaceholder;
        @property ( retain ) NSMatrix* _codeBasedMatrix;

#pragma mark Color Wells Box
@property ( assign ) IBOutlet NSBox* _colorWellsBox;
    // Nib based controls
    @property ( assign ) IBOutlet NSColorWell* _nibBasedColorWell;

    // Code based controls
    @property ( assign ) IBOutlet NSView* _colorWellsPlaceholder;
        @property ( retain ) NSColorWell* _codeBasedColorWell;

#pragma mark Level Indicators Box
@property ( assign ) IBOutlet NSBox* _levelIndicatorsBox;
    // Nib based controls
    @property ( assign ) IBOutlet NSStepper* _levelAdjuster;
    @property ( assign ) IBOutlet NSLevelIndicator* _nibBasedLevelIndicator;

    // Code based controls
    @property ( assign ) IBOutlet NSView* _levelIndicatorsPlaceholder;
        @property ( retain ) NSLevelIndicator* _codeBasedLevelIndicator;

+ ( id ) mainWindowController;

#pragma mark The action methods for all the buttons
// Action methods for the controls that reside in NSPopUpButton box
- ( IBAction ) changedIsPullDown: ( id )_Sender;
- ( IBAction ) popupAction: ( id )_Sender;

// Action methods for the controls that reside in NSButton box
- ( IBAction ) changedIsUseIction: ( id )_Sender;
- ( IBAction ) buttonsActions: ( id )_Sender;

- ( IBAction ) dropDownButtonAction: ( id )_Sender;

// Action methods for the controls that reside in NSSegmentedControl box
- ( IBAction ) segmentsAction: ( id )_Sender;
- ( IBAction ) unselectorAction: ( id )_Sender;

// Action methods for the controls that reside in NSMatrix box
- ( IBAction ) changedRadio: ( id )_Sender;

// Action methods for the controls that reside in NSColorWell box
- ( IBAction ) colorWellAction: ( id )_Sender;

// Action methods for the controls that reside in NSLevelIndicator box
- ( IBAction ) levelAdjusterAction: ( id )_Sender;
- ( IBAction ) levelIndicatorAction: ( id )_Sender;
- ( IBAction ) setStyleAction: ( id )_Sender;

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