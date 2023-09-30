import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ten/main_project/bloc/bloc_proizvodstvo/proizvodstvo_bloc.dart';
import 'package:ten/main_project/bloc/my_colors_bloc.dart';
import 'package:ten/main_project/bloc/pages_bloc.dart';
import 'package:ten/main_project/repository/services/zadelka_5_repo.dart';
import 'package:ten/main_project/ui/my_drawer.dart';
import 'package:ten/main_project/ui/pages/home_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key); // конструктор без параметров
  @override
  Widget build(BuildContext context) {
    final zadelka5Repo = Zadelka5Repo();
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MyColorsBloc(),
        ),
        BlocProvider(
          create: (context) => PagesBloc(),
        ),
        BlocProvider(
          create: (context) => ProizvodstvoBloc(zadelka5Repo),
        ),

        // BlocProvider<AllGamesBloc>(
        //   create: (context) => AllGamesBloc(
        //     gameRepository: context.read<GameRepository>(),
        //   )..add(
        //       GetGames(),
        //     ),
        // ),
      ],
      child: MaterialApp(
        themeMode: ThemeMode.system,
        theme: ThemeData(
          brightness: Brightness.light,
          useMaterial3: true,
          //        colorSchemeSeed: Colors.green,
        ),
        darkTheme: ThemeData(
          brightness: Brightness.dark,
          useMaterial3: true,
          //        colorSchemeSeed: Colors.green,
        ),
        home: const MyHomePage(),
      ),
    );
  }
}

//

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Zencha-ten"),
      ),
      drawer: const MyDrawer(),
      // создадим место где будут отрисовываться наши страницы (виджеты) в зависимости от состояния
      body: BlocBuilder<PagesBloc, PagesState>(
        builder: (context, state) {
          if (state is PagesStateLoading) {
            return const HomeDefault();
          } else if (state is PagesStateLoaded) {
            return state.page;
          } else {
            return const HomeDefault();
          }
        },
      ),
    );
  }
}
