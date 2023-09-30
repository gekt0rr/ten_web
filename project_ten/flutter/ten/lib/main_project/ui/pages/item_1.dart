import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ten/main_project/bloc/my_colors_bloc.dart';

class Item1Page extends StatelessWidget {
  const Item1Page({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyColorsBloc, MyColorsState>(
      builder: (context, state) {
        return Stack(
          children: [
            Positioned.fill(
              child: Center(
                child: Container(
                  width: 200,
                  height: 200,
                  color: (state is MyColorsStateValue)
                      ? state.color
                      : Colors.white,
                ),
              ),
            ),
            Positioned(
              bottom: 16,
              right: 16,
              child: FloatingActionButton(
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
                                context
                                    .read<MyColorsBloc>()
                                    .add(MyColorsEventRed());
                                Navigator.pop(context);
                              },
                              child: const Text('Red'),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                context
                                    .read<MyColorsBloc>()
                                    .add(MyColorsEventGreen());
                                Navigator.pop(context);
                              },
                              child: const Text('Green'),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                context
                                    .read<MyColorsBloc>()
                                    .add(MyColorsEventBlue());
                                Navigator.pop(context);
                              },
                              child: const Text('Blue'),
                            ),
                            // кнопка с иконкой и текстом с состоянием синего цвета, которая при нажатии на нее будет гореть как нажатая
                            ElevatedButton.icon(
                              onPressed: () {
                                context
                                    .read<MyColorsBloc>()
                                    .add(MyColorsEventBlue());
                                Navigator.pop(context);
                              },
                              icon: const Icon(Icons.add),
                              label: const Text('Blue'),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
                child: const Icon(Icons.add),
              ),
            ),
          ],
        );
      },
    );
  }
}
