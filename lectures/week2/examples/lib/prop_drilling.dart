import 'package:flutter/material.dart';

class UserInfo {
  UserInfo({
    required this.avatarUrl,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
  });

  final String avatarUrl;
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
}

class AppRoot extends StatelessWidget {
  const AppRoot({super.key, required this.userInfo});

  final UserInfo userInfo;

  @override
  Widget build(BuildContext context) {
    return UserProfileScreen(userInfo: userInfo);
  }
}

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key, required this.userInfo});

  final UserInfo userInfo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          ProfileCard(userInfo: userInfo),
          Text('Email: ${userInfo.email}'),
          Text('Phone: ${userInfo.phone}'),
        ],
      ),
    );
  }
}

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key, required this.userInfo});

  final UserInfo userInfo;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Image.network(userInfo.avatarUrl),
          Text('${userInfo.firstName} ${userInfo.lastName}'),
        ],
      ),
    );
  }
}

class NavigatorExample extends StatelessWidget {
  const NavigatorExample({super.key, required this.userInfo});

  final UserInfo userInfo;

  @override
  Widget build(BuildContext context) {
    return Navigator(
      /* ??? How do we pass the userInfo to the next screen? */
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = ThemeData.light();

    return MaterialApp(
      theme: theme,
      home: Scaffold(
        backgroundColor: theme.scaffoldBackgroundColor,
        body: Center(child: Text('Hello World!')),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          foregroundColor: theme.floatingActionButtonTheme.foregroundColor,
          backgroundColor: theme.floatingActionButtonTheme.backgroundColor,
        ),
      ),
    );
  }
}
