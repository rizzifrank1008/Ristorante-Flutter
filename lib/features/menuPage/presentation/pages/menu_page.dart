import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ristorante_finale/features/menuPage/presentation/controller/menu_controller.dart';

class MenuPage extends GetView<MenuRestourantController> {
  const MenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu del Ristorante'),
      ),
      body: Obx(() => ListView.builder(
        itemCount: controller.categorie.length,
        itemBuilder: (context, index) => ListTile(
          title: Text(controller.categorie[index]),
        ),
      )),
    );
  }
}