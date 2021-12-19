# GMBN YouTube Browser

## Description

An iPhone application for browsing all the videos from the [GMBN YouTube channel](https://www.youtube.com/c/gmbn).  Videos are presented in ascending date order.  Scrolling to the bottom of the list causes the next page of results to be loaded.  Tapping on a video shows a detail view with more information about the selected video.

Supports iOS 15 and later.

## Getting Started

1. Open src/GMBN Browser/GMBN Browser.xcodeproj in xcode.
2. Press the play button.

## Running The Tests

1. Open src/GMBN Browser/GMBN Browser.xcodeproj in xcode.
2. Select Product -> Test from the xcode menu.

## Implementation

The app is architected according to the MVVM pattern.  The view layer is implemented in SwiftUI.  All asynchronous operations are modelled using the Combine framework.  Dependency injection is used to keep code SOLID and testable.  Dependencies are provided through constructor chaining.