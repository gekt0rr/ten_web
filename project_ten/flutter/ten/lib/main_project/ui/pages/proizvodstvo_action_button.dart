import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/pages_bloc.dart';

class ProizvodstvoButton extends StatelessWidget {
  const ProizvodstvoButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showModalBottomSheet(
          context: context,
          builder: (context) {
            return SizedBox(
              height: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      context.read<PagesBloc>().add(ProizvodstvoListEvent());
                      Navigator.pop(context);
                    },
                    child: const Text('Red'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      context
                          .read<PagesBloc>()
                          .add(ProizvodstvoDashboardEvent());
                      Navigator.pop(context);
                    },
                    child: const Text('Charts'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      context.read<PagesBloc>().add(ProizvodstvoFormEvent());
                      Navigator.pop(context);
                    },
                    child: const Text('Form'),
                  ),
                ],
              ),
            );
          },
        );
      },
      child: const Icon(Icons.add),
    );
  }
}
