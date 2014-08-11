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

#pragma mark Image Resource Name
NSString static* const kMoofOneImageName = @"moof1.png";
NSString static* const kMoofTwoImageName = @"moof2.png";

/* NSSegmentedControl category to unselect all segments.
 *
 * NSSegmentedControl won't unselect all segments if there is currently one
 * segment selected.  So you have to go into the "Momentary tracking mode", unselect
 * each of the cells, then go back to its original mode.
 */
@interface NSSegmentedControl ( BMSampleAddition )
- ( void ) unselectAllSegments;
@end // NSSegmentedControl + BMSampleAddition

@implementation NSSegmentedControl ( BMSampleAddition )

- ( void ) unselectAllSegments
    {
    NSSegmentSwitchTracking currentMode = [ self.cell trackingMode ];
    [ self.cell setTrackingMode: NSSegmentSwitchTrackingMomentary ];

    for ( int index = 0; index < [ self segmentCount ]; index++ )
        [ self.cell setSelected: NO forSegment: index ];

    [ self.cell setTrackingMode: currentMode ];
    }

@end // NSSegmentedControl + BMSampleAddition

// BMMainWindowController class
@implementation BMMainWindowController

#pragma mark Pop Up Buttons Box
@synthesize _popUpButtonsBox;
    // Nib based controls
    @synthesize _nibBasedPopUpButtonDown;
    @synthesize _nibBasedPopUpButtonRight;
        @synthesize _nibBasedPopUpButtonMenu;

    // Code based controls
    @synthesize _popUpButtonsBoxPlaceholderUp;
        @synthesize _codeBasedPopUpButtonDown;

    @synthesize _popUpButtonsBoxPlaceholderDown;
        @synthesize _codeBasedPopUpButtonRight;

    @synthesize _isPullDownCheckBox;

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

#pragma mark Initializers and Deallocator
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

- ( void ) dealloc
    {
    [ self._codeBasedPopUpButtonDown release ];
    [ self._codeBasedPopUpButtonRight release ];
    [ self._codeBasedBevelButton release ];
    [ self._codeBasedSquareButton release ];
    [ self._codeBasedSegmentedControl release ];
    [ self._codeBasedMatrix release ];
    [ self._codeBasedColorWell release ];
    [ self._codeBasedLevelIndicator release ];
    [ self._nibBasedSegmentedControl release ];

    [ super dealloc ];
    }

#pragma mark Conforms <NSNibAwaking> protocol
- ( void ) awakeFromNib
    {
    NSImage* moofOneImage = [ NSImage imageNamed: kMoofOneImageName ];
    NSImage* moofTwoImage = [ NSImage imageNamed: kMoofTwoImageName ];

    [ self._nibBasedBevelButton setImage: moofOneImage ];
    [ self._nibBasedSquareButton setImage: moofOneImage ];

    // NSPopupButton

    /* Update its menu ( keep original self._nibBasedPopUpButtonMenu */
    NSMenu* newMenu = [ self._nibBasedPopUpButtonMenu copy ];

    // Add the image menu item back to the first menu item
    NSMenuItem* menuItem = [ [ NSMenuItem alloc ] initWithTitle: @"" action: nil keyEquivalent: @"" ];
    [ menuItem setImage: [ NSImage imageNamed: kMoofOneImageName ] ];
    [ newMenu insertItem: menuItem atIndex: 0 ];
    [ menuItem release ];

    // Create the pull down button poiting DOWN
    NSRect buttonFrame = [ self._popUpButtonsBoxPlaceholderUp frame ];
    self._codeBasedPopUpButtonDown = [ [ [ NSPopUpButton alloc ] initWithFrame: buttonFrame pullsDown: self._isPullDownCheckBox.state ] autorelease ];
    [ [ self._codeBasedPopUpButtonDown cell ] setArrowPosition: NSPopUpArrowAtBottom ];

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
    [ self._nibBasedSegmentedControl unselectAllSegments ];
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