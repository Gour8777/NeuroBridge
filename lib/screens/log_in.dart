import 'package:flutter/material.dart';
import 'package:udaan/screens/user_profile.dart';
import 'package:udaan/services/auth.dart';

import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthService _auth = AuthService();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  void _login() async {
    final user = await _auth.signIn(_email.text, _password.text);
    if (user != null) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) =>  HomeScreen(uid: user.uid)));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Login Failed')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFeffaef),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(30),
            child: Column(
              children: [
                const SizedBox(height: 20),
                CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.teal,
                    child: Image.asset("assets/Image.png")),
                const SizedBox(height: 20),
                const Text(
                  'Welcome to\nNeuroBridge',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(221, 0, 58, 22)),
                ),
                const SizedBox(height: 8),
                const Text(
                  
                  'Personalized Learning\nfor Every Mind',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                     fontSize: 24,
                    color: Color.fromARGB(255, 0, 115, 40)),
                ),
                const SizedBox(height: 20),
                TextField(
                    controller: _email,
                    decoration: InputDecoration(
                  
                        hintText: 'Email address',
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12)),
                        labelText: "Email")),
        
                const SizedBox(height: 20),
                TextField(
                    controller: _password,
                    decoration: InputDecoration(
                        hintText: 'Password',
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12)),
                        labelText: "Password"),
                    obscureText: true),
                const SizedBox(height: 20),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF2F9C8D),
                      minimumSize: const Size(double.infinity, 48),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14)),
                    ),
                    onPressed: _login,
                    child: const Text("Login",
                     style: TextStyle(
                      fontSize: 20,
                    color: Color.fromARGB(255, 255, 255, 255)),
                    
                    )),
                // TextButton(
                //   onPressed: () {
                //     Navigator.pushNamed(context, '/signup');
                //   },
                //   child: const Text("Don't have an account? Sign Up"),
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
