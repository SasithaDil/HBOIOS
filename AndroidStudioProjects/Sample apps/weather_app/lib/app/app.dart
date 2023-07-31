import 'package:flutter/material.dart';
import 'package:test/routes/routes.dart' as router;

class App extends StatefulWidget {
  const App({super.key});  

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Title',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: router.Router.generateRoute,
      initialRoute: router.ScreenRoutes.toSplashScreen
    );
  }
}