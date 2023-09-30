// сервис  который будет получать данные из таблицы zagotovka_2 через API https://postgrest.zencha-ten.duckdns.org/zagotovka_2

import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../models/base_list_model.dart';
import '../models/diam_truby_1_model.dart';
import '../models/k_reduc_3_model.dart';
import '../models/k_sterzhen_zadelka_5_model.dart';
import '../models/zagotovka_2_model.dart';

// get запросы
class Zagotovka2Api {
  Future<List<Zagotovka2Model>?> getZagotovka2Model() async {
    var clientZagotovka2 = http.Client();
    var urlZagotovka2 = Uri.parse('https://postgrest.zencha-ten.duckdns.org/zagotovka_2');
    var responseZagotovka2Model = await clientZagotovka2.get(urlZagotovka2);

    if (responseZagotovka2Model.statusCode == 200) {
      final List<Zagotovka2Model> zagotovka2ApiJson =
          (json.decode(responseZagotovka2Model.body) as List)
              .map((json) => Zagotovka2Model.fromJson(json))
              .toList();
      return zagotovka2ApiJson;
    } else {
      throw const FormatException(
          'Ошибка в получении данных из таблицы zagotovka_2');
    }
  }
}

class DiamTruby1Api {
  Future<List<DiamTruby1>?> getDiamTruby1() async {
    var clientDiamTruby1 = http.Client();
    var urlDiamTruby1 = Uri.parse('https://postgrest.zencha-ten.duckdns.org/diam_truby_1');
    var responseDiamTruby1 = await clientDiamTruby1.get(urlDiamTruby1);

    if (responseDiamTruby1.statusCode == 200) {
      final List<DiamTruby1> diamTruby1ApiJson =
          (json.decode(responseDiamTruby1.body) as List)
              .map((json) => DiamTruby1.fromJson(json))
              .toList();
      return diamTruby1ApiJson;
    } else {
      throw const FormatException(
          'Ошибка в получении данных из таблицы diam_truby_1');
    }
  }
}

class KReduc3Api {
  Future<List<KReduc3>?> getKReduc3() async {
    var clientKReduc3 = http.Client();
    var urlKReduc3 = Uri.parse('https://postgrest.zencha-ten.duckdns.org/k_reduc_3');
    var responseKReduc3 = await clientKReduc3.get(urlKReduc3);

    if (responseKReduc3.statusCode == 200) {
      final List<KReduc3> kReduc3ApiJson =
          (json.decode(responseKReduc3.body) as List)
              .map((json) => KReduc3.fromJson(json))
              .toList();
      return kReduc3ApiJson;
    } else {
      throw const FormatException(
          'Ошибка в получении данных из таблицы k_reduc_3');
    }
  }
}

class KSterzhenZadelka5Api {
  Future<List<KSterzhenZadelka5>?> getKSterzhenZadelka5() async {
    var clientKSterzhenZadelka5 = http.Client();
    var urlKSterzhenZadelka5 =
        Uri.parse('https://postgrest.zencha-ten.duckdns.org/k_sterzhen_zadelka_5');
    var responseKSterzhenZadelka5 =
        await clientKSterzhenZadelka5.get(urlKSterzhenZadelka5);

    if (responseKSterzhenZadelka5.statusCode == 200) {
      final List<KSterzhenZadelka5> kSterzhenZadelka5ApiJson =
          (json.decode(responseKSterzhenZadelka5.body) as List)
              .map((json) => KSterzhenZadelka5.fromJson(json))
              .toList();
      return kSterzhenZadelka5ApiJson;
    } else {
      throw const FormatException(
          'Ошибка в получении данных из таблицы k_sterzhen_zadelka_5');
    }
  }
}

class BaseListGetApi {
  Future<List<BaseListModel>?> getBaseListModel() async {
    var clientGetBaseList = http.Client();
    var urlGetBaseList = Uri.parse('https://postgrest.zencha-ten.duckdns.org/base_list');
    var responseGetBaseListModel = await clientGetBaseList.get(urlGetBaseList);

    if (responseGetBaseListModel.statusCode == 200) {
      final List<BaseListModel> baseListApiJson =
          (json.decode(responseGetBaseListModel.body) as List)
              .map((json) => BaseListModel.fromJson(json))
              .toList();
      return baseListApiJson;
    } else {
      throw const FormatException(
          'Ошибка в получении данных из таблицы base_list');
    }
  }
}

// post запросы
class BaseListApi {
  var clientBaseList = http.Client();
  Future<List<BaseListModel>?> postBaseListModel(
      BaseListModel baseListModel) async {
    var urlBaseList = Uri.parse('https://postgrest.zencha-ten.duckdns.org/base_list');
    try {
      var responseBaseListModel = await clientBaseList.post(
        urlBaseList,
        body: jsonEncode(baseListModel.toJson()),
        headers: {'Content-Type': 'application/json'},
      );
      if (responseBaseListModel.statusCode == 201 ||
          responseBaseListModel.statusCode == 200) {
        print(responseBaseListModel.body);
      } else {
        throw FormatException(
            'Ошибка в получении данных из таблицы base_list: ${responseBaseListModel.statusCode}');
      }
      return null;
    } on SocketException {
      throw FormatException('Ошибка связи с сервером');
    }
  }

  void baselistapidispose() {
    clientBaseList.close();
  }
}
