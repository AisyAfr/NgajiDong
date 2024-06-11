import 'package:ngajidong/model/doa_model.dart';
import 'package:ngajidong/repository/quran_repository.dart';

class DoaViewModel {
  final QuranRepository _repository = QuranRepository();

  Future<List<Doa>> getListDoa() async => 
  await _repository.getListDoa();
}
