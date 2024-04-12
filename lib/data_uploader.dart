// data_uploader.dart
import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseFirestore firestore = FirebaseFirestore.instance;

Future<void> uploadData() async {
  await uploadCategories();
  // await uploadMeals();
}

Future<void> uploadCategories() async {
  const categorie = [
    {'id': 'c1', 'title': 'Italiano', 'color': 'D32F2F'},
    {'id': 'c2', 'title': 'Veloce & Facile', 'color': 'FFA000'},
    {'id': 'c3', 'title': 'Hamburger', 'color': '7B1FA2'},
    {'id': 'c4', 'title': 'Tedesco', 'color': 'FBC02D'},
    {'id': 'c5', 'title': 'Leggero & Delizioso', 'color': 'C2185B'},
    {'id': 'c6', 'title': 'Esotico', 'color': '00796B'},
    {'id': 'c7', 'title': 'Colazione', 'color': 'FF6F00'},
    {'id': 'c8', 'title': 'Asiatico', 'color': 'C0CA33'},
    {'id': 'c9', 'title': 'Francese', 'color': '5D4037'},
    {'id': 'c10', 'title': 'Estivo', 'color': '0097A7'}
  ];

  for (var category in categorie) {
    await firestore.collection('categorie').doc(category['id']).set(category);
  }
}

// Future<void> uploadMeals() async {
//   const meals = [
//     {
//       'id': 'm1',
//       'categories': ['c1', 'c2'],
//       'title': 'Spaghetti al Pomodoro',
//       'price': 15,
//       // Aggiungi altri campi qui
//     },
//     // Aggiungi altri pasti qui...
//   ];
//
//   // for (var meal in meals) {
//   //   await firestore.collection('meals').doc(meal['id']).set(meal);
//   // }
// }
