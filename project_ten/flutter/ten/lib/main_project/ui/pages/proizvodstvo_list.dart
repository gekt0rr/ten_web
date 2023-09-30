import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ten/main_project/bloc/bloc_proizvodstvo/proizvodstvo_bloc.dart';
import 'package:ten/main_project/repository/services/zagotovka_2_api.dart';
import 'package:ten/main_project/ui/pages/proizvodstvo_action_button.dart';

import '../../repository/models/base_list_model.dart';
import '../../repository/models/zadelka_5_list.dart';

class ProizvodstvoList extends StatefulWidget {
  @override
  _ProizvodstvoListState createState() => _ProizvodstvoListState();
}

class _ProizvodstvoListState extends State<ProizvodstvoList> {
  List<BaseListModel>? baseListModelData;
  var isLoaded = false;

  late List<bool> _columnVisibility;
  late int _sortColumnIndex;
  late bool _sortAscending;

  // контроллеры для поиска по паттерну в таблице
  late TextEditingController _dateSearchController;
  late TextEditingController _zakazSearchController;
  late TextEditingController _zakazchikSearchController;
  late TextEditingController _kolichestvoSearchController;
  late TextEditingController _naznachenieTenSearchController;

  @override

  // инициализация контроллеров для поиска по паттерну в таблице
  void initState() {
    super.initState();
    _columnVisibility = List.filled(5, true);
    _sortColumnIndex = 0;
    _sortAscending = true;
    getBaseListModel();
    _dateSearchController = TextEditingController();
    _zakazSearchController = TextEditingController();
    _zakazchikSearchController = TextEditingController();
    _kolichestvoSearchController = TextEditingController();
    _naznachenieTenSearchController = TextEditingController();
  }

