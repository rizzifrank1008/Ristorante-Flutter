import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/profile_controller.dart';

class ProfilePage extends  GetView<ProfileController>  {
  const ProfilePage({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text('Profilo', style: TextStyle(color: Colors.black)),
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Obx(() {
        var userProfile = controller.userProfile.value;
        if (userProfile != null) {
          return SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(height: 20),
                CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage('https://via.placeholder.com/150'), // Assume a placeholder
                  backgroundColor: Colors.grey.shade300,
                ),
                SizedBox(height: 20),
                Text(userProfile.firstName, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                Text(userProfile.lastName, style: TextStyle(fontSize: 20)),
                SizedBox(height: 20),
                _userInfoTile('Email', userProfile.email),
                _userInfoTile('Età', userProfile.age.toString()),
                _userInfoTile('Indirizzo', userProfile.address),
                _userInfoTile('Nazione', userProfile.country),
              ],
            ),
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      }),
    );
  }

  Widget _userInfoTile(String title, String value) {
    return ListTile(
      title: Text(title, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black54)),
      subtitle: Text(value, style: TextStyle(fontSize: 16)),
      contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical:10),
    );
  }
}
