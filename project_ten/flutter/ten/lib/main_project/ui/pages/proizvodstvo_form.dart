import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:ten/main_project/repository/models/base_list_model.dart';
import 'package:ten/main_project/repository/models/diam_truby_1_model.dart';
import 'package:ten/main_project/repository/models/zagotovka_2_model.dart';
import 'package:ten/main_project/ui/pages/proizvodstvo_action_button.dart';

import '../../repository/models/k_reduc_3_model.dart';
import '../../repository/models/k_sterzhen_zadelka_5_model.dart';
import '../../repository/services/zagotovka_2_api.dart';

class ProizvodstvoForm extends StatefulWidget {
  const ProizvodstvoForm({Key? key}) : super(key: key);

  @override
  State<ProizvodstvoForm> createState() => _ProizvodstvoFormState();
}

class _ProizvodstvoFormState extends State<ProizvodstvoForm> {
  final _formKey = GlobalKey<FormBuilderState>();

  // экземпляры классов для запросов
  final zagotovka2Api = Zagotovka2Api();
  final baseListApi = BaseListApi();
  final diamTruby1Api = DiamTruby1Api();
  final kReduc3Api = KReduc3Api();
  final kSterzhenZadelka5Api = KSterzhenZadelka5Api();

  // zagotovka2 контроллеры
  final TextEditingController _diameterController = TextEditingController();
  final TextEditingController _materialController = TextEditingController();
  final TextEditingController _thicknessController = TextEditingController();

  // diam_truby_1 контроллеры
  final TextEditingController _shellDiameter = TextEditingController();
  final TextEditingController _diameterOfTheTenBillet = TextEditingController();

  // k_reduc_3 контроллеры
  final TextEditingController _koefficientReducirovaniya =
      TextEditingController();

  // k_sterzhen_zadelka_5 контроллеры
  final TextEditingController _bukvennoeOboznachenie = TextEditingController();
  final TextEditingController _glubinaZadelkiMm = TextEditingController();

  // контроллеры для неопределенных полей (zakaN, zakazchik, kolichestvo, naznachenieTen, dlinaTenSm, bukvennoeoboznachenie, moshnostKvt, rabSreda, napryazhenieV, dlinaZagotovkiMm, dlinaPosleReducirovMm, diametrOpravkiMm, rezbaDiametrKontaktnogoSterzhnyaMm, dlinaKontaktnogoSterzhnyaMm, materialKontaktnogoSterzhnya)
  final TextEditingController _zakazN = TextEditingController();
  final TextEditingController _zakazchik = TextEditingController();
  final TextEditingController _kolichestvo = TextEditingController();
  final TextEditingController _naznachenieTen = TextEditingController();
  final TextEditingController _dlinaTenSm = TextEditingController();
  final TextEditingController _bukvennoeoboznachenie = TextEditingController();
  final TextEditingController _moshnostKvt = TextEditingController();
  final TextEditingController _rabSreda = TextEditingController();
  final TextEditingController _napryazhenieV = TextEditingController();
  final TextEditingController _dlinaZagotovkiMm = TextEditingController();
  final TextEditingController _dlinaPosleReducirovMm = TextEditingController();
  final TextEditingController _diametrOpravkiMm = TextEditingController();
  final TextEditingController _rezbaDiametrKontaktnogoSterzhnyaMm =
      TextEditingController();
  final TextEditingController _dlinaKontaktnogoSterzhnyaMm =
      TextEditingController();
  final TextEditingController _materialKontaktnogoSterzhnya =
      TextEditingController();

  @override
  void dispose() {
    baseListApi.baselistapidispose();
    super.dispose();
  }

