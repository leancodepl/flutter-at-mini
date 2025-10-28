import 'package:flutter/material.dart';

class UserInfoProvider extends InheritedWidget {
  const UserInfoProvider({
    super.key,
    required this.userInfo,
    required super.child,
  });

  final UserInfo userInfo;

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
    return UserInfoProvider(userInfo: userInfo, child: UserProfileScreen());
  }
}

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userInfo = UserInfoProvider.of(context);
    return Scaffold(
      body: ListView(
        children: [
          ProfileCard(),
          Text('Email: ${userInfo.email}'),
          Text('Phone: ${userInfo.phone}'),
        ],
      ),
    );
  }
}

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

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
