import 'package:flutter/material.dart';
import 'package:udaan/models/user_models.dart';
import 'package:udaan/screens/log_in.dart';
import 'package:udaan/screens/setting.dart';
import 'package:udaan/screens/user_profile.dart';
import 'package:udaan/services/auth.dart';

class HomeScreen extends StatefulWidget {
    final String uid;
  const HomeScreen({super.key, required this.uid});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final AuthService _auth = AuthService();
  UserModel? _user;
  @override

  void initState() {
    super.initState();
    loadUser();
  }

  void loadUser() async {
    UserModel? userData = await _auth.fetchUserData(widget.uid);
    setState(() {
      _user = userData;
    });
  }

  Widget build(BuildContext context) {
    final String uid;
    final auth = AuthService();

    return Scaffold(
      appBar: AppBar(
        // leading: IconButton(
        //   icon: const Icon(Icons.back_hand),
        //   onPressed: () {
        //     Navigator.push(
        //         context, MaterialPageRoute(builder: (_) => const HomeScreen()));
        //   },
        // ),
       automaticallyImplyLeading: false,
        title: Text("Hello ${_user!.name} !!", style: TextStyle(fontSize: 20)),
        backgroundColor: const Color(0xffB8EDE1),
        actions: [
          IconButton(
            onPressed: ()  {
             
         Navigator.push(context, MaterialPageRoute(builder: (_) => SettingPage()));

            },
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body:  const Center(child: Center(child: Text('Dashboard Coming Soon!!!',
      style: TextStyle(fontSize: 24, color: Colors.black, fontWeight: FontWeight.bold, 
      ))),
      ));
  }
}