  getBaseListModel() async {
    baseListModelData = await BaseListGetApi().getBaseListModel();
    if (baseListModelData != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  void _sort<T>(Comparable<T> Function(BaseListModel d) getField,
      int columnIndex, bool ascending) {
    baseListModelData!.sort((a, b) {
      final aValue = getField(a);
      final bValue = getField(b);
      return ascending
          ? Comparable.compare(aValue, bValue)
          : Comparable.compare(bValue, aValue);
    });
    setState(() {
      _sortColumnIndex = columnIndex;
      _sortAscending = ascending;
    });
  }

  List<BaseListModel>? _filteredBaseListModelData() {
    var filteredData = baseListModelData;

    if (_dateSearchController.text.isNotEmpty) {
      filteredData = filteredData!
          .where((element) =>
              element.date?.toString().contains(_dateSearchController.text) ??
              false)
          .toList();
    }

    if (_zakazSearchController.text.isNotEmpty) {
      filteredData = filteredData!
          .where((element) =>
              element.zakazN?.contains(_zakazSearchController.text) ?? false)
          .toList();
    }

    if (_zakazchikSearchController.text.isNotEmpty) {
      filteredData = filteredData!
          .where((element) =>
              element.zakazchik?.contains(_zakazchikSearchController.text) ??
              false)
          .toList();
    }

    if (_kolichestvoSearchController.text.isNotEmpty) {
      filteredData = filteredData!
          .where((element) =>
              element.kolichestvo
                  ?.contains(_kolichestvoSearchController.text) ??
              false)
          .toList();
    }

    if (_naznachenieTenSearchController.text.isNotEmpty) {
      filteredData = filteredData!
          .where((element) =>
              element.naznachenieTen
                  ?.contains(_naznachenieTenSearchController.text) ??
              false)
          .toList();
    }

    return filteredData;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: ProizvodstvoButton(),
      body: Column(
        children: [
          ColumnVisibilityControls(
            initialVisibility: _columnVisibility,
            onVisibilityChanged: (visibility) {
              setState(() {
                _columnVisibility = visibility;
              });
            },
          ),
          Row(
            children: [
              if (_columnVisibility[0])
                Expanded(
                  child: TextField(
                    controller: _dateSearchController,
                    decoration: InputDecoration(
                      hintText: 'Поиск по дате',
                    ),
                    onChanged: (text) {
                      setState(() {});
                    },
                  ),
                ),
              if (_columnVisibility[1])
                Expanded(
                  child: TextField(
                    controller: _zakazSearchController,
                    decoration: InputDecoration(
                      hintText: 'Поиск по заказу',
                    ),
                    onChanged: (text) {
                      setState(() {});
                    },
                  ),
                ),
              if (_columnVisibility[2])
                Expanded(
                  child: TextField(
                    controller: _zakazchikSearchController,
                    decoration: InputDecoration(
                      hintText: 'Поиск по заказчику',
                    ),
                    onChanged: (text) {
                      setState(() {});
                    },
                  ),
                ),
              if (_columnVisibility[3])
                Expanded(
                  child: TextField(
                    controller: _kolichestvoSearchController,
                    decoration: InputDecoration(
                      hintText: 'Поиск по количеству',
                    ),
                    onChanged: (text) {
                      setState(() {});
                    },
                  ),
                ),
              if (_columnVisibility[4])
                Expanded(
                  child: TextField(
                    controller: _naznachenieTenSearchController,
                    decoration: InputDecoration(
                      hintText: 'Поиск по назначению',
                    ),
                    onChanged: (text) {
                      setState(() {});
                    },
                  ),
                ),
            ],
          ),
          if (isLoaded &&
              baseListModelData != null &&
              baseListModelData!.isNotEmpty)
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  sortColumnIndex: _sortColumnIndex,
                  sortAscending: _sortAscending,
                  columns: [
                    if (_columnVisibility[0])
                      DataColumn(
                        label: Text('Дата'),
                        onSort: (columnIndex, ascending) {
                          _sort((d) => d.date!, columnIndex, ascending);
                        },
                      ),
                    if (_columnVisibility[1])
                      DataColumn(
                        label: Text('Заказ'),
                        onSort: (columnIndex, ascending) {
                          _sort((d) => d.zakazN ?? '', columnIndex, ascending);
                        },
                      ),
                    if (_columnVisibility[2])
                      DataColumn(
                        label: Text('Заказчик'),
                        onSort: (columnIndex, ascending) {
                          _sort(
                              (d) => d.zakazchik ?? '', columnIndex, ascending);
                        },
                      ),
                    if (_columnVisibility[3])
                      DataColumn(
                        label: Text('Количество'),
                        onSort: (columnIndex, ascending) {
                          _sort((d) => int.parse(d.kolichestvo ?? ''),
                              columnIndex, ascending);
                        },
                      ),
                    if (_columnVisibility[4])
                      DataColumn(
                        label: Text('Назначение'),
                        onSort: (columnIndex, ascending) {
                          _sort((d) => d.naznachenieTen ?? '', columnIndex,
                              ascending);
                        },
                      ),
                  ],
                  rows: _filteredBaseListModelData()!.map((data) {
                    return DataRow(
                      cells: [
                        if (_columnVisibility[0])
                          DataCell(
                              Text(data.date!.toString().substring(0, 10))),
                        if (_columnVisibility[1])
                          DataCell(Text(data.zakazN ?? '')),
                        if (_columnVisibility[2])
                          DataCell(Text(data.zakazchik ?? '')),
                        if (_columnVisibility[3])
                          DataCell(Text(data.kolichestvo ?? '')),
                        if (_columnVisibility[4])
                          DataCell(Text(data.naznachenieTen ?? '')),
                      ],
                    );
                  }).toList(),
                ),
              ),
            ),
          if (!isLoaded)
            Expanded(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          if (isLoaded &&
              baseListModelData != null &&
              baseListModelData!.isEmpty)
            Expanded(
              child: Center(
                child: Text('Данные отсутствуют'),
              ),
            ),
        ],
      ),
    );
  }
}

