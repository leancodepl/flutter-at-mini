# How to install Flutter

## Flutter

1. Download [Flutter for Windows](https://docs.flutter.dev/get-started/install/windows) from flutter.dev
2. Unpack Flutter to `D:\VM\(your username)\flutter`
3. Ensure that Flutter is exactly in that path and you don't have any intermediate directory like
   `flutter_windows_(version)-stable`. The Flutter binary should be in
   `D:\VM\(username)\flutter\bin\flutter`.
4. Add Flutter to PATH env variable by opening the "Edit environment variables for your account"
   (enter the string in Start menu search and you should have it; in Polish: "Edytuj zmienne
   środowiskowe konta" or sth like that) and then adding `D:\VM\(username)\flutter\bin` to `PATH`
   entries.
5. Sign out and sign in.
6. Open shell (either cmd or PowerShell) and type `flutter doctor`. Ensure that the command runs and
   prints correct output (it should mostly pass, apart from Android part).

## Android development w/ Android Studio

Unfortunately, the installed Android Studio is ancient. We need newer version.

1. Download [Android Studio](https://developer.android.com/studio#downloads) as a ZIP.
2. Unpack it to `D:\VM\(username)\android-studio` and ensure that there are no intermediate
   directories there.
3. Run `D:\VM\(username)\android-studio\bin\studio64.exe`
4. Now, open Android SDK Manager from within Android Studio and install:
   a) Android SDK 33,
   b) Android 33 Emulator for x86_64,
   c) cmdline-tools (latest),
5. Create a new emulator device,
6. Tell Flutter to use the freshly installed Android Studio: `flutter config --android-studio-dir=D:\VM\(username)\android-studio`
7. Accept licenses `flutter doctor --android-licenses` (will require multiple confirmations),
8. Run `flutter doctor` to confirm that everything is OK (all checks should pass now).

## VSCode

1. Open the preinstalled VS Code (it is fresh enough ;) ).
2. Install [Flutter extension](https://marketplace.visualstudio.com/items?itemName=Dart-Code.flutter)
   with `https://marketplace.visualstudio.com/items?itemName=Dart-Code.flutter`.
3. Create new project and start coding!

## Things to remember

If you used that way of installing Flutter, remember to always sit on the same machine otherwise
you will need to go through this again. The `D` disk is not roaming with you. 
