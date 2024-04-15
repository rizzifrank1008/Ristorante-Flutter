import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import '../../data/datasources/profile_firebase_data_source.dart';
import '../../data/models/profile_model.dart';
import '../../data/repositories_impl/profile_repository_impl.dart';


class ProfileController extends GetxController {
  final ProfileFirebaseDataSource dataSource = ProfileFirebaseDataSource();
  Rxn<Profile> userProfile = Rxn<Profile>();

  final ProfileRepository repository;

  ProfileController({required this.repository});

  @override
  void onInit() {
    super.onInit();
    fetchUserProfile();
  }

  void fetchUserProfile() async {
    try {
      final userId = FirebaseAuth.instance.currentUser?.uid ?? '';
      userProfile.value = await dataSource.getUserProfile(userId);
    } catch (e) {
      print("Failed to fetch user profile: $e");
    }
  }
}
