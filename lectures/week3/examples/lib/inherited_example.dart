import 'package:flutter/material.dart';

class const UserInfoProvider({
  super.key,
  required final UserInfo userInfo,
  required super.child,
}) extends InheritedWidget {
  static UserInfo of(BuildContext context) {
    final provider = context
        .dependOnInheritedWidgetOfExactType<UserInfoProvider>();
    return provider!.userInfo;
  }

  @override
  bool updateShouldNotify(UserInfoProvider oldWidget) {
    return userInfo != oldWidget.userInfo;
  }
}

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
    return UserInfoProvider(
      userInfo: userInfo,
      child: const UserProfileScreen(),
    );
  }
}

class const UserProfileScreen({super.key}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userInfo = UserInfoProvider.of(context);
    return Scaffold(
      body: ListView(
        children: [
          const ProfileCard(),
          Text('Email: ${userInfo.email}'),
          Text('Phone: ${userInfo.phone}'),
        ],
      ),
    );
  }
}

class const ProfileCard({super.key}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userInfo = UserInfoProvider.of(context);
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
