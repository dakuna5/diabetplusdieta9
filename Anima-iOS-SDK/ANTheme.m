//
//  ANTheme.m
//  Anima-iOS-SDK
//
//  Created by Avishay Cohen on 10/08/2016.
//  Copyright © 2016 AnimaApp.com. All rights reserved.
//

#import "ANTheme.h"

static ANTheme *currentTheme;

@implementation ANTheme

+ (ANTheme *)currentTheme {
    return currentTheme;
}

- (void)apply {
    [self applyNavBar];
    [self applyTabBar];
}

- (void)applyNavBar {
    [[UINavigationBar appearance] setTintColor:self.navBarButtonsColor];
    [[UINavigationBar appearance] setBarTintColor:self.navBarColor];
    [[UINavigationBar appearance] setTranslucent:self.navBarIsTranslucent];
    NSMutableDictionary *attributes = [NSMutableDictionary new];
    if (self.navBarTitleColor) {
        attributes[NSForegroundColorAttributeName] = self.navBarTitleColor;
    }
    if (self.navBarTitleFontName) {
        UIFont *titleFont = [UIFont fontWithName:self.navBarTitleFontName size:self.navBarTitleFontSize];
        attributes[NSFontAttributeName] = titleFont;
    }
    [[UINavigationBar appearance] setTitleTextAttributes:attributes];
    currentTheme = self;
}

- (void)applyTabBar {
    if (self.tabBarColor) {
        [[UITabBar appearance] setBarTintColor:self.tabBarColor];
    }
    if (self.tabBarSelectedButtonsColor) {
        [[UITabBar appearance] setTintColor:self.tabBarSelectedButtonsColor];
        NSDictionary *attributes = @{ NSForegroundColorAttributeName : self.tabBarSelectedButtonsColor };
        [UITabBarItem.appearance setTitleTextAttributes:attributes
                                               forState:UIControlStateSelected];
    }
    if (self.tabBarUnselectedButtonsTitleColor) {
        NSDictionary *attributes = @{ NSForegroundColorAttributeName : self.tabBarUnselectedButtonsTitleColor };
        [UITabBarItem.appearance setTitleTextAttributes:attributes
                                               forState:UIControlStateNormal];
    }
    [[UITabBar appearance] setTranslucent:self.tabBarIsTranslucent];

}

@end
