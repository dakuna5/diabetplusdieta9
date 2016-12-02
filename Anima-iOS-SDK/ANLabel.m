//
//  ANLabel.m
//  Anima-iOS-SDK
//
//  Created by Avishay Cohen on 18/10/2016.
//  Copyright © 2016 AnimaApp.com. All rights reserved.
//

#import "ANLabel.h"

@implementation ANLabel

- (void)drawRect:(CGRect)rect {
#if TARGET_INTERFACE_BUILDER
    [super setAttributedText:[self attributedStringWithSpacingForText:text]];
#endif
    [super drawRect:rect];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    if (!self.attributedText) {
        [self updateTextIfAttributed];
    }
}

#pragma mark - attributedString

- (NSAttributedString *)attributedStringWithSpacingForText:(NSString *)text {
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    [style setAlignment:self.textAlignment];
    style.maximumLineHeight = style.minimumLineHeight = self.lineHeight;
    style.paragraphSpacing = self.paragraphSpacing;
    NSDictionary *attributes = @{
                                 NSForegroundColorAttributeName:self.textColor,
                                 NSParagraphStyleAttributeName:style,
                                 NSFontAttributeName: self.font,
                                 NSKernAttributeName: @(self.letterSpacing),
                                 };
    NSAttributedString *attributedString = [[NSAttributedString alloc] initWithString:text ?: @"" attributes:attributes];
    return attributedString;
}

- (BOOL)attributedTextRequired {
    return self.lineHeight != 0 || self.letterSpacing != 0 || self.paragraphSpacing != 0;
}

- (void)updateTextIfAttributed {
    if ([self attributedTextRequired]) {
        self.text = self.text;
    }
}

#pragma mark - text property

- (NSString *)text {
    return super.text ?: super.attributedText.string;
}

- (void)setText:(NSString *)text {
    if ([self attributedTextRequired]) {
        [super setAttributedText:[self attributedStringWithSpacingForText:text]];
    }
    else {
        [super setText:text];
    }
}

#pragma mark - updateTextIfAttributed triggers

- (void)setLetterSpacing:(float)letterSpacing {
    _letterSpacing = letterSpacing;
    [self updateTextIfAttributed];
}

- (void)setLineHeight:(NSUInteger)lineHeight {
    _lineHeight = lineHeight;
    [self updateTextIfAttributed];
}

- (void)setParagraphSpacing:(float)paragraphSpacing {
    _paragraphSpacing = paragraphSpacing;
    [self updateTextIfAttributed];
}

- (void)setFont:(UIFont *)font {
    [super setFont:font];
    [self updateTextIfAttributed];
}

- (void)setTextColor:(UIColor *)textColor {
    [super setTextColor:textColor];
    [self updateTextIfAttributed];
}

@end
