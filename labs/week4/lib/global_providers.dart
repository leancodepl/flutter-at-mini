import 'package:flutter/material.dart';
import 'package:labs_week4/app_theme.dart';
import 'package:labs_week4/favorite_books.dart';
import 'package:provider/provider.dart';

class const GlobalProviders({super.key, required final Widget child})
    extends StatelessWidget {
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