  // отрправка данных на сервер
  void _submitForm() async {
    if (_formKey.currentState!.saveAndValidate()) {
      // отправка данных на сервер
      await baseListApi.postBaseListModel(
        BaseListModel(
          date: DateTime.now(),
          zakazN: _zakazN.text,
          zakazchik: _zakazchik.text,
          kolichestvo: _kolichestvo.text,
          naznachenieTen: _naznachenieTen.text,
          dlinaTenSm: _dlinaTenSm.text,
          bukvennoeoboznachenie: _bukvennoeoboznachenie.text,
          moshnostKvt: _moshnostKvt.text,
          rabSreda: _rabSreda.text,
          napryazhenieV: _napryazhenieV.text,
          dlinaZagotovkiMm: _dlinaZagotovkiMm.text,
          dlinaPosleReducirovMm: _dlinaPosleReducirovMm.text,
          diametrOpravkiMm: _diametrOpravkiMm.text,
          rezbaDiametrKontaktnogoSterzhnyaMm:
              _rezbaDiametrKontaktnogoSterzhnyaMm.text,
          dlinaKontaktnogoSterzhnyaMm: _dlinaKontaktnogoSterzhnyaMm.text,
          materialKontaktnogoSterzhnya: _materialKontaktnogoSterzhnya.text,
          koefficientReducirovaniya: _koefficientReducirovaniya.text,
          shelldiameter: _shellDiameter.text,
          diameterofthetenbillet: _diameterOfTheTenBillet.text,
          material: _materialController.text,
          diametrzagotovki: _diameterController.text,
          tolshinastenki: _thicknessController.text,
        ),
      );
      // очистка полей
      // _materialController.clear();
      // _diameterController.clear();
      // _thicknessController.clear();
    }
  }

// фильтрация diam_truby_1
  List<DiamTruby1> filterDiamTruby1Models(List<DiamTruby1> models,
      String shellDiameter, String diameterOfTheTenBillet) {
    return models.where((model) {
      final shellDiameterMatch = shellDiameter.isEmpty ||
          model.shellDiameter.toString().contains(shellDiameter);
      final diameterOfTheTenBilletMatch = diameterOfTheTenBillet.isEmpty ||
          model.diameterOfTheTenBillet
              .toString()
              .contains(diameterOfTheTenBillet);
      return shellDiameterMatch && diameterOfTheTenBilletMatch;
    }).toList();
  }

// фильтрация k_sterzhen_zadelka_5
  List<KSterzhenZadelka5> filterKSterzhenZadelka5Models(
      List<KSterzhenZadelka5> models,
      String bukvennoeOboznachenie,
      String glubinaZadelkiMm) {
    return models.where((model) {
      final bukvennoeOboznachenieMatch = bukvennoeOboznachenie.isEmpty ||
          model.bukvennoeOboznachenie
              .toLowerCase()
              .contains(bukvennoeOboznachenie.toLowerCase());
      final glubinaZadelkiMmMatch = glubinaZadelkiMm.isEmpty ||
          model.glubinaZadelkiMm.toString().contains(glubinaZadelkiMm);
      return bukvennoeOboznachenieMatch && glubinaZadelkiMmMatch;
    }).toList();
  }

// фильтрация zagotovka2
  List<Zagotovka2Model> filterZagotovka2Models(List<Zagotovka2Model> models,
      String material, String diameter, String thickness) {
    return models.where((model) {
      final materialMatch = material.isEmpty ||
          model.material.toLowerCase().contains(material.toLowerCase());
      final diameterMatch = diameter.isEmpty ||
          model.diametrZagotovki.toString().contains(diameter);
      final thicknessMatch = thickness.isEmpty ||
          model.tolshinaStenki.toString().contains(thickness);
      return materialMatch && diameterMatch && thicknessMatch;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: const ProizvodstvoButton(),
      body: Center(
        child: FormBuilder(
          key: _formKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(50.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  //форма для k_reduc_3
                  Column(
                    children: [
                      TypeAheadField(
                        textFieldConfiguration: TextFieldConfiguration(
                          decoration: InputDecoration(
                            labelText: 'Коэффициент редуцирования',
                          ),
                          controller: _koefficientReducirovaniya,
                        ),
                        suggestionsCallback: (pattern) async {
                          final kReduc3ModelList =
                              await kReduc3Api.getKReduc3();
                          Iterable<KReduc3> filteredModels = kReduc3ModelList!;

                          if (_koefficientReducirovaniya.text.isNotEmpty) {
                            filteredModels = filteredModels.where((model) =>
                                model.koefficientReducirovaniya.toString() ==
                                _koefficientReducirovaniya.text);
                          }

                          final uniqueKoefficientReducirovaniya = filteredModels
                              .map((model) => model.koefficientReducirovaniya)
                              .toSet();

                          return uniqueKoefficientReducirovaniya
                              .map((koefficientReducirovaniya) =>
                                  koefficientReducirovaniya.toString())
                              .toList();
                        },
                        itemBuilder: (context, suggestion) {
                          return ListTile(
                            title: Text(suggestion),
                          );
                        },
                        onSuggestionSelected: (suggestion) {
                          _koefficientReducirovaniya.text =
                              suggestion.toString();
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  // форма для k_sterzhen_zadelka_5
                  Column(
                    children: [
                      TypeAheadFormField(
                        textFieldConfiguration: TextFieldConfiguration(
                          decoration: InputDecoration(
                            labelText: 'Буквенное обозначение',
                          ),
                          controller: _bukvennoeOboznachenie,
                        ),
                        suggestionsCallback: (pattern) async {
                          final kSterzhenZadelka5ModelList =
                              await kSterzhenZadelka5Api.getKSterzhenZadelka5();

                          final filteredModels = filterKSterzhenZadelka5Models(
                              kSterzhenZadelka5ModelList!,
                              _bukvennoeOboznachenie.text,
                              _glubinaZadelkiMm.text);

                          final uniqueBukvennoeOboznachenie = filteredModels
                              .map((model) => model.bukvennoeOboznachenie)
                              .toSet();

                          return uniqueBukvennoeOboznachenie
                              .map((bukvennoeOboznachenie) =>
                                  bukvennoeOboznachenie.toString())
                              .toList();
                        },
                        itemBuilder: (context, suggestion) {
                          return ListTile(
                            title: Text(suggestion),
                          );
                        },
                        onSuggestionSelected: (suggestion) {
                          _bukvennoeOboznachenie.text = suggestion.toString();
                        },
                      ),
                      TypeAheadFormField(
                        textFieldConfiguration: TextFieldConfiguration(
                          decoration: InputDecoration(
                            labelText: 'Глубина заготовки, мм',
                          ),
                          controller: _glubinaZadelkiMm,
                        ),
                        suggestionsCallback: (pattern) async {
                          final kSterzhenZadelka5ModelList =
                              await kSterzhenZadelka5Api.getKSterzhenZadelka5();

                          final filteredModels = filterKSterzhenZadelka5Models(
                              kSterzhenZadelka5ModelList!,
                              _bukvennoeOboznachenie.text,
                              _glubinaZadelkiMm.text);

                          final uniqueGlubinaZadelkiMm = filteredModels
                              .map((model) => model.glubinaZadelkiMm)
                              .toSet();

                          return uniqueGlubinaZadelkiMm
                              .map((glubinaZadelkiMm) =>
                                  glubinaZadelkiMm.toString())
                              .toList();
                        },
                        itemBuilder: (context, suggestion) {
                          return ListTile(
                            title: Text(suggestion),
                          );
                        },
                        onSuggestionSelected: (suggestion) {
                          _glubinaZadelkiMm.text = suggestion.toString();
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  // форма для diam_truby_1
                  Column(
                    children: [
                      TypeAheadFormField(
                        textFieldConfiguration: TextFieldConfiguration(
                          decoration:
                              InputDecoration(labelText: 'Диаметр оболчки'),
                          controller: _shellDiameter,
                        ),
                        suggestionsCallback: (pattern) async {
                          final diamTruby1ModelList =
                              await diamTruby1Api.getDiamTruby1();

                          final filteredModels = filterDiamTruby1Models(
                              diamTruby1ModelList!,
                              _shellDiameter.text,
                              _diameterOfTheTenBillet.text);

                          final uniqueShellDiameter = filteredModels
                              .map((model) => model.shellDiameter)
                              .toSet();

                          return uniqueShellDiameter
                              .map((shellDiameter) => shellDiameter.toString())
                              .toList();
                        },
                        itemBuilder: (context, suggestion) {
                          return ListTile(
                            title: Text(suggestion),
                          );
                        },
                        onSuggestionSelected: (suggestion) {
                          _shellDiameter.text = suggestion.toString();
                        },
                      ),
                      TypeAheadFormField(
                        textFieldConfiguration: TextFieldConfiguration(
                          decoration: InputDecoration(
                              labelText: 'Диаметр заготовки (мм)'),
                          controller: _diameterOfTheTenBillet,
                        ),
                        suggestionsCallback: (pattern) async {
                          final diamTruby1ModelList =
                              await diamTruby1Api.getDiamTruby1();

                          final filteredModels = filterDiamTruby1Models(
                              diamTruby1ModelList!,
                              _shellDiameter.text,
                              _diameterOfTheTenBillet.text);

                          final uniqueDiameterOfTheTenBillet = filteredModels
                              .map((model) => model.diameterOfTheTenBillet)
                              .toSet();

                          return uniqueDiameterOfTheTenBillet
                              .map((diameterOfTheTenBillet) =>
                                  diameterOfTheTenBillet.toString())
                              .toList();
                        },
                        itemBuilder: (context, suggestion) {
                          return ListTile(
                            title: Text(suggestion),
                          );
                        },
                        onSuggestionSelected: (suggestion) {
                          _diameterOfTheTenBillet.text = suggestion.toString();
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  // форма для zagotovka2
                  Column(
                    children: [
                      TypeAheadFormField(
                        textFieldConfiguration: TextFieldConfiguration(
                          decoration: InputDecoration(labelText: 'Материал'),
                          controller: _materialController,
                        ),
                        suggestionsCallback: (pattern) async {
                          final zagotovka2ModelList =
                              await zagotovka2Api.getZagotovka2Model();

                          final filteredModels = filterZagotovka2Models(
                            zagotovka2ModelList!,
                            _materialController.text,
                            _diameterController.text,
                            _thicknessController.text,
                          );

                          final uniqueMaterials = filteredModels
                              .map((model) => model.material)
                              .toSet()
                              .toList();

                          return uniqueMaterials
                              .where((material) => material
                                  .toLowerCase()
                                  .contains(pattern.toLowerCase()))
                              .toList();
                        },
                        itemBuilder: (context, suggestion) {
                          return ListTile(
                            title: Text(suggestion),
                          );
                        },
                        onSuggestionSelected: (suggestion) {
                          _materialController.text = suggestion as String;
                        },
                      ),

                      // фильтр по диаметру
                      TypeAheadFormField(
                        textFieldConfiguration: TextFieldConfiguration(
                          decoration: InputDecoration(labelText: 'Диаметр'),
                          controller: _diameterController,
                        ),
                        suggestionsCallback: (pattern) async {
                          final zagotovka2ModelList =
                              await zagotovka2Api.getZagotovka2Model();

                          final filteredModels = filterZagotovka2Models(
                            zagotovka2ModelList!,
                            _materialController.text,
                            _diameterController.text,
                            _thicknessController.text,
                          );

                          final uniqueDiameters = filteredModels
                              .map((model) => model.diametrZagotovki.toString())
                              .toSet()
                              .toList();

                          return uniqueDiameters
                              .where((diameter) => diameter.contains(pattern))
                              .toList();
                        },
                        itemBuilder: (context, suggestion) {
                          return ListTile(
                            title: Text(suggestion),
                          );
                        },
                        onSuggestionSelected: (suggestion) {
                          _diameterController.text = suggestion as String;
                        },
                      ),

                      // фильтр по толщине стенки
                      TypeAheadFormField(
                        textFieldConfiguration: TextFieldConfiguration(
                          decoration:
                              InputDecoration(labelText: 'Толщина стенки'),
                          controller: _thicknessController,
                        ),
                        suggestionsCallback: (pattern) async {
                          final zagotovka2ModelList =
                              await zagotovka2Api.getZagotovka2Model();

                          final filteredModels = filterZagotovka2Models(
                            zagotovka2ModelList!,
                            _materialController.text,
                            _diameterController.text,
                            _thicknessController.text,
                          );

                          final uniqueThicknesses = filteredModels
                              .map((model) => model.tolshinaStenki.toString())
                              .toSet()
                              .toList();

                          return uniqueThicknesses
                              .where((thickness) => thickness.contains(pattern))
                              .toList();
                        },
                        itemBuilder: (context, suggestion) {
                          return ListTile(
                            title: Text(suggestion),
                          );
                        },
                        onSuggestionSelected: (suggestion) {
                          _thicknessController.text = suggestion as String;
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 50),
                  // форма для неопределенных полей  (zakaN, zakazchik, kolichestvo, naznachenieTen, dlinaTenSm, bukvennoeoboznachenie, moshnostKvt, rabSreda, napryazhenieV, dlinaZagotovkiMm, dlinaPosleReducirovMm, diametrOpravkiMm, rezbaDiametrKontaktnogoSterzhnyaMm, dlinaKontaktnogoSterzhnyaMm, materialKontaktnogoSterzhnya)
                  Column(
                    children: [
                      // Заголовок
                      Title(
                        color: Colors.pink,
                        // сделаем жирный шрифт
                        child: Text(
                          'НЕОПРЕДЕЛЕННЫЕ ПОЛЯ',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(height: 20),
                      FormBuilderTextField(
                        name: 'zakazN',
                        controller: _zakazN,
                        decoration: InputDecoration(label: Text('zakazN')),
                      ),
                      FormBuilderTextField(
                        name: 'zakazchik',
                        decoration: InputDecoration(label: Text('zakazchik')),
                        controller: _zakazchik,
                      ),
                      FormBuilderTextField(
                          name: 'kolichestvo',
                          decoration:
                              InputDecoration(label: Text('kolichestvo')),
                          controller: _kolichestvo),
                      FormBuilderTextField(
                          name: 'naznachenieTen',
                          decoration:
                              InputDecoration(label: Text('naznachenieTen')),
                          controller: _naznachenieTen),
                      FormBuilderTextField(
                          name: 'dlinaTenSm',
                          decoration:
                              InputDecoration(label: Text('dlinaTenSm')),
                          controller: _dlinaTenSm),
                      FormBuilderTextField(
                          name: 'bukvennoeoboznachenie',
                          decoration: InputDecoration(
                              label: Text('bukvennoeoboznachenie')),
                          controller: _bukvennoeoboznachenie),
                      FormBuilderTextField(
                          name: 'moshnostKvt',
                          decoration:
                              InputDecoration(label: Text('moshnostKvt')),
                          controller: _moshnostKvt),
                      FormBuilderTextField(
                          name: 'rabSreda',
                          decoration: InputDecoration(label: Text('rabSreda')),
                          controller: _rabSreda),
                      FormBuilderTextField(
                          name: 'napryazhenieV',
                          decoration:
                              InputDecoration(label: Text('napryazhenieV')),
                          controller: _napryazhenieV),
                      FormBuilderTextField(
                          name: 'dlinaZagotovkiMm',
                          decoration:
                              InputDecoration(label: Text('dlinaZagotovkiMm')),
                          controller: _dlinaZagotovkiMm),
                      FormBuilderTextField(
                          name: 'dlinaPosleReducirovMm',
                          decoration: InputDecoration(
                              label: Text('dlinaPosleReducirovMm')),
                          controller: _dlinaPosleReducirovMm),
                      FormBuilderTextField(
                          name: 'diametrOpravkiMm',
                          decoration:
                              InputDecoration(label: Text('diametrOpravkiMm')),
                          controller: _diametrOpravkiMm),
                      FormBuilderTextField(
                          name: 'rezbaDiametrKontaktnogoSterzhnyaMm',
                          decoration: InputDecoration(
                              label:
                                  Text('rezbaDiametrKontaktnogoSterzhnyaMm')),
                          controller: _rezbaDiametrKontaktnogoSterzhnyaMm),
                      FormBuilderTextField(
                          name: 'dlinaKontaktnogoSterzhnyaMm',
                          decoration: InputDecoration(
                              label: Text('dlinaKontaktnogoSterzhnyaMm')),
                          controller: _dlinaKontaktnogoSterzhnyaMm),
                      FormBuilderTextField(
                          name: 'materialKontaktnogoSterzhnya',
                          decoration: InputDecoration(
                              label: Text('materialKontaktnogoSterzhnya')),
                          controller: _materialKontaktnogoSterzhnya),
                    ],
                  ),
                  SizedBox(height: 50),
                  // кнопки сброса и отправки
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            // Сброс формы
                            _formKey.currentState!.reset();
                          },
                          child: Text('Сбросить')),
                      SizedBox(width: 20),
                      ElevatedButton(
                        onPressed: _submitForm, //_submitForm,
                        child: Text('Отправить'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
