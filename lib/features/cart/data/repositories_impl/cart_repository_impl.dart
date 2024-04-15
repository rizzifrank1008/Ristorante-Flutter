import '../../domain/repositories/cart_repository.dart';
import '../datasources/cart_firebase_data_source.dart';
import '../models/cart_model.dart';



class CartRepositoryImpl implements CartRepository {
  final CartFirebaseDataSource dataSource;

  CartRepositoryImpl(this.dataSource);

  @override
  Future<void> createOrder(CartOrder order) => dataSource.createOrder(order);
}
