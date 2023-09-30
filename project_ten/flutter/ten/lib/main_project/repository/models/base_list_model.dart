import 'dart:convert';

List<BaseListModel> baseListModelFromJson(String str) =>
    List<BaseListModel>.from(
        json.decode(str).map((x) => BaseListModel.fromJson(x)));

String baseListModelToJson(List<BaseListModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BaseListModel {
  final DateTime? date;
  final String? zakazN;
  final String? zakazchik;
  final String? kolichestvo;
  final String? naznachenieTen;
  final String? dlinaTenSm;
  final String? bukvennoeoboznachenie;
  final String? material;
  final String? diametrzagotovki;
  final String? tolshinastenki;
  final String? shelldiameter;
  final String? diameterofthetenbillet;
  final String? moshnostKvt;
  final String? rabSreda;
  final String? napryazhenieV;
  final String? dlinaZagotovkiMm;
  final String? dlinaPosleReducirovMm;
  final String? koefficientReducirovaniya;
  final String? diametrOpravkiMm;
  final String? rezbaDiametrKontaktnogoSterzhnyaMm;
  final String? dlinaKontaktnogoSterzhnyaMm;
  final String? materialKontaktnogoSterzhnya;

  BaseListModel({
    this.date,
    this.zakazN,
    this.zakazchik,
    this.kolichestvo,
    this.naznachenieTen,
    this.dlinaTenSm,
    this.bukvennoeoboznachenie,
    this.material,
    this.diametrzagotovki,
    this.tolshinastenki,
    this.shelldiameter,
    this.diameterofthetenbillet,
    this.moshnostKvt,
    this.rabSreda,
    this.napryazhenieV,
    this.dlinaZagotovkiMm,
    this.dlinaPosleReducirovMm,
    this.koefficientReducirovaniya,
    this.diametrOpravkiMm,
    this.rezbaDiametrKontaktnogoSterzhnyaMm,
    this.dlinaKontaktnogoSterzhnyaMm,
    this.materialKontaktnogoSterzhnya,
  });

  factory BaseListModel.fromJson(Map<String, dynamic> json) => BaseListModel(
        date: json["date"] != null ? DateTime.parse(json["date"]) : null,
        zakazN: json["zakaz_n"],
        zakazchik: json["zakazchik"],
        kolichestvo: json["kolichestvo"],
        naznachenieTen: json["naznachenie_ten"],
        dlinaTenSm: json["dlina_ten_sm"],
        bukvennoeoboznachenie: json["bukvennoeoboznachenie"],
        material: json["material"],
        diametrzagotovki: json["diametrzagotovki"],
        tolshinastenki: json["tolshinastenki"],
        shelldiameter: json["shelldiameter"],
        diameterofthetenbillet: json["diameterofthetenbillet"],
        moshnostKvt: json["moshnost_kvt"],
        rabSreda: json["rab_sreda"],
        napryazhenieV: json["napryazhenie_v"],
        dlinaZagotovkiMm: json["dlina_zagotovki_mm"],
        dlinaPosleReducirovMm: json["dlina_posle_reducirov_mm"],
        koefficientReducirovaniya: json["koefficient_reducirovaniya"],
        diametrOpravkiMm: json["diametr_opravki_mm"],
        rezbaDiametrKontaktnogoSterzhnyaMm:
            json["rezba_diametr_kontaktnogo_sterzhnya_mm"],
        dlinaKontaktnogoSterzhnyaMm: json["dlina_kontaktnogo_sterzhnya_mm"],
        materialKontaktnogoSterzhnya: json["material_kontaktnogo_sterzhnya"],
      );

  Map<String, dynamic> toJson() => {
        "date": date?.toIso8601String(),
        "zakaz_n": zakazN,
        "zakazchik": zakazchik,
        "kolichestvo": kolichestvo,
        "naznachenie_ten": naznachenieTen,
        "dlina_ten_sm": dlinaTenSm,
        "bukvennoeoboznachenie": bukvennoeoboznachenie,
        "material": material,
        "diametrzagotovki": diametrzagotovki,
        "tolshinastenki": tolshinastenki,
        "shelldiameter": shelldiameter,
        "diameterofthetenbillet": diameterofthetenbillet,
        "moshnost_kvt": moshnostKvt,
        "rab_sreda": rabSreda,
        "napryazhenie_v": napryazhenieV,
        "dlina_zagotovki_mm": dlinaZagotovkiMm,
        "dlina_posle_reducirov_mm": dlinaPosleReducirovMm,
        "koefficient_reducirovaniya": koefficientReducirovaniya,
        "diametr_opravki_mm": diametrOpravkiMm,
        "rezba_diametr_kontaktnogo_sterzhnya_mm":
            rezbaDiametrKontaktnogoSterzhnyaMm,
        "dlina_kontaktnogo_sterzhnya_mm": dlinaKontaktnogoSterzhnyaMm,
        "material_kontaktnogo_sterzhnya": materialKontaktnogoSterzhnya,
      };
}
