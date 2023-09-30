// import 'dart:convert';

// List<DiamTruby1> diamTruby1FromJson(String str) =>
//     List<DiamTruby1>.from(json.decode(str).map((x) => DiamTruby1.fromJson(x)));

// String diamTruby1ToJson(List<DiamTruby1> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DiamTruby1 {
  final double shellDiameter;
  final double diameterOfTheTenBillet;
  final int idDiamTruby;

  DiamTruby1({
    required this.shellDiameter,
    required this.diameterOfTheTenBillet,
    required this.idDiamTruby,
  });

  factory DiamTruby1.fromJson(Map<String, dynamic> json) => DiamTruby1(
        shellDiameter: json["shell_diameter"],
        diameterOfTheTenBillet: json["diameter_of_the_ten_billet"],
        idDiamTruby: json["id_diam_truby"],
      );

  Map<String, dynamic> toJson() => {
        "shell_diameter": shellDiameter,
        "diameter_of_the_ten_billet": diameterOfTheTenBillet,
        "id_diam_truby": idDiamTruby,
      };
}
