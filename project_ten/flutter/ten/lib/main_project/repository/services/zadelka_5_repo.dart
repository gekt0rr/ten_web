import 'package:ten/main_project/repository/models/zadelka_5_list.dart';
import 'package:ten/main_project/repository/services/zadelka_5_provider.dart';

class Zadelka5Repo {
  final Zadelka5Provider _zadelka5Provider = Zadelka5Provider();

  Future<List<Zadelka5Model>> getAllZadelka5() =>
      _zadelka5Provider.getZadelka5Model();
}
