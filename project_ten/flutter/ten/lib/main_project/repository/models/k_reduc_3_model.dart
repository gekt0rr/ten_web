import 'dart:convert';

List<KReduc3> kReduc3FromJson(String str) =>
    List<KReduc3>.from(json.decode(str).map((x) => KReduc3.fromJson(x)));

String kReduc3ToJson(List<KReduc3> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class KReduc3 {
  final double koefficientReducirovaniya;

  KReduc3({
    required this.koefficientReducirovaniya,
  });

  factory KReduc3.fromJson(Map<String, dynamic> json) => KReduc3(
        koefficientReducirovaniya:
            json["koefficient_reducirovaniya"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "koefficient_reducirovaniya": koefficientReducirovaniya,
      };
}
