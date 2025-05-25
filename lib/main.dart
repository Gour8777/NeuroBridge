import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:udaan/screens/log_in.dart';
import 'package:udaan/screens/user_profile.dart';

import 'screens/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'services/auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'NeuroBridge',
      debugShowCheckedModeBanner: false,
      // initialRoute: '/',
  home: LoginScreen(),
// home: StreamBuilder<User?>(
//         stream: FirebaseAuth.instance.authStateChanges(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(child: CircularProgressIndicator());
//           }
//           if (snapshot.hasData) {
//             return const LoginScreen(); // Show user info if logged in
//           } else {
//             return const LoginScreen(); // Otherwise show login
//           }
//         },
//       ),


      // routes: {
      //   '/': (context) => const LoginScreen(),
      //   // '/signup': (context) => const SignupScreen(),
      //   '/home': (context) => const HomeScreen(),
      // },
    );
  }
}
