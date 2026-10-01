import 'package:flutter/material.dart';

class UserInfo({
  required final String avatarUrl,
  required final String firstName,
  required final String lastName,
  required final String email,
  required final String phone,
});

class const AppRoot({super.key, required final UserInfo userInfo})
    extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return UserProfileScreen(userInfo: userInfo);
  }
}

class const UserProfileScreen({super.key, required final UserInfo userInfo})
    extends StatelessWidget {
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

class const ProfileCard({super.key, required final UserInfo userInfo})
    extends StatelessWidget {
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

class const NavigatorExample({super.key, required final UserInfo userInfo})
    extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Navigator(
      /* ??? How do we pass the userInfo to the next screen? */
    );
  }
}

class const MyApp({super.key}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = ThemeData.light();

    return MaterialApp(
      theme: theme,
      home: Scaffold(
        backgroundColor: theme.scaffoldBackgroundColor,
        body: const Center(child: Text('Hello World!')),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          foregroundColor: theme.floatingActionButtonTheme.foregroundColor,
          backgroundColor: theme.floatingActionButtonTheme.backgroundColor,
        ),
      ),
    );
  }
}
