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

// Defaults Keys
NSString* const BMDefaultsKeyIsPullDown = @"BMDefaultsKeyIsPullDown";
NSString* const BMDefaultsKeyUsesIcon = @"BMDefaultsKeyUsesIcon";
NSString* const BMDefaultsKeyNibBasedSegmentedControlState = @"BMDefaultsKeyNibBasedSegmentedControlState";
NSString* const BMDefaultsKeyCodeBasedSegmentedControlState = @"BMDefaultsKeyCodeBasedSegmentedControlState";
NSString* const BMDefaultsKeyNibBasedSelectedRadio = @"BMDefaultsKeyNibBasedSelectedRadio";
NSString* const BMDefaultsKeyCodeBasedSelectedRadio = @"BMDefaultsKeyCodeBasedSelectedRadio";
NSString* const BMDefaultsKeyNibBasedColorWellColorState = @"BMDefaultsKeyNibBasedColorWellColorState";
NSString* const BMDefaultsKeyCodeBasedColorWellColorState = @"BMDefaultsKeyCodeBasedColorWellColorState";

// Image Resource Name
NSString static* const kMoofOneImageName = @"moof1.png";
NSString static* const kMoofTwoImageName = @"moof2.png";

// Tags
typedef enum { BMOne = 10, BMTwo, BMThree } BMSegmentedControlTags;

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

    @synthesize _usesIconCheckBox;

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
    [ self._isPullDownCheckBox setState: [ USER_DEFAULTS boolForKey: BMDefaultsKeyIsPullDown ] ];
    [ self._usesIconCheckBox setState: [ USER_DEFAULTS boolForKey: BMDefaultsKeyUsesIcon ] ];

    NSImage* moofOneImage = [ NSImage imageNamed: kMoofOneImageName ];
    NSImage* moofTwoImage = [ NSImage imageNamed: kMoofTwoImageName ];

    [ self._nibBasedBevelButton setImage: moofOneImage ];
    [ self._nibBasedSquareButton setImage: moofOneImage ];

    // ===================================================================
    // NSPopupButton

    /* Update its menu ( keep original self._nibBasedPopUpButtonMenu */
    NSMenu* buttonMenuCopy = [ self._nibBasedPopUpButtonMenu copy ];

    NSMenuItem* topItem = [ [ NSMenuItem alloc ] initWithTitle: @"" action: nil keyEquivalent: @"" ];
    [ topItem setImage: moofOneImage ];
    [ buttonMenuCopy insertItem: topItem atIndex: 0 ];

    NSRect templateFrame = [ self._popUpButtonsBoxPlaceholderUp frame ];
    self._codeBasedPopUpButtonDown = [ [ [ NSPopUpButton alloc ] initWithFrame: templateFrame pullsDown: self._isPullDownCheckBox.state ] autorelease ];
    [ [ self._codeBasedPopUpButtonDown cell ] setBezelStyle: NSSmallIconButtonBezelStyle ];
    [ [ self._codeBasedPopUpButtonDown cell ] setArrowPosition: NSPopUpArrowAtBottom ];
    [ [ self._codeBasedPopUpButtonDown cell ] setPreferredEdge: NSMinYEdge ];
    [ self._codeBasedPopUpButtonDown setMenu: buttonMenuCopy ];
    [ self._popUpButtonsBox addSubview: self._codeBasedPopUpButtonDown ];
    [ self._popUpButtonsBoxPlaceholderUp removeFromSuperview ];

    templateFrame = [ self._popUpButtonsBoxPlaceholderDown frame ];
    self._codeBasedPopUpButtonRight = [ [ [ NSPopUpButton alloc ] initWithFrame: templateFrame pullsDown: self._isPullDownCheckBox.state ] autorelease ];
    [ [ self._codeBasedPopUpButtonRight cell ] setBezelStyle: NSShadowlessSquareBezelStyle ];
    [ [ self._codeBasedPopUpButtonRight cell ] setArrowPosition: NSPopUpArrowAtBottom ];
    [ [ self._codeBasedPopUpButtonRight cell ] setPreferredEdge: NSMaxXEdge ];
    [ self._codeBasedPopUpButtonRight setMenu: buttonMenuCopy ];
    [ self._popUpButtonsBox addSubview: self._codeBasedPopUpButtonRight ];
    [ self._popUpButtonsBoxPlaceholderDown removeFromSuperview ];

    [ buttonMenuCopy release ];

    // ===================================================================
    // NSButton

    /* Create the bevel button */
    templateFrame = [ self._buttonsBoxPlaceholderUp frame ];
    self._codeBasedBevelButton = [ [ [ NSButton alloc ] initWithFrame: templateFrame ] autorelease ];
    /* NOTE: this button we want alternate title and image, so we need to call this: */
    [ self._codeBasedBevelButton setButtonType: NSMomentaryChangeButton ];
    [ self._codeBasedBevelButton setTitle: NSLocalizedString( @"NSButton", nil ) ];
    [ self._codeBasedBevelButton setAlternateTitle: NSLocalizedString( @"(pressed)", nil ) ];
    [ self._codeBasedBevelButton setImage: moofOneImage ];
    [ self._codeBasedBevelButton setAlternateImage: moofTwoImage ];

    [ self._codeBasedBevelButton setFont: [ NSFont systemFontOfSize: 10.f ] ];
    [ self._codeBasedBevelButton setBezelStyle: NSRegularSquareBezelStyle ];
    [ self._codeBasedBevelButton setImagePosition: NSImageLeft ];
    [ self._codeBasedBevelButton setSound: [ NSSound soundNamed: @"Pop" ] ];
    [ self._codeBasedBevelButton setAlignment: NSLeftTextAlignment ];
    [ self._codeBasedBevelButton setTarget: self ];
    [ self._codeBasedBevelButton setAction: @selector( buttonsActions: ) ];

    [ self._buttonsBox addSubview: self._codeBasedBevelButton ];
    [ self._buttonsBoxPlaceholderUp removeFromSuperview ];

    /* Create the sqaure button */
    templateFrame = [ self._buttonsBoxPlaceholderDown frame ];
    self._codeBasedSquareButton = [ [ [ NSButton alloc ] initWithFrame: templateFrame ] autorelease ];
    [ self._codeBasedSquareButton setButtonType: NSMomentaryChangeButton ];
    [ self._codeBasedSquareButton setTitle: NSLocalizedString( @"NSButton", nil ) ];
    [ self._codeBasedSquareButton setAlternateTitle: NSLocalizedString( @"(pressed)", nil ) ];
    [ self._codeBasedSquareButton setImage: moofOneImage ];
    [ self._codeBasedSquareButton setAlternateImage: moofTwoImage ];

    [ self._codeBasedSquareButton setFont: [ NSFont systemFontOfSize: 10.f ] ];
    [ self._codeBasedSquareButton setBezelStyle: NSShadowlessSquareBezelStyle ];
    [ self._codeBasedSquareButton setImagePosition: NSImageLeft ];
    [ self._codeBasedSquareButton setSound: [ NSSound soundNamed: @"Pop" ] ];
    [ self._codeBasedSquareButton setAlignment: NSLeftTextAlignment ];
    [ self._codeBasedSquareButton setTarget: self ];
    [ self._codeBasedSquareButton setAction: @selector( buttonsActions: ) ];

    [ self._buttonsBox addSubview: self._codeBasedSquareButton ];
    [ self._buttonsBoxPlaceholderDown removeFromSuperview ];

    // ===================================================================
    // NSSegmentedControl

    templateFrame = [ self._segmentedControlsBoxPlaceholder frame ];
    self._codeBasedSegmentedControl = [ [ [ NSSegmentedControl alloc ] initWithFrame: templateFrame ] autorelease ];

    [ self._codeBasedSegmentedControl setSegmentCount: 3 ];
    [ self._codeBasedSegmentedControl setSegmentStyle: NSSegmentStyleTexturedRounded ];
    [ self._codeBasedSegmentedControl setFont: [ NSFont systemFontOfSize: 10.f ] ];
    [ self._codeBasedSegmentedControl setTarget: self ];
    [ self._codeBasedSegmentedControl setAction: @selector( segmentsAction: ) ];

    [ self._codeBasedSegmentedControl setLabel: NSLocalizedString( @"One", nil ) forSegment: 0 ];
    [ self._codeBasedSegmentedControl setLabel: NSLocalizedString( @"Two", nil ) forSegment: 1 ];
    [ self._codeBasedSegmentedControl setLabel: NSLocalizedString( @"Three", nil ) forSegment: 2 ];

    [ self._codeBasedSegmentedControl setWidth: [ self._nibBasedSegmentedControl widthForSegment: 0 ] forSegment: 0 ];
    [ self._codeBasedSegmentedControl setWidth: [ self._nibBasedSegmentedControl widthForSegment: 1 ] forSegment: 1 ];
    [ self._codeBasedSegmentedControl setWidth: [ self._nibBasedSegmentedControl widthForSegment: 2 ] forSegment: 2 ];

    [ [ self._codeBasedSegmentedControl cell ] setTrackingMode: NSSegmentSwitchTrackingSelectAny ];
    [ [ self._codeBasedSegmentedControl cell ] setTag: BMOne forSegment: 0 ];
    [ [ self._codeBasedSegmentedControl cell ] setTag: BMTwo forSegment: 1 ];
    [ [ self._codeBasedSegmentedControl cell ] setTag: BMThree forSegment: 2 ];

    NSImage* imageOne = [ NSImage imageNamed: NSImageNameComputer ];
    NSImage* imageTwo = [ NSImage imageNamed: NSImageNameFolderSmart ];
    NSImage* imageThree = [ NSImage imageNamed: NSImageNameBonjour ];

    [ imageOne setSize: NSMakeSize( 16, 16 ) ];
    [ imageTwo setSize: NSMakeSize( 16, 16 ) ];
    [ imageThree setSize: NSMakeSize( 16, 16 ) ];

    [ self._nibBasedSegmentedControl setImage: imageOne forSegment: 0 ];
    [ self._nibBasedSegmentedControl setImage: imageTwo forSegment: 1 ];
    [ self._nibBasedSegmentedControl setImage: imageThree forSegment: 2 ];

    [ self._codeBasedSegmentedControl setImage: imageOne forSegment: 0 ];
    [ self._codeBasedSegmentedControl setImage: imageTwo forSegment: 1 ];
    [ self._codeBasedSegmentedControl setImage: imageThree forSegment: 2 ];

    NSDictionary* nibBasedSegmentedControlStates = [ USER_DEFAULTS dictionaryForKey: BMDefaultsKeyNibBasedSegmentedControlState ];
    NSDictionary* codeBasedSegmentedControlStates = [ USER_DEFAULTS dictionaryForKey: BMDefaultsKeyCodeBasedSegmentedControlState ];
    for ( int index = 0; index < self._nibBasedSegmentedControl.segmentCount; index++ )
        {
        [ self._nibBasedSegmentedControl setSelected: [ [ nibBasedSegmentedControlStates objectForKey: [ NSString stringWithFormat: @"%d", index ] ] boolValue ] forSegment: index ];
        [ self._codeBasedSegmentedControl setSelected: [ [ codeBasedSegmentedControlStates objectForKey: [ NSString stringWithFormat: @"%d", index ] ] boolValue ] forSegment: index ];
        }

    [ self._segmentedControlsBox addSubview: self._codeBasedSegmentedControl ];
    [ self._segmentedControlsBoxPlaceholder removeFromSuperview ];

    // ===================================================================
    // NSMatrix

    NSButtonCell* prototypeRadioCell = [ [ [ NSButtonCell alloc ] init ] autorelease ];
    [ prototypeRadioCell setButtonType: NSRadioButton ];
    [ prototypeRadioCell setTitle: NSLocalizedString( @"RadioCell", nil ) ];
    [ prototypeRadioCell setControlSize: NSSmallControlSize ];
    [ prototypeRadioCell setFont: [ [ self._nibBasedMatrix cellAtRow: 0 column: 0 ] font ] ];

    /* Create the NSMatrix */
    templateFrame = [ self._matrixesBoxPlaceholder frame ];
    self._codeBasedMatrix = [ [ [ NSMatrix alloc ] initWithFrame: templateFrame
                                                            mode: NSRadioModeMatrix
                                                       prototype: prototypeRadioCell
                                                    numberOfRows: 2
                                                 numberOfColumns: 1 ] autorelease ];

    [ self._nibBasedMatrix selectCellAtRow: [ [ USER_DEFAULTS arrayForKey: BMDefaultsKeyNibBasedSelectedRadio ].firstObject integerValue ]
                                    column: [ [ USER_DEFAULTS arrayForKey: BMDefaultsKeyNibBasedSelectedRadio ].lastObject integerValue ] ];

    [ self._codeBasedMatrix selectCellAtRow: [ [ USER_DEFAULTS arrayForKey: BMDefaultsKeyCodeBasedSelectedRadio ].firstObject integerValue ]
                                     column: [ [ USER_DEFAULTS arrayForKey: BMDefaultsKeyCodeBasedSelectedRadio ].lastObject integerValue ] ];

    [ [ self._codeBasedMatrix cellAtRow: 0 column: 0 ] setTitle: NSLocalizedString( @"Radio 1", nil ) ];
    [ [ self._codeBasedMatrix cellAtRow: 1 column: 0 ] setTitle: NSLocalizedString( @"Radio 2", nil ) ];

    [ self._codeBasedMatrix setTarget: self ];
    [ self._codeBasedMatrix setAction: @selector( changedRadio: ) ];

    [ self._matrixesBox addSubview: self._codeBasedMatrix ];
    [ self._matrixesBoxPlaceholder removeFromSuperview ];

    // ===================================================================
    // NSColorWell

    templateFrame = [ self._colorWellsPlaceholder frame ];
    self._codeBasedColorWell = [ [ [ NSColorWell alloc ] initWithFrame: templateFrame ] autorelease ];

    CGFloat nibBasedColorWellRed = [ [ [ USER_DEFAULTS dictionaryForKey: BMDefaultsKeyNibBasedColorWellColorState ][ NSCalibratedRGBColorSpace ] objectAtIndex: 0 ] doubleValue ];
    CGFloat nibBasedColorWellGreen = [ [ [ USER_DEFAULTS dictionaryForKey: BMDefaultsKeyNibBasedColorWellColorState ][ NSCalibratedRGBColorSpace ] objectAtIndex: 1 ] doubleValue ];
    CGFloat nibBasedColorWellBlue = [ [ [ USER_DEFAULTS dictionaryForKey: BMDefaultsKeyNibBasedColorWellColorState ][ NSCalibratedRGBColorSpace ] objectAtIndex: 2 ] doubleValue ];
    CGFloat nibBasedColorWellAlpha = [ [ [ USER_DEFAULTS dictionaryForKey: BMDefaultsKeyNibBasedColorWellColorState ][ NSCalibratedRGBColorSpace ] objectAtIndex: 3 ] doubleValue ];

    CGFloat codeBasedColorWellRed = [ [ [ USER_DEFAULTS dictionaryForKey: BMDefaultsKeyCodeBasedColorWellColorState ][ NSCalibratedRGBColorSpace ] objectAtIndex: 0 ] doubleValue ];
    CGFloat codeBasedColorWellGreen = [ [ [ USER_DEFAULTS dictionaryForKey: BMDefaultsKeyCodeBasedColorWellColorState ][ NSCalibratedRGBColorSpace ] objectAtIndex: 1 ] doubleValue ];
    CGFloat codeBasedColorWellBlue = [ [ [ USER_DEFAULTS dictionaryForKey: BMDefaultsKeyCodeBasedColorWellColorState ][ NSCalibratedRGBColorSpace ] objectAtIndex: 2 ] doubleValue ];
    CGFloat codeBasedColorWellAlpha = [ [ [ USER_DEFAULTS dictionaryForKey: BMDefaultsKeyCodeBasedColorWellColorState ][ NSCalibratedRGBColorSpace ] objectAtIndex: 3 ] doubleValue ];

    [ self._nibBasedColorWell setColor: [ NSColor colorWithCalibratedRed: nibBasedColorWellRed
                                                                   green: nibBasedColorWellGreen
                                                                    blue: nibBasedColorWellBlue
                                                                   alpha: nibBasedColorWellAlpha ] ];

    [ self._codeBasedColorWell setColor: [ NSColor colorWithCalibratedRed: codeBasedColorWellRed
                                                                    green: codeBasedColorWellGreen
                                                                     blue: codeBasedColorWellBlue
                                                                    alpha: codeBasedColorWellAlpha ] ];
    [ self._colorWellsBox addSubview: self._codeBasedColorWell ];

    [ self._codeBasedColorWell setTarget: self ];
    [ self._codeBasedColorWell setAction: @selector( colorWellAction: ) ];
    }

