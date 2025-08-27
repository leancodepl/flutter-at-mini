import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:week4/app_theme.dart';
import 'package:week4/favorite_books.dart';

class GlobalProviders extends StatelessWidget {
  const GlobalProviders({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AppTheme()),
        ChangeNotifierProvider(create: (context) => FavoriteBooks()),
      ],
      child: child,
    );
  }
}
