// features/home/presentation/pages/menu_page.dart
import 'package:flutter/material.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu del Ristorante'),
      ),
      body: Center(
        child: Text('Lista dei piatti disponibili'),
      ),
    );
  }
}