#pragma mark The action methods for all the buttons
// Action methods for the controls that reside in NSPopUpButton box
- ( IBAction ) changedIsPullDown: ( id )_Sender
    {
    [ USER_DEFAULTS setBool: self._isPullDownCheckBox.state forKey: BMDefaultsKeyIsPullDown ];
    }

- ( IBAction ) popupAction: ( id )_Sender
    {

    }

// Action methods for the controls that reside in NSButton box
- ( IBAction ) changedUsesIcon: ( id )_Sender
    {
    [ USER_DEFAULTS setBool: self._usesIconCheckBox.state forKey: BMDefaultsKeyUsesIcon ];
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
    [ self _saveCurrentSegmentedControlState ];
    }

- ( IBAction ) unselectorAction: ( id )_Sender
    {
    [ self._nibBasedSegmentedControl unselectAllSegments ];
    [ self._codeBasedSegmentedControl unselectAllSegments ];

    [ self _saveCurrentSegmentedControlState ];
    }

- ( void ) _saveCurrentSegmentedControlState
    {
    NSDictionary* currentNibBasedSegControlStates = @{ @"0" : [ NSNumber numberWithBool: [ self._nibBasedSegmentedControl.cell isSelectedForSegment: 0 ] ]
                                                     , @"1" : [ NSNumber numberWithBool: [ self._nibBasedSegmentedControl.cell isSelectedForSegment: 1 ] ]
                                                     , @"2" : [ NSNumber numberWithBool: [ self._nibBasedSegmentedControl.cell isSelectedForSegment: 2 ] ]
                                                     };

    NSDictionary* currentCodeBasedSegControlStates = @{ @"0" : [ NSNumber numberWithBool: [ self._codeBasedSegmentedControl.cell isSelectedForSegment: 0 ] ]
                                                      , @"1" : [ NSNumber numberWithBool: [ self._codeBasedSegmentedControl.cell isSelectedForSegment: 1 ] ]
                                                      , @"2" : [ NSNumber numberWithBool: [ self._codeBasedSegmentedControl.cell isSelectedForSegment: 2 ] ]
                                                      };

    [ USER_DEFAULTS setObject: currentNibBasedSegControlStates forKey: BMDefaultsKeyNibBasedSegmentedControlState ];
    [ USER_DEFAULTS setObject: currentCodeBasedSegControlStates forKey: BMDefaultsKeyCodeBasedSegmentedControlState ];
    }

