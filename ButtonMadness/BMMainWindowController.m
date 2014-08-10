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

#import "BMMainWindowController.h"

// BMMainWindowController class
@implementation BMMainWindowController

#pragma mark Pop Up Buttons Box
@synthesize _popUpButtonsBox;
    // Nib based controls
    @synthesize _nibBasedPopUpButtonDown;
    @synthesize _nibBasedPopUpButtonRight;
        @synthesize _nibBasedPopUpButtonRightMenu;

    // Code based controls
    @synthesize _popUpButtonsBoxPlaceholderUp;
        @synthesize _codeBasedPopUpButtonDown;

    @synthesize _popUpButtonsBoxPlaceholderDown;
        @synthesize _codeBasedPopUpButtonRight;

#pragma mark Buttons Box
@synthesize _buttonsBox;
    // Nib based controls
    @synthesize _nibBasedBevelButton;
    @synthesize _nibBasedSquareButton;

    // Code based controls
    @synthesize _buttonsBoxPlaceholderUp;
        @synthesize _codeBasedBevelButton;
    @synthesize _buttonsBoxPlaceholderDown;
        @synthesize _codeBasedSquareButton;

#pragma mark Segmented Control Box
@synthesize _segmentedControlsBox;
    // Nib based controls
    @synthesize _nibBasedSegmentedControl;

    // Code based control
    @synthesize _segmentedControlsBoxPlaceholder;
        @synthesize _codeBasedSegmentedControl;

#pragma mark Matrixes Box
@synthesize _matrixesBox;
    // Nib based controls
    @synthesize _nibBasedMatrix;

    // Code based controls
    @synthesize _matrixesBoxPlaceholder;
        @synthesize _codeBasedMatrix;

#pragma mark Color Wells Box
@synthesize _colorWellsBox;
    // Nib based controls
    @synthesize _nibBasedColorWell;

    // Code based controls
    @synthesize _colorWellsPlaceholder;
        @synthesize _codeBasedColorWell;

#pragma mark Level Indicators Box
@synthesize _levelIndicatorsBox;
    // Nib based controls
    @synthesize _levelAdjuster;
    @synthesize _nibBasedLevelIndicator;

    // Code based controls
    @synthesize _levelIndicatorsPlaceholder;
        @synthesize _codeBasedLevelIndicator;

#pragma mark Initializers
+ ( id ) mainWindowController
    {
    return [ [ [ [ self class ] alloc ] init ] autorelease ];
    }

- ( id ) init
    {
    if ( self = [ super initWithWindowNibName: @"BMMainWindow" ] )
        {
        // TODO:
        }

    return self;
    }

#pragma mark Conforms <NSNibAwaking> protocol
- ( void ) awakeFromNib
    {
    // TODO:
    }

#pragma mark The action methods for all the buttons
// Action methods for the controls that reside in NSPopUpButton box
- ( IBAction ) changedIsPullDown: ( id )_Sender
    {

    }

- ( IBAction ) popupAction: ( id )_Sender
    {

    }

// Action methods for the controls that reside in NSButton box
- ( IBAction ) changedIsUseIction: ( id )_Sender
    {

    }

- ( IBAction ) buttonsActions: ( id )_Sender
    {

    }

- ( IBAction ) dropDownButtonAction: ( id )_Sender
    {

    }

// Action methods for the controls that reside in NSSegmentedControl box
- ( IBAction ) segmentsAction: ( id )_Sender
    {

    }

- ( IBAction ) unselectorAction: ( id )_Sender
    {

    }

// Action methods for the controls that reside in NSMatrix box
- ( IBAction ) changedRadio: ( id )_Sender
    {

    }

// Action methods for the controls that reside in NSColorWell box
- ( IBAction ) colorWellAction: ( id )_Sender
    {

    }

// Action methods for the controls that reside in NSLevelIndicator box
- ( IBAction ) levelAdjusterAction: ( id )_Sender
    {

    }

- ( IBAction ) levelIndicatorAction: ( id )_Sender
    {

    }

- ( IBAction ) setStyleAction: ( id )_Sender
    {

    }


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