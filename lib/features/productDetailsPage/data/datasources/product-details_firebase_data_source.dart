// FirebaseFirestore.instance: Ottiene l'istanza del client Firestore, usato per effettuare '
// 'chiamate al database.
// getCategories(): Questo metodo recupera le categorie dal database Firestore.
// Interroga la collezione categorie e trasforma i risultati in una lista di stringhe
// che rappresentano i nomi delle categorie.
// La funzione è asincrona e ritorna un Future che sarà una lista di stringhe.

import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/product-details_model.dart';

class ProductDetailsFirebaseDataSource {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<List<ProductDetails>> getCategories() async {
    final snapshot = await firestore.collection('meals').get();
    final products = snapshot.docs.map((doc) {
      // Usa il factory constructor per convertire ogni documento in un oggetto Category
      return ProductDetails.fromJson(doc.data() as Map<String, dynamic>, doc.id);
    }).toList();
    print("prodotti recuperati: ${products.map((c) => c.title).toList()}");  // Aggiungi per debug
    return products;
  }
}