// Action methods for the controls that reside in NSMatrix box
- ( IBAction ) changedRadio: ( id )_Sender
    {
    [ USER_DEFAULTS setObject: @[ [ NSNumber numberWithInteger: self._nibBasedMatrix.selectedRow ]
                                , [ NSNumber numberWithInteger: self._nibBasedMatrix.selectedColumn ] ]
                       forKey: BMDefaultsKeyNibBasedSelectedRadio ];

    [ USER_DEFAULTS setObject: @[ [ NSNumber numberWithInteger: self._codeBasedMatrix.selectedRow ]
                                , [ NSNumber numberWithInteger: self._codeBasedMatrix.selectedColumn ] ]
                       forKey: BMDefaultsKeyCodeBasedSelectedRadio ];
    }

// Action methods for the controls that reside in NSColorWell box
- ( IBAction ) colorWellAction: ( id )_Sender
    {
    NSColor* newColor = [ ( NSColorWell* )_Sender color ];

    NSLog( @"%@", [ newColor colorSpaceName ] );
    if ( _Sender == self._nibBasedColorWell )
        {
        [ USER_DEFAULTS setObject: @{ newColor.colorSpaceName : @[ [ NSNumber numberWithFloat: newColor.redComponent ]
                                                                 , [ NSNumber numberWithFloat: newColor.greenComponent ]
                                                                 , [ NSNumber numberWithFloat: newColor.blueComponent ]
                                                                 , [ NSNumber numberWithFloat: newColor.alphaComponent ]
                                                                 ] }
                        forKey: BMDefaultsKeyNibBasedColorWellColorState ];
        }
    else if ( _Sender == self._codeBasedColorWell )
        {
        [ USER_DEFAULTS setObject: @{ newColor.colorSpaceName : @[ [ NSNumber numberWithFloat: newColor.redComponent ]
                                                                 , [ NSNumber numberWithFloat: newColor.greenComponent ]
                                                                 , [ NSNumber numberWithFloat: newColor.blueComponent ]
                                                                 , [ NSNumber numberWithFloat: newColor.alphaComponent ]
                                                                 ] }
                        forKey: BMDefaultsKeyCodeBasedColorWellColorState ];
        }
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