// виджет для отображения и управления видимостью колонок
class ColumnVisibilityControls extends StatefulWidget {
  final List<bool> initialVisibility;
  final Function(List<bool>) onVisibilityChanged;

  const ColumnVisibilityControls({
    required this.initialVisibility,
    required this.onVisibilityChanged,
  });

  @override
  _ColumnVisibilityControlsState createState() =>
      _ColumnVisibilityControlsState();
}

class _ColumnVisibilityControlsState extends State<ColumnVisibilityControls> {
  late List<bool> _visibility;

  @override
  void initState() {
    super.initState();
    _visibility = widget.initialVisibility;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            Text('Дата'),
            Switch(
              value: _visibility[0],
              onChanged: (value) {
                setState(() {
                  _visibility[0] = value;
                  widget.onVisibilityChanged(_visibility);
                });
              },
            ),
          ],
        ),
        Column(
          children: [
            Text('Заказ'),
            Switch(
              value: _visibility[1],
              onChanged: (value) {
                setState(() {
                  _visibility[1] = value;
                  widget.onVisibilityChanged(_visibility);
                });
              },
            ),
          ],
        ),
        Column(
          children: [
            Text('Заказчик'),
            Switch(
              value: _visibility[2],
              onChanged: (value) {
                setState(() {
                  _visibility[2] = value;
                  widget.onVisibilityChanged(_visibility);
                });
              },
            ),
          ],
        ),
        Column(
          children: [
            Text('Количество'),
            Switch(
              value: _visibility[3],
              onChanged: (value) {
                setState(() {
                  _visibility[3] = value;
                  widget.onVisibilityChanged(_visibility);
                });
              },
            ),
          ],
        ),
        Column(
          children: [
            Text('Назначение ТЭНа'),
            Switch(
              value: _visibility[4],
              onChanged: (value) {
                setState(() {
                  _visibility[4] = value;
                  widget.onVisibilityChanged(_visibility);
                });
              },
            ),
          ],
        ),
      ],
    );
  }
}


























// старый listview

// class ProizvodstvoList extends StatelessWidget {
//   const ProizvodstvoList({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<ProizvodstvoBloc, ProizvodstvoState>(
//       builder: (context, state) {
//         if (state is ProizvodstvoLoadedState) {
//           return Scaffold(
//             body: Center(
//               child:
//                   ProizvodstvoListView(zadelka5List: state.loadedZadelka5List),
//             ),
//             floatingActionButton: ProizvodstvoButton(),
//           );
//         } else if (state is ProizvodstvoLoadingState) {
//           return const SizedBox(
//             child: Text('ProizvodstvoLoadingState'),
//           );
//         } else {
//           return const Center(
//             child: Text('ProizvodstvoErrorState'),
//           );
//         }
//       },
//     );
//   }
// }

// class ProizvodstvoListView extends StatelessWidget {
//   final List<Zadelka5Model> zadelka5List;

//   const ProizvodstvoListView({Key? key, required this.zadelka5List})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return ListView.separated(
//       itemCount: zadelka5List.length,
//       separatorBuilder: (BuildContext context, int index) => Divider(),
//       itemBuilder: (context, index) => ListTile(
//         leading: Text(
//           'ID:${zadelka5List[index].id_k_sterzhen_zadelka}',
//           style: const TextStyle(fontWeight: FontWeight.bold),
//         ),
//         title: Column(
//           children: [
//             const Text(
//               'DATA',
//               style: TextStyle(fontWeight: FontWeight.bold),
//             ),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Text(
//                   'Букыенное обозначение: ${zadelka5List[index].bukvennoe_oboznachenie}',
//                   style: const TextStyle(fontStyle: FontStyle.italic),
//                 ),
//                 Text(
//                   'Глубина: ${zadelka5List[index].glubina_zadelki}',
//                   style: const TextStyle(fontStyle: FontStyle.italic),
//                 ),
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
