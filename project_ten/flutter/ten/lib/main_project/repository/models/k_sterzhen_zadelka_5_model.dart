import 'dart:convert';

List<KSterzhenZadelka5> kSterzhenZadelka5FromJson(String str) =>
    List<KSterzhenZadelka5>.from(
        json.decode(str).map((x) => KSterzhenZadelka5.fromJson(x)));

String kSterzhenZadelka5ToJson(List<KSterzhenZadelka5> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class KSterzhenZadelka5 {
  final String bukvennoeOboznachenie;
  final int glubinaZadelkiMm;
  final int idKSterzhenZadelka;

  KSterzhenZadelka5({
    required this.bukvennoeOboznachenie,
    required this.glubinaZadelkiMm,
    required this.idKSterzhenZadelka,
  });

  factory KSterzhenZadelka5.fromJson(Map<String, dynamic> json) =>
      KSterzhenZadelka5(
        bukvennoeOboznachenie: json["bukvennoe_oboznachenie"],
        glubinaZadelkiMm: json["glubina_zadelki_(mm)"],
        idKSterzhenZadelka: json["id_k_sterzhen_zadelka"],
      );

  Map<String, dynamic> toJson() => {
        "bukvennoe_oboznachenie": bukvennoeOboznachenie,
        "glubina_zadelki_(mm)": glubinaZadelkiMm,
        "id_k_sterzhen_zadelka": idKSterzhenZadelka,
      };
}
