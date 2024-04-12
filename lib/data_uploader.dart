// // data_uploader.dart
// import 'package:cloud_firestore/cloud_firestore.dart';
//
// final FirebaseFirestore firestore = FirebaseFirestore.instance;
//
// Future<void> uploadData() async {
//   await uploadCategories();
//   await uploadMeals();
// }
//
// Future<void> uploadCategories() async {
//   const categorie = [
//     {'id': 'c1', 'title': 'Italiano', 'color': 'D32F2F'},
//     {'id': 'c2', 'title': 'Veloce & Facile', 'color': 'FFA000'},
//     {'id': 'c3', 'title': 'Hamburger', 'color': '7B1FA2'},
//     {'id': 'c4', 'title': 'Tedesco', 'color': 'FBC02D'},
//     {'id': 'c5', 'title': 'Leggero & Delizioso', 'color': 'C2185B'},
//     {'id': 'c6', 'title': 'Esotico', 'color': '00796B'},
//     {'id': 'c7', 'title': 'Colazione', 'color': 'FF6F00'},
//     {'id': 'c8', 'title': 'Asiatico', 'color': 'C0CA33'},
//     {'id': 'c9', 'title': 'Francese', 'color': '5D4037'},
//     {'id': 'c10', 'title': 'Estivo', 'color': '0097A7'}
//   ];
//
//   for (var category in categorie) {
//     await firestore.collection('categorie').doc(category['id']).set(category);
//   }
// }
//
// Future<void> uploadMeals() async {
//   const meals = [
//     {
//       'id': 'm1',
//       'categories': ['c1', 'c2'],
//       'title': 'Spaghetti al Pomodoro',
//       'affordability': 'affordable',
//       'complexity': 'simple',
//       'imageUrl': 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/20/Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg/800px-Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg',
//       'duration': 20,
//       'ingredients': [
//         '4 Pomodori',
//         '1 Cucchiaio di Olio d\'Oliva',
//         '1 Cipolla',
//         '250g Spaghetti',
//         'Spezie',
//         'Formaggio (opzionale)'
//       ],
//       'steps': [
//         'Taglia i pomodori e la cipolla a pezzetti piccoli.',
//         'Fai bollire dell\'acqua - aggiungi il sale una volta che bolle.',
//         'Metti gli spaghetti nell\'acqua bollente - dovrebbero essere pronti in circa 10-12 minuti.',
//         'Nel frattempo, scalda dell\'olio d\'oliva e aggiungi la cipolla tagliata.',
//         'Dopo 2 minuti, aggiungi i pezzi di pomodoro, sale, pepe e le altre spezie.',
//         'Il sugo sarà pronto quando gli spaghetti saranno cotti.',
//         'Sentiti libero di aggiungere un po\' di formaggio sopra il piatto finito.'
//       ],
//       'isGlutenFree': false,
//       'isVegan': true,
//       'isVegetarian': true,
//       'isLactoseFree': true,
//       'price': 15
//     },
//     {
//       'id': 'm2',
//       'categories': ['c2'],
//       'title': 'Toast Hawaii',
//       'affordability': 'affordable',
//       'complexity': 'simple',
//       'imageUrl': 'https://cdn.pixabay.com/photo/2018/07/11/21/51/toast-3532016_1280.jpg',
//       'duration': 10,
//       'ingredients': [
//         '1 Fetta di Pane Bianco',
//         '1 Fetta di Prosciutto',
//         '1 Fetta di Ananas',
//         '1-2 Fette di Formaggio',
//         'Burro'
//       ],
//       'steps': [
//         'Imburra un lato del pane bianco',
//         'Metti il prosciutto, l\'ananas e il formaggio sul pane bianco',
//         'Inforna il toast per circa 10 minuti nel forno a 200°C'
//       ],
//       'isGlutenFree': false,
//       'isVegan': false,
//       'isVegetarian': false,
//       'isLactoseFree': false,
//       'price': 14
//     },
//     {
//       'id': 'm3',
//       'categories': ['c2', 'c3'],
//       'title': 'Hamburger Classico',
//       'affordability': 'pricey',
//       'complexity': 'simple',
//       'imageUrl': 'https://cdn.pixabay.com/photo/2014/10/23/18/05/burger-500054_1280.jpg',
//       'duration': 45,
//       'ingredients': [
//         '300g Carne di Manzo',
//         '1 Pomodoro',
//         '1 Cetriolo',
//         '1 Cipolla',
//         'Ketchup',
//         '2 Panini per Hamburger'
//       ],
//       'steps': [
//         'Forma 2 polpette',
//         'Friggi le polpette per circa 4 minuti per lato',
//         'Friggi rapidamente i panini per circa 1 minuto per lato',
//         'Spalma i panini con il ketchup',
//         'Servi l\'hamburger con pomodoro, cetriolo e cipolla'
//       ],
//       'isGlutenFree': false,
//       'isVegan': false,
//       'isVegetarian': false,
//       'isLactoseFree': true,
//       'price': 12
//     },
//     {
//       'id': 'm4',
//       'categories': ['c4'],
//       'title': 'Wiener Schnitzel',
//       'affordability': 'luxurious',
//       'complexity': 'challenging',
//       'imageUrl': 'https://cdn.pixabay.com/photo/2018/03/31/19/29/schnitzel-3279045_1280.jpg',
//       'duration': 60,
//       'ingredients': [
//         '8 Fettine di Vitello',
//         '4 Uova',
//         '200g Pan grattato',
//         '100g Farina',
//         '300ml Burro',
//         '100g Olio Vegetale',
//         'Sale',
//         'Fette di Limone'
//       ],
//       'steps': [
//         'Batti le fettine di vitello fino a raggiungere uno spessore di circa 2-4 mm e sala su entrambi i lati.',
//         'In una piastra piatta, mescola le uova brevemente con una forchetta.',
//         'Infarina leggermente le fettine poi immergi nell\'uovo e infine passa nel pangrattato.',
//         'Scalda il burro e l\'olio in una padella grande (fai in modo che il grasso diventi molto caldo) e friggi gli schnitzel fino a doratura su entrambi i lati.',
//         'Assicurati di girare la padella regolarmente in modo che gli schnitzel siano circondati dall\'olio e il pangrattato diventi "soffice".',
//         'Togli e scola su carta da cucina. Friggi il prezzemolo nell\'olio rimanente e scola.',
//         'Disponi gli schnitzel su un piatto caldo e servili guarniti con prezzemolo e fette di limone.'
//       ],
//       'isGlutenFree': false,
//       'isVegan': false,
//       'isVegetarian': false,
//       'isLactoseFree': false,
//       'price': 11
//     },
//     {
//       'id': 'm5',
//       'categories': ['c2', 'c5', 'c10'],
//       'title': 'Insalata con Salmone Affumicato',
//       'affordability': 'luxurious',
//       'complexity': 'simple',
//       'imageUrl': 'https://cdn.pixabay.com/photo/2016/10/25/13/29/smoked-salmon-salad-1768890_1280.jpg',
//       'duration': 15,
//       'ingredients': [
//         'Rucola',
//         'Lattuga',
//         'Prezzemolo',
//         'Finocchio',
//         '200g Salmone Affumicato',
//         'Senape',
//         'Aceto Balsamico',
//         'Olio d\'Oliva',
//         'Sale e Pepe'
//       ],
//       'steps': [
//         'Lava, pelate e taglia la rucola e le verdure.',
//         'Taglia a cubetti il salmone.',
//         'Prepara il condimento con senape, aceto balsamico e olio d\'oliva.',
//         'Prepara l\'insalata.',
//         'Aggiungi i cubetti di salmone e il condimento.'
//       ],
//       'isGlutenFree': true,
//       'isVegan': false,
//       'isVegetarian': true,
//       'isLactoseFree': true,
//       'price': 10
//     },
//     {
//       'id': 'm6',
//       'categories': ['c6', 'c10'],
//       'title': 'Deliziosa Mousse all\'Arancia',
//       'affordability': 'affordable',
//       'complexity': 'hard',
//       'imageUrl': 'https://cdn.pixabay.com/photo/2017/05/01/05/18/pastry-2274750_1280.jpg',
//       'duration': 240,
//       'ingredients': [
//         '4 Fogli di Gelatina',
//         '150ml Succo d\'Arancia',
//         '80g Zucchero',
//         '300g Yogurt',
//         '200g Panna',
//         'Scorza d\'Arancia',
//       ],
//       'steps': [
//         'Sciogli la gelatina in una pentola.',
//         'Aggiungi il succo d\'arancia e lo zucchero.',
//         'Togli la pentola dal fuoco.',
//         'Aggiungi 2 cucchiai di yogurt.',
//         'Mescola la gelatina con il resto dello yogurt.',
//         'Raffredda tutto in frigorifero.',
//         'Monta la panna e incorporala delicatamente alla massa d\'arancia.',
//         'Raffredda nuovamente per almeno 4 ore.',
//         'Servi con la scorza d\'arancia.'
//       ],
//       'isGlutenFree': true,
//       'isVegan': false,
//       'isVegetarian': true,
//       'isLactoseFree': false,
//       'price': 15
//     },
//     {
//       'id': 'm7',
//       'categories': ['c7'],
//       'title': 'Pancakes',
//       'affordability': 'affordable',
//       'complexity': 'simple',
//       'imageUrl': 'https://cdn.pixabay.com/photo/2018/07/10/21/23/pancake-3529653_1280.jpg',
//       'duration': 20,
//       'ingredients': [
//         '1 1/2 Tazze di Farina',
//         '3 1/2 Tazze di Lievito in Polvere',
//         '1 Cucchiaino di Sale',
//         '1 Cucchiaio di Zucchero Bianco',
//         '1 1/4 Tazze di Latte',
//         '1 Uovo',
//         '3 Cucchiai di Burro, fuso',
//       ],
//       'steps': [
//         'In una ciotola grande, setaccia la farina, il lievito in polvere, il sale e lo zucchero.',
//         'Fai un incavo al centro e aggiungi il latte, l\'uovo e il burro fuso; mescola fino a ottenere un composto omogeneo.',
//         'Scalda leggermente una padella o una bistecchiera unta a fuoco medio-alto.',
//         'Versa o prendi con un mestolo il composto nella padella calda, utilizzando circa 1/4 di tazza per ogni pancake. Cuoci fino a doratura su entrambi i lati e servi caldo.'
//       ],
//       'isGlutenFree': true,
//       'isVegan': false,
//       'isVegetarian': true,
//       'isLactoseFree': false,
//       'price': 9
//     },
//     {
//       'id': 'm8',
//       'categories': ['c8'],
//       'title': 'Curry di Pollo Indiano Cremoso',
//       'affordability': 'pricey',
//       'complexity': 'challenging',
//       'imageUrl': 'https://cdn.pixabay.com/photo/2018/06/18/16/05/indian-food-3482749_1280.jpg',
//       'duration': 35,
//       'ingredients': [
//         '4 Petti di Pollo',
//         '1 Cipolla',
//         '2 Spicchi d\'Aglio',
//         '1 Pezzo di Zenzero',
//         '4 Cucchiai di Mandorle',
//         '1 Cucchiaino di Peperoncino Cayenna',
//         '500ml Latte di Cocco',
//       ],
//       'steps': [
//         'Taglia a fette e fai dorare i petti di pollo.',
//         'Frulla cipolla, aglio e zenzero in pasta e soffriggi il tutto.',
//         'Aggiungi le spezie e soffriggi.',
//         'Aggiungi il petto di pollo + 250 ml di acqua e cuoci il tutto per 10 minuti.',
//         'Aggiungi il latte di cocco.',
//         'Servi con riso'
//       ],
//       'isGlutenFree': true,
//       'isVegan': false,
//       'isVegetarian': false,
//       'isLactoseFree': true,
//       'price': 9
//     },
//     {
//       'id': 'm9',
//       'categories': ['c9'],
//       'title': 'Soufflé al Cioccolato',
//       'affordability': 'affordable',
//       'complexity': 'hard',
//       'imageUrl': 'https://cdn.pixabay.com/photo/2014/08/07/21/07/souffle-412785_1280.jpg',
//       'duration': 45,
//       'ingredients': [
//         '1 Cucchiaino di Burro Fuso',
//         '2 Cucchiai di Zucchero Bianco',
//         '2 Once di Cioccolato Fondente al 70%, spezzettato',
//         '1 Cucchiaio di Burro',
//         '1 Cucchiaio di Farina',
//         '4 1/3 cucchiai di Latte freddo',
//         '1 Pizzico di Sale',
//         '1 Pizzico di Peperoncino Cayenna',
//         '1 Tuorlo d\'Uovo Grande',
//         '2 Albumi d\'Uovo Grandi',
//         '1 Pizzico di Crema di Tartaro',
//         '1 Cucchiaio di Zucchero Bianco',
//       ],
//       'steps': [
//         'Preriscalda il forno a 190°C. Fodera una teglia con carta da forno.',
//         'Spennella leggermente il fondo e i lati di 2 ramequins con 1 cucchiaino di burro fuso; copri fondo e lati fino al bordo.',
//         'Aggiungi 1 cucchiaio di zucchero bianco ai ramequins. Ruota i ramequins fino a quando lo zucchero non copre tutte le superfici.',
//         'Metti i pezzi di cioccolato in una ciotola di metallo.',
//         'Metti la ciotola sopra una pentola di circa 3 tazze d\'acqua calda a fuoco basso.',
//         'Fai sciogliere 1 cucchiaio di burro in una padella a fuoco medio. Aggiungi la farina. Mescola finché la farina non si incorpora al burro e il composto si addensa.',
//         'Aggiungi il latte freddo e mescola fino a ottenere un composto liscio e denso. Trasferisci il composto nella ciotola con il cioccolato fuso.',
//         'Aggiungi sale e peperoncino cayenna. Mescola tutto accuratamente. Aggiungi il tuorlo d\'uovo e mescola per amalgamare.',
//         'Lascia la ciotola sopra l\'acqua calda (senza far bollire) per mantenere il cioccolato caldo mentre monti gli albumi.',
//         'Metti 2 albumi d\'uovo in una ciotola; aggiungi la crema di tartaro. Monta fino a quando il composto inizia a rapprendersi e una traccia di frusta rimane sulla superficie per circa 1 secondo prima di scomparire nel composto.',
//         'Aggiungi 1/3 di zucchero e mescola. Aggiungi un po\' più di zucchero circa 15 secondi dopo.',
//         'Aggiungi il resto dello zucchero. Continua a montare finché il composto non sarà circa denso come la panna montata e formerà picchi morbidi, 3-5 minuti.',
//         'Trasferisci poco meno della metà degli albumi montati nel cioccolato.',
//         'Mescola finché gli albumi non sono completamente incorporati al cioccolato.',
//         'Aggiungi il resto degli albumi; incorporali delicatamente al cioccolato con una spatola, sollevando dal basso verso l\'alto.',
//         'Smetti di mescolare una volta che gli albumi scompaiono. Dividi il composto tra i 2 ramequins preparati. Metti i ramequins sulla teglia preparata.',
//         'Inforna in forno preriscaldato fino a quando i soufflé saranno gonfi e saranno cresciuti sopra il bordo dei ramequins, 12-15 minuti.',
//       ],
//       'isGlutenFree': true,
//       'isVegan': false,
//       'isVegetarian': true,
//       'isLactoseFree': false,
//       'price': 9
//     },
//     {
//       'id': 'm10',
//       'categories': ['c2', 'c5', 'c10'],
//       'title': 'Insalata di Asparagi con Pomodorini',
//       'affordability': 'luxurious',
//       'complexity': 'simple',
//       'imageUrl': 'https://cdn.pixabay.com/photo/2018/04/09/18/26/asparagus-3304997_1280.jpg',
//       'duration': 30,
//       'ingredients': [
//         'Asparagi Bianchi e Verdi',
//         '30g Pinoli',
//         '300g Pomodorini Ciliegia',
//         'Insalata',
//         'Sale, Pepe e Olio d\'Oliva'
//       ],
//       'steps': [
//         'Lava, sbuccia e taglia gli asparagi.',
//         'Cuoci in acqua salata.',
//         'Salate e pepate gli asparagi.',
//         'Tosta i pinoli.',
//         'Taglia a metà i pomodorini.',
//         'Mescola gli asparagi, l\'insalata e il condimento.',
//         'Servi con del pane.'
//       ],
//       'isGlutenFree': true,
//       'isVegan': true,
//       'isVegetarian': true,
//       'isLactoseFree': true,
//       'price': 8
//     }
//     // Continua con gli altri pasti utilizzando lo stesso schema
//   ];
//
//   for (var meal in meals) {
//     await firestore.collection('meals').doc(meal['id'] as String?).set(meal);
//   }
// }
