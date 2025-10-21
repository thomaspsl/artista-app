import 'package:artista/layouts/app/app_content.dart';
import 'package:artista/managers/user_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<UserManager>(create: (context) => UserManager()),
      ],
      child: AppContent(content: child),
    );
  }
}
