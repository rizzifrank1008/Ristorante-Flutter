import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/profile_model.dart';

class ProfileFirebaseDataSource {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<Profile> getUserProfile(String userId) async {
    final docSnapshot = await firestore.collection('users').doc(userId).get();
    if (docSnapshot.exists && docSnapshot.data() != null) {
      return Profile.fromJson(docSnapshot.data() as Map<String, dynamic>, docSnapshot.id);
    } else {
      throw Exception("User not found");
    }
  }
}
