class Zagotovka2Model {
  // тут должны быть поля, которые будут приходить с сервера

  int diametrZagotovki;
  String material;
  double tolshinaStenki;
  int idZagotovka;

  // конструктор класса
  Zagotovka2Model(
      {required this.diametrZagotovki,
      required this.material,
      required this.tolshinaStenki,
      required this.idZagotovka});

  // фабричный метод, который создает экземпляр класса из Map
  factory Zagotovka2Model.fromJson(Map<String, dynamic> json) {
    return Zagotovka2Model(
      diametrZagotovki: json['diametr_zagotovki'],
      material: json['material'],
      tolshinaStenki: json['tolshina_stenki'],
      idZagotovka: json['id_zagotovka'],
    );
  }

  get materialZagotovka => null;

  // метод, который создает Map из экземпляра класса
  Map<String, dynamic> toJson() => {
        'diametr_zagotovki': diametrZagotovki,
        'material': material,
        'tolshina_stenki': tolshinaStenki,
        'id_zagotovka': idZagotovka
      };
}
