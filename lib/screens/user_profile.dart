import 'package:flutter/material.dart';
import 'package:udaan/models/user_models.dart';
import 'package:udaan/services/auth.dart';


class ProfileScreen extends StatefulWidget {
  final String uid;

  const ProfileScreen({super.key, required this.uid});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Profile")),
      body: _user == null
          ? Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Name: ${_user!.name}", style: TextStyle(fontSize: 20)),
                  SizedBox(height: 10),
                  Text("Location: ${_user!.location}", style: TextStyle(fontSize: 20)),
                ],
              ),
            ),
    );
  }
}
