import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/zadelka_5_list.dart';

class Zadelka5Provider {
  Future<List<Zadelka5Model>> getZadelka5Model() async {
    final responseZadelka5Model =
        await http.get(Uri.parse('https://postgrest.zencha-ten.duckdns.org/k_sterzhen_zadelka_5'));

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
