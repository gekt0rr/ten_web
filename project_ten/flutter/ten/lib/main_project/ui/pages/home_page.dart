import 'package:flutter/material.dart';
import 'package:ten/main_project/repository/services/zadelka_5_repo.dart';

class HomeDefault extends StatelessWidget {
  const HomeDefault({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text("HomeDefault"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Zadelka5Repo().getAllZadelka5();
          //ProizvodstvoRepository().getKreduc3();
        },
        child: const Icon(Icons.home_max),
      ),
    );
  }
}
