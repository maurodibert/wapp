
# Wagr App
An application for fetching games and betting with friends.

![demo](assets/gifs/wapp_scrolling.gif)
![demo](assets/gifs/wapp_custom_animation.gif)


## :pencil: How to Use 
**Step 1:**
Download or clone this repo by using the link below:

```
https://github.com/maurodibert/wapp.git
```
**Step 2:**
Go to project root and execute the following command in console to get the required dependencies: 
```
flutter pub get 
```
**Step 3:**
Run the app
```
flutter run
```
**APK:**
Just download and run in device
```
final_builds/app-release.apk
```

## :wrench: Libraries & Tools
* Get It, for dependency injection
* ImIcons to make icons creation easier
* Intl for Date formatting
* Flutter HTML for rich HTML text

## :mag: Structure
With the separation of concerns in mind, I've built the application applying an MVVM architectural pattern, following the next folder structure:
```
lib
└── core
    └── helpers
    └── models
    └── services
    constants
└── ui
    └── library: reusable components
    └── screens
        └── views: particular UI
        screen: UI
        viewModel: logic

```
At the same time, the code is categorized to make the maintenance easier and pleasurable; 
from scratch, perhaps, could be a little bit cumbersome for an app this small, but as soon as it gets bigger
will make for devs, life much more comfortable. 

## :gift: Features
* Week calculator
* Double synced scrolling
* Custom fonts
* Custom icons

## :point_up: Decisions and Considerations
**Toggle/Tasks**: I've decided to separate the process into three main stages: Basics (everything in the model but the congratulations screen), Scrolling, and Congratulations Screen, to achieve the demands first and then having time for the most creative part.

**Congratulations Screen/ Celebration Page**: the strategy is to go for AnimatedContainer and AnimatedPosition to create a beautiful screen with animations and resembling more what Wagr looks like.

**Change the way days are displayed in tab**: I think when a person one to know about what's happening specifically in the week, he/she is in, having number instead of weekdays has no sense, so I've created a week programmatically from the first fetched day.

**Timezones**: Since it's a particular subject that is super relative to the business decisions I've decided to just have the local zone display in that way.

## :thinking: Doubts
- How to display spreads
- How to hide bottom android navigation bar
