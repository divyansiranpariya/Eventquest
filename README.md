# EventQuest

   EventQuest is a Flutter application that allows users to explore and sharing various festivals and quotes.
   
  For Mobile : https://github.com/divyansiranpariya/Eventquest

## Description

EventQuest provides users with a platform to discover and share information about different festivals and quotes.Loginpage provides users with a simple and intuitive interface to enter their email and password for authentication. If the provided credentials are incorrect, an error message is displayed, prompting users to try again  Users can browse through religious and general festivals, view festival details, and even create posts.it provides users with a platform to customize and edit festival posts.


## Folder Structure

 * Here is the core folder structure which flutter provides.
   ```
   flutter-app/ |- android |- build |- ios |- lib |- test
   ```

* Here is the folder structure we have been using in this project

 ```
 lib/ 
|- Screens/ 
|- utilities/ 
|- main.dart
 ```

## Screens
* This directory view all the screen of the application together in one place. A separate file is created for each type as shown in example below:
 ```
 Screens/
|- splace_screen.dart
|- login.dart
|- festhomepage.dart
|- festivald_detailpage.dart
|- festedit.dart
|- Favourite_page.dart
```

## utils
```
|- all_data.dart
|- color.dart
|- global.dart
|- quote.dart
|- textstayling.dart
```

## Features
* **User Authentication:** Authenticate users based on their email and password.
* **Password Security:** Hide password input for security.
* **Profile Management:** Users can manage their profiles by uploading images and updating personal information.
* **Favorites:** Save your favorite festivals for quick access.
* **Text Customization:** Customize text properties including font style, size, weight, and color.
* **Text Positioning:** Adjust the position of text within the post image.
* **Share Functionality:** Share the edited festival post with others.

## Dependencies

* image_picker: Used for capturing images from the device camera or gallery.
* clipboard: Used for accessing and modifying the device's clipboard.
* google_fonts: Provides access to a wide range of Google Fonts for text customization.
* path_provider: Allows access to the device's file system for saving images.
* share_extend: Facilitates sharing of content across different platforms.


## Screenshorts

![evennt1](https://github.com/divyansiranpariya/Eventquest/assets/154776848/31e4e888-2fe1-46f9-b210-75fa1af48552)
![event2 (1)](https://github.com/divyansiranpariya/Eventquest/assets/154776848/f942bc08-5e0f-41a1-901a-17b7df767154)
![event3](https://github.com/divyansiranpariya/Eventquest/assets/154776848/f34a9646-51d5-419c-8a0d-9ac59a104c1b)
![event5](https://github.com/divyansiranpariya/Eventquest/assets/154776848/fd00049a-7118-4c15-9d6d-5ec441041743)
![event4](https://github.com/divyansiranpariya/Eventquest/assets/154776848/336e8ca5-f6b4-4ade-b16a-4852a5c090c4)
![event6](https://github.com/divyansiranpariya/Eventquest/assets/154776848/20644d4c-8e8f-4237-9915-2a5f48d8548f)
![event7](https://github.com/divyansiranpariya/Eventquest/assets/154776848/abf2acd7-dfc5-4a5e-80dc-b974fad55800)
![event8](https://github.com/divyansiranpariya/Eventquest/assets/154776848/974e5ea9-cc81-4e67-889a-ae98e7eb9c68)


