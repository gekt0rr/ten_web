class Zadelka5Model {
  final String bukvennoe_oboznachenie;
  final int glubina_zadelki;
  final int id_k_sterzhen_zadelka;

  Zadelka5Model({
    required this.bukvennoe_oboznachenie,
    required this.glubina_zadelki,
    required this.id_k_sterzhen_zadelka,
  });

  factory Zadelka5Model.fromJson(Map<String, dynamic> json) {
    return Zadelka5Model(
      bukvennoe_oboznachenie: json['bukvennoe_oboznachenie'],
      glubina_zadelki: json['glubina_zadelki_(mm)'],
      id_k_sterzhen_zadelka: json['id_k_sterzhen_zadelka'],
    );
  }
}
