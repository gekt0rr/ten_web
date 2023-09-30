// import 'package:flutter/material.dart';
// import 'package:ten/main_project/repository/models/zagotovka_2_model.dart';
// import 'package:ten/main_project/repository/services/zagotovka_2_api.dart';

// class ProizvodstvoForm extends StatefulWidget {
//   ProizvodstvoForm({Key? key}) : super(key: key);

//   @override
//   _ProizvodstvoFormState createState() => _ProizvodstvoFormState();
// }

// class _ProizvodstvoFormState extends State<ProizvodstvoForm> {
//   List<Zagotovka2Model>? zagotovka2ModelData;
//   var isLoaded = false;

//   @override
//   void initState() {
//     super.initState();

//     // получаем данные из таблицы zagotovka_2 через API
//     getZagotovka2Model();
//   }

//   getZagotovka2Model() async {
//     zagotovka2ModelData = await Zagotovka2Api().getZagotovka2Model();
//     if (zagotovka2ModelData != null) {
//       setState(() {
//         isLoaded = true;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Visibility(
//       visible: isLoaded,
//       replacement: const Center(
//         child: CircularProgressIndicator(),
//       ),
//       child: Container(
//         padding: EdgeInsets.all(10),
//         child: ListView.builder(
//           itemCount: zagotovka2ModelData?.length,
//           itemBuilder: (context, index) {
//             return Container(
//               margin: EdgeInsets.all(10),
//               decoration: BoxDecoration(),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
//                   Container(
//                     width: 50,
//                     height: 50,
//                     child: Center(
//                       child: Text(
//                         'ID:${zagotovka2ModelData?[index].idZagotovka}',
//                         style: TextStyle(fontSize: 16, color: Colors.black),
//                       ),
//                     ),
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(10),
//                         color: Colors.orange[300]),
//                   ),
//                   SizedBox(width: 10),
//                   SizedBox(width: 10),
//                   Text(
//                     'Материал:${zagotovka2ModelData?[index].material}',
//                     style: TextStyle(
//                       fontSize: 16,
//                     ),
//                   ),
//                   SizedBox(width: 10),
//                   Text(
//                     'Диаметр:${zagotovka2ModelData?[index].diametrZagotovki}',
//                     style: TextStyle(
//                       fontSize: 16,
//                     ),
//                   ),
//                   SizedBox(width: 10),
//                   Text(
//                     'Толщина:${zagotovka2ModelData?[index].tolshinaStenki}',
//                     style: TextStyle(
//                       fontSize: 16,
//                     ),
//                   )
//                 ],
//               ),
//             );
//           },
//         ),
//       ),
//     ));
//   }
// }
