import 'package:cloud_firestore/cloud_firestore.dart';

class MenuFirebaseDataSource {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<List<String>> getCategories() async {
    final snapshot = await firestore.collection('categorie').get();
    final categories = snapshot.docs.map((doc) => doc.data()['nome'] as String).toList();
    print("Categorie recuperate: $categories"); // Aggiungi per debug
    return categories;
  }

}
