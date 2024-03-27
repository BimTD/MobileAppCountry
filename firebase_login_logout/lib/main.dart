import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_login_logout/widgets/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/interfaces.dart';
import 'pages/home_page.dart';
import 'pages/country.dart';
import 'pages/settings_page.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserInterface()),
      ],
      child: MyApp(),
    ),
  );
  Platform.isAndroid ?
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: 'AIzaSyCBBDml5ms0Td0247HispBW9nKtVaooHCw',  // current_key
          appId: '1:987651997390:android:5f75d3feff1231fd581a9f',  // mobilesdk_app_id
          messagingSenderId: '987651997390',  // project_number
          projectId: 'dangnhap-30b6f'  // project_id
      )
  ) : await Firebase.initializeApp();



}


class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: Provider.of<UserInterface>(context).themeMode,
      routes: {
        "homePage": (context) => HomePage(),
        "settingsPage": (context) => SettingsPage(),
        // "favoritesPage"  : (context) => CityPopulationPage(countryName: 'Albania'),
        // "productPage": (context) => ProductView(),

        // "orderDetail": (context) => ChiTietHoaDon(),
      },
      home: WelcomeScreen(),
    );
  }
}
