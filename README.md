# GMBN YouTube Browser

## Description

An iPhone application for browsing all the videos from the [GMBN YouTube channel](https://www.youtube.com/c/gmbn).  Videos are presented in ascending date order.  Scrolling to the bottom of the list causes the next page of results to load.  Tapping on a video shows a detail view with a player and more information.

Supports iOS 15 and later.

## Getting Started

1. Open src/GMBN Browser/GMBN Browser.xcodeproj in xcode.
2. Go to File -> Packages -> Resolve Package Versions.
3. Set your YouTube API key in `ApiKeys.youTube`.
4. Press the play button.

## Running The Tests

1. Open src/GMBN Browser/GMBN Browser.xcodeproj in xcode.
2. Go to File -> Packages -> Resolve Package Versions
3. Select Product -> Test from the xcode menu.

## Implementation

* The app is architected according to the MVVM pattern.
* The view layer is implemented in SwiftUI.
* All asynchronous operations are modelled using the Combine framework.
* Dependency injection is used to keep code SOLID and testable.
* [Dip](https://github.com/AliSoftware/Dip) is used for the DI container.
* [Moya](https://github.com/Moya/Moya) is used for type-safe REST API access.
* [YouTubePlayerKit](https://github.com/SvenTiigi/YouTubePlayerKit) is used to play the YouTube videos.
* Swift Package Manager is used to manage third-party dependencies.