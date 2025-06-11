import 'package:flutter/material.dart';
import 'package:networkingdemo/models/user.dart';
import 'package:networkingdemo/services/user_remote_services.dart';
import 'package:networkingdemo/widgets/user_card.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  List<User>? allUsers;
  bool isLoaded = false;

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    allUsers = await UserRemoteServices().getAllUsers();
    if (allUsers != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('User Screen')),
      body: Center(
        child: Visibility(
          visible: isLoaded,
          replacement: const CircularProgressIndicator(),
          child: ListView.builder(
            itemCount: allUsers?.length ?? 0,
            itemBuilder: (context, index) => UserCard(user: allUsers![index]),
          ),
        ),
      ),
    );
  }
}
