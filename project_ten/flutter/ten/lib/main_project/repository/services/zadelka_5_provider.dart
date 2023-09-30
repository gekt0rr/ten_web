import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/zadelka_5_list.dart';

class Zadelka5Provider {
  Future<List<Zadelka5Model>> getZadelka5Model() async {
    final responseZadelka5Model =
        await http.get(Uri.parse('http://127.0.0.1:3000/k_sterzhen_zadelka_5'));

    if (responseZadelka5Model.statusCode == 200) {
      final List<Zadelka5Model> zadelka5ApiJson =
          (json.decode(responseZadelka5Model.body) as List)
              .map((json) => Zadelka5Model.fromJson(json))
              .toList();
      return zadelka5ApiJson;
    } else {
      throw const FormatException('Ошибка в получении данных');
    }
  }
}
