// import 'package:flutter/material.dart';
// import 'package:flutter_typeahead/flutter_typeahead.dart';

// import '../../../repository/models/zagotovka_2_model.dart';

// Widget zagotovka2form(BuildContext context) {
//   return Container(
//     child: Column(children: [
//       TypeAheadFormField(
//         textFieldConfiguration: TextFieldConfiguration(
//           decoration: InputDecoration(labelText: 'Материал'),
//           controller: _materialController,
//         ),
//         suggestionsCallback: (pattern) async {
//           final zagotovka2ModelList = await zagotovka2Api.getZagotovka2Model();
//           Iterable<Zagotovka2Model> filteredModels = zagotovka2ModelList!;

//           if (_diameterController.text.isNotEmpty) {
//             filteredModels = filteredModels.where((model) =>
//                 model.diametrZagotovki.toString() == _diameterController.text);
//           }

//           if (_thicknessController.text.isNotEmpty) {
//             filteredModels = filteredModels.where((model) =>
//                 model.tolshinaStenki.toString() == _thicknessController.text);
//           }

//           filteredModels = filteredModels
//               .where((model) => model.material.contains(pattern))
//               .toList();

//           final uniqueMaterials =
//               filteredModels.map((model) => model.material).toSet().toList();

//           return uniqueMaterials
//               .where((material) => material.contains(pattern))
//               .toList();
//         },
//         itemBuilder: (context, suggestion) {
//           return ListTile(
//             title: Text(suggestion),
//           );
//         },
//         onSuggestionSelected: (suggestion) {
//           _materialController.text = suggestion as String;
//         },
//       ),
//       // фильтр по диаметру
//       TypeAheadFormField(
//         textFieldConfiguration: TextFieldConfiguration(
//           decoration: InputDecoration(labelText: 'Диаметр'),
//           controller: _diameterController,
//         ),
//         suggestionsCallback: (pattern) async {
//           final zagotovka2ModelList = await zagotovka2Api.getZagotovka2Model();
//           Iterable<Zagotovka2Model> filteredModels = zagotovka2ModelList!;

//           if (_materialController.text.isNotEmpty) {
//             filteredModels = filteredModels
//                 .where((model) => model.material == _materialController.text);
//           }

//           if (_thicknessController.text.isNotEmpty) {
//             filteredModels = filteredModels.where((model) =>
//                 model.tolshinaStenki.toString() == _thicknessController.text);
//           }

//           filteredModels = filteredModels
//               .where((model) =>
//                   model.diametrZagotovki.toString().contains(pattern))
//               .toList();

//           final uniqueDiameters = filteredModels
//               .map((model) => model.diametrZagotovki.toString())
//               .toSet()
//               .toList();

//           return uniqueDiameters
//               .where((diameter) => diameter.contains(pattern))
//               .toList();
//         },
//         itemBuilder: (context, suggestion) {
//           return ListTile(
//             title: Text(suggestion),
//           );
//         },
//         onSuggestionSelected: (suggestion) {
//           _diameterController.text = suggestion as String;
//         },
//       ),
//       // фильтр по толщине стенки
//       TypeAheadFormField(
//         textFieldConfiguration: TextFieldConfiguration(
//           decoration: InputDecoration(labelText: 'Толщина стенки'),
//           controller: _thicknessController,
//         ),
//         suggestionsCallback: (pattern) async {
//           final zagotovka2ModelList = await zagotovka2Api.getZagotovka2Model();
//           Iterable<Zagotovka2Model> filteredModels = zagotovka2ModelList!;

//           if (_materialController.text.isNotEmpty) {
//             filteredModels = filteredModels
//                 .where((model) => model.material == _materialController.text);
//           }

//           if (_diameterController.text.isNotEmpty) {
//             filteredModels = filteredModels.where((model) =>
//                 model.diametrZagotovki.toString() == _diameterController.text);
//           }

//           filteredModels = filteredModels
//               .where(
//                   (model) => model.tolshinaStenki.toString().contains(pattern))
//               .toList();

//           final uniqueThicknesses = filteredModels
//               .map((model) => model.tolshinaStenki.toString())
//               .toSet()
//               .toList();

//           return uniqueThicknesses
//               .where((thickness) => thickness.contains(pattern))
//               .toList();
//         },
//         itemBuilder: (context, suggestion) {
//           return ListTile(
//             title: Text(suggestion),
//           );
//         },
//         onSuggestionSelected: (suggestion) {
//           _thicknessController.text = suggestion as String;
//         },
//       ),
//     ]),
//   );
// }
