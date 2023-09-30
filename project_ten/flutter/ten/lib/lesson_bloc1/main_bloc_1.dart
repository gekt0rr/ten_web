// изучаем block 8*
// настроил android studio

//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'counter_bloc_bloc_1.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key); // конструктор без параметров

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  } // конструктор
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterBloc>(
      create: (context) => CounterBloc(),
      child: BlocBuilder<CounterBloc, int>(builder: (context, state) {
        // builrer принимает callback с контекстом и состоянием
        return Scaffold(
            floatingActionButton:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              IconButton(
                icon: const Icon(Icons.plus_one),
                onPressed: () {
                  BlocProvider.of<CounterBloc>(context).add(CounterIncEvent());
                },
              ),
              IconButton(
                icon: const Icon(Icons.exposure_minus_1),
                onPressed: () {
                  BlocProvider.of<CounterBloc>(context).add(CounterDecEvent());
                },
              ),
            ]),
            body: Center(
              child: Text(
                state.toString(),
                style: const TextStyle(fontSize: 33),
              ),
            ));
      }),
    );
  }
}
