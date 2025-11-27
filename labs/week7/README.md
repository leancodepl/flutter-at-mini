# Lab 7 – Firebase

> ⚠️ ***Formatting & analysis***
>
> To get full marks for the task, your code must be properly formatted and
> must not produce any analysis issues. That is, running the following
> commands in the week's directory must not report any issues or changes:
>
> ```shell
> dart format --output=none --set-exit-if-changed .
> flutter analyze
> ```

Check out the [hosted example solution](https://flutter-at-mini-2025-lab-7.web.app/)
to play around with the implemented features.

## Project setup

> ⚠️ ***Platform support***
>
> Firebase supports several platforms, but to avoid having to deal with 
> native setup, consider building for the web platform.

To use Firebase services in the app, you have to setup the configuration for
the app, as per the [official Firebase setup][firebase-setup].

1. Install and login to the [Firebase CLI][firebase-cli]. Use any Google 
   account you want.
   ```shell
   firebase login
   ```

2. Install the FlutterFire CLI
   ```shell
   dart pub global activate flutterfire_cli
   ```

3. In the [Firebase console][firebase-console], create a project for your app.

   _(Disable analytics, we won't be needing this)_

4. Configure your Flutter app. Select the project you created and the
   platform you'll support.

   ***If the CLI asks to reuse an existing configuration, select `no`***.

   ```shell
   flutterfire configure
   ```

   After this step, a `firebase_options.dart` file should be generated.

5. Initialize Firebase from Dart.
   In `main.dart`, inside `_AppState`, use the generated options and
   `Firebase.initializeApp` to start the initialization.

6. Run the app to check if Firebase gets initialized properly.

[firebase-setup]: https://firebase.google.com/docs/flutter/setup?platform=web
[firebase-cli]: https://firebase.google.com/docs/cli#setup_update_cli
[firebase-console]: https://console.firebase.google.com/

## Auth

### Setup

1. In the Firebase console, go to `Build → Authentication`

2. Click `Get started` and enable the Email/Password provider

### `AuthService` implementation

*Note that the service already has some (basic) error handling implemented.*

- `signInWithEmail` – Log the user in with the provided email and password.
  Make sure the user is not already logged in (log out if necessary).
  Return `SignInResult.success` when the operation was successful.

- `signUpWithEmail` – Create a new account using the provided credentials.
  Return whether the operation was successful.

- `signOut` – Sign the user out of the app.

- `isSignedIn`, `isSignedInStream`, `userEmail`, `currentUser` – Getters for
  some common auth state properties.

## Firestore

We'll store user's items (`UserItem`) in Firestore. Items should be 
user-specific – i.e., each user should have a separate collection of items. 
For example, the items can be stored in documents like ***`items/{userID}`***.

### Setup

1. In the Firebase console, go to `Build → Firestore Database`

2. Click `Create database`

3. Configure the database.

   You can leave the default config or change the location to Europe.

   For now, make sure you ***Start in test mode***.

### `UserItemsService` implementation

`UserItem` is JSON-serializable; you can use this as the representation in the
database.

- `itemsStream` – A stream containing lists of current items. Should update in
  real time.

- `addItem` – Add a new item to the user's collection. This change should be
  immediately visible to the user.
