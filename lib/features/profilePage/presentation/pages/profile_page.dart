import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/profile_controller.dart';

class ProfilePage extends GetView<ProfileController> {
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
                  backgroundImage: NetworkImage('https://source.unsplash.com/random/150x150'), // Assume a placeholder
                  backgroundColor: Colors.grey.shade300,
                ),
                SizedBox(height: 20),
                Text(userProfile.firstName + " " + userProfile.lastName,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                SizedBox(height: 10),
                Divider(),
                _userInfoTile('Email', userProfile.email, Icons.email),
                _userInfoTile('Età', userProfile.age.toString(), Icons.cake),
                _userInfoTile('Indirizzo', userProfile.address, Icons.home),
                _userInfoTile('Nazione', userProfile.country, Icons.flag),

              ],
            ),
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      }),
    );
  }

  Widget _userInfoTile(String title, String value, IconData icon) {
    return ListTile(
      leading: Icon(icon, color: Color(0xFFF2510A)),
      title: Text(title, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black54)),
      subtitle: Text(value, style: TextStyle(fontSize: 16)),
      contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical:10),
    );
  }
}
