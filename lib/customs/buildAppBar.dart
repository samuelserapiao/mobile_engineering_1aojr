import 'package:flutter/material.dart';

class BuildAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const BuildAppBar({Key? key, required this.title}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(60.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      // actions: [
      //   PopupMenuButton(
      //     itemBuilder: (context) => [
      //       const PopupMenuItem(
      //         value: 1,
      //         child: Text("Início"),
      //       ),
      //       const PopupMenuItem(
      //         value: 2,
      //         child: Text("Selecionar veículo"),
      //       ),
      //       const PopupMenuItem(
      //         value: 3,
      //         child: Text("Cadastrar veículo"),
      //       ),
      //       const PopupMenuItem(
      //         value: 4,
      //         child: Text("Sair"),
      //       ),
      //     ],
      //     onSelected: (int menu) {
      //       String route = '/';
      //       // if (menu == 0) Navigator.pushNamed(context, '/');
      //       // if (menu == 1) Navigator.pushNamed(context, '/listCars');
      //       // if (menu == 2) Navigator.pushNamed(context, '/addCar');
      //
      //       if (menu == 1) route = '/listCars';
      //       if (menu == 2) route = '/addCar';
      //
      //       Navigator.pushNamed(context, route);
      //     },
      //   )
      // ],
    );
  }
}

