import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:udaan/screens/log_in.dart';
import 'package:udaan/services/auth.dart';
import 'package:udaan/utils/color';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
      final auth = AuthService();
    return Scaffold(
      
      backgroundColor: const Color(0xffB8EDE1),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
         backgroundColor: const Color(0xffB8EDE1),
            pinned: true,
            snap: true,
            floating: true,
            title: _buildAppBar(),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => _buildBody(),
              childCount: 1,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildAppBar() {
    
    return Row(
      
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
      
         IconButton(
          icon:  const Icon(Icons.arrow_left_sharp),
          onPressed: () {
          Navigator.pop(context);
          },
        ),
        const Expanded(
          child: const Text(
            "Setting",
            style: TextStyle(
              color: AppColor.textColor,
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        // IconBox(
        //   child: SvgPicture.asset(
        //     "assets/icons/edit.svg",
        //     width: 18,
        //     height: 18,
        //   ),
        //   bgColor: AppColor.appBgColor,
        // ),
      ],
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(right: 20, top: 10),
      child: Column(
        children: [
          _buildProfile(),
          const SizedBox(height: 40),
          const SettingItem(
            title: "General Setting",
            leadingIcon: Icons.settings,
            leadingIconColor: AppColor.orange,
          ),
          const SizedBox(height: 10),
          const SettingItem(
            title: "Analytics",
            leadingIcon: Icons.bookmark_border,
            leadingIconColor: AppColor.blue,
          ),
          const SizedBox(height: 10),
          const SettingItem(
            title: "Favorites",
            leadingIcon: Icons.favorite,
            leadingIconColor: AppColor.red,
          ),
          const SizedBox(height: 10),
          const SettingItem(
            title: "Privacy",
            leadingIcon: Icons.privacy_tip_outlined,
            leadingIconColor: AppColor.green,
          ),
          const SizedBox(height: 10),
          SettingItem(
            title: "Log Out",
            leadingIcon: Icons.logout_outlined,
            leadingIconColor: Colors.grey.shade400,
            onTap: () {
              _showConfirmLogout();
            },
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }

  Widget _buildProfile() {
    return const Padding(
      padding: EdgeInsets.only(left: 20),
      child: Column(
        children: <Widget>[
          // CustomImage(
          //   profile["image"]!,
          //   width: 80,
          //   height: 80,
          //   radius: 50,
          // ),
          SizedBox(
            height: 12,
          ),
          //  Text("Name: ${_user!.name}", style: TextStyle(fontSize: 20)),
          Text(
            "Welcome!!!",
            style: TextStyle(
              color: AppColor.textColor,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            "+91 7995559515",
            style: TextStyle(
              color: AppColor.labelColor,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  _showConfirmLogout() {
      final auth = AuthService();
    showCupertinoModalPopup(
      context: context,
      builder: (context) => CupertinoActionSheet(
        message: const Text("Would you like to log out?"),
        actions: [
          CupertinoActionSheetAction(

          //   IconButton(
          //   onPressed: 
          //   icon: const Icon(Icons.logout),
          // ),
            onPressed: () async {
              await auth.signOut();
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (_) => const LoginScreen()));
            },
            child: const Text(
              "Log Out",
              style: TextStyle(color: AppColor.actionColor),
            ),
          )
        ],
        cancelButton: CupertinoActionSheetAction(
          child: const Text("Cancel"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
    );
  }
}
class SettingItem extends StatelessWidget {
  const SettingItem({
    Key? key,
    required this.title,
    this.onTap,
    this.leadingIcon,
    this.leadingIconColor = Colors.white,
  }) : super(key: key);

  final IconData? leadingIcon;
  final Color? leadingIconColor;
  final String title;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(15),
            bottomRight: Radius.circular(15),
          ),
          color: AppColor.cardColor,
          boxShadow: [
            BoxShadow(
              color: AppColor.shadowColor.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 1,
              offset: const Offset(0, 1), // changes position of shadow
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child:
              leadingIcon != null ? _buildItemWithPrefixIcon() : _buildItem(),
        ),
      ),
    );
  }

  Widget _buildPrefixIcon() {
    return Container(
      padding: const EdgeInsets.all(7),
      decoration: BoxDecoration(
        color: AppColor.cardColor,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: AppColor.shadowColor.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 1,
            offset: const Offset(0, 1), // changes position of shadow
          ),
        ],
      ),
      child: Icon(
        leadingIcon,
        size: 24,
        color: leadingIconColor,
      ),
    );
  }

  Widget _buildItemWithPrefixIcon() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildPrefixIcon(),
        const SizedBox(
          width: 15,
        ),
        Expanded(
          child: Text(
            title,
            style: const TextStyle(fontSize: 16),
          ),
        ),
        const Icon(
          Icons.arrow_forward_ios,
          color: AppColor.labelColor,
          size: 14,
        )
      ],
    );
  }

  Widget _buildItem() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            title,
            style: const TextStyle(fontSize: 16),
          ),
        ),
        const Icon(
          Icons.arrow_forward_ios,
          color: AppColor.labelColor,
          size: 14,
        )
      ],
    );
  }
}