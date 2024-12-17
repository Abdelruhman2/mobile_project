import 'package:flutter/material.dart';
import 'package:news_app/screens/login_page.dart';
import 'package:news_app/screens/home_screen.dart';
import 'package:news_app/screens/logout_page.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Another Way To intilize Firebase but not work with me
  // await Firebase.initializeApp(options: defaultFirebaseOptions.curruntPlatform)
  // Initialize Firebase with custom options
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: 'AIzaSyCtNpy2yqTk_Be5xupWT13-ULdB-P4rz48',
      appId: '1:267835984026:android:f9c520c00615897e18f723',
      messagingSenderId: '267835984026',
      projectId: 'ppedetection-58cab',
    ),
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/sign_in', // The First Page THat Appear when open the App
      routes: {
        '/': (context) => const HomeScreen(), // Home Page
        '/sign_in': (context) => SignInPage(), // Sign in Page
        '/logout': (context) => const LogoutScreen(), // logout Page
      },
    );
  }
}
