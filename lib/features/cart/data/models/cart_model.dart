import 'package:cloud_firestore/cloud_firestore.dart';

class CartOrder {
  final List<String> productIds; // Lista degli ID dei prodotti nel carrello
  final double total; // Totale dell'ordine
  final String userId; // ID dell'utente che effettua l'ordine

  CartOrder({
    required this.productIds,
    required this.total,
    required this.userId,
  });

  Map<String, dynamic> toJson() {
    return {
      'productIds': productIds,
      'total': total,
      'userId': userId,
      'createdAt': FieldValue.serverTimestamp(), // Timestamp dell'ordine
    };
  }
}
