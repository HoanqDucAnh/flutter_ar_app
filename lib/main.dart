import 'package:flutter/material.dart';
import 'core/initializer/initializer.dart';

import 'shared/shared.dart';
import 'core/router/router.dart';
import 'src/view/view.dart';
import 'src/view/shared_widget/shared_widget.dart';

void main() {
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: getIt<AppTheme>().themeData,
      routerConfig: getIt<AppRouter>().config(),
    );
  }
}
