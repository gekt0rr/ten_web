import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ten/main_project/bloc/bloc_proizvodstvo/proizvodstvo_bloc.dart';
import 'package:ten/main_project/bloc/pages_bloc.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Header"),
              ],
            ),
          ),
          Column(
            children: [
              ListTile(
                leading: const Icon(Icons.home),
                title: const Text("Главная"),
                onTap: () {
                  context.read<PagesBloc>().add(PageHomeEvent());
                  //Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.color_lens),
                title: const Text("Тест цвета"),
                onTap: () {
                  context.read<PagesBloc>().add(PageItem1Event());
                  //Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.precision_manufacturing_outlined),
                title: const Text("Производство"),
                onTap: () {
                  context.read<PagesBloc>().add(ProizvodstvoListEvent());
                  context.read<ProizvodstvoBloc>().add(Zadelka5LoadEvent());
                  // context.read<PagesBloc>().add(ProizvodstvoTestEvent());
                  //Navigator.pop(context);
                },
              ),
            ],
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text("Item 3"),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text("Item 4"),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text("Item 5"),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          const Divider(),
        ],
      ),
    );
  }
}
