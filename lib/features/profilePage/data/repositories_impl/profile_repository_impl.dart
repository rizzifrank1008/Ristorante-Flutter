import '../models/profile_model.dart';
import '../datasources/profile_firebase_data_source.dart';

abstract class ProfileRepository {
  Future<Profile> getUserProfile(String userId);
}

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileFirebaseDataSource dataSource;

  ProfileRepositoryImpl(this.dataSource);

  @override
  Future<Profile> getUserProfile(String userId) => dataSource.getUserProfile(userId);
}
