// FirebaseFirestore.instance: Ottiene l'istanza del client Firestore, usato per effettuare '
// 'chiamate al database.
// getCategories(): Questo metodo recupera le categorie dal database Firestore.
// Interroga la collezione categorie e trasforma i risultati in una lista di stringhe
// che rappresentano i nomi delle categorie.
// La funzione è asincrona e ritorna un Future che sarà una lista di stringhe.

import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/category_model.dart';

class MenuFirebaseDataSource {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<List<Category>> getCategories() async {
    final snapshot = await firestore.collection('categorie').get();
    final categories = snapshot.docs.map((doc) {
      // Usa il factory constructor per convertire ogni documento in un oggetto Category
      return Category.fromJson(doc.data() as Map<String, dynamic>, doc.id);
    }).toList();
    print("Categorie recuperate: ${categories.map((c) => c.title).toList()}");  // Aggiungi per debug
    return categories;
  }
}
