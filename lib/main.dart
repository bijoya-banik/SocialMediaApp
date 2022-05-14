import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:social/controller/logger/logger_controller.dart';
import 'package:social/services/navigation_service.dart';
import 'package:social/views/screens/startup/splash_screen.dart';
import 'package:social/views/styles/k_colors.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialize();
  // NotificationService().firebaseInitialization();
  runApp(ProviderScope(observers: [Logger()], child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: KColor.white,
      statusBarIconBrightness: Brightness.dark,
    ));
    return MaterialApp(
      title: 'Social',
      debugShowCheckedModeBanner: false,
      navigatorKey: NavigationService.navigatorKey,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        pageTransitionsTheme: PageTransitionsTheme(builders: {
          TargetPlatform.android: CupertinoPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        }),
        primaryColor: KColor.primary,
        // accentColor: KColor.primary,
        textTheme: Typography.material2018().black,
        backgroundColor: KColor.white,
        scaffoldBackgroundColor: KColor.white,
      ),
      builder: (context, child) {
        return CupertinoTheme(data: const CupertinoThemeData(), child: Material(child: child));
      },
      home: SplashScreen(),
    );
  }
}
