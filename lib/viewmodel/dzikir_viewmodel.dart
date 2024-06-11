
import 'package:ngajidong/model/dzikir_detail_model.dart';
import 'package:ngajidong/repository/quran_repository.dart';

class DzikirViewModel {
  final QuranRepository _repository = QuranRepository();

  Future<DzikirDetail>  getListDzikirDetail(id_dzikir) async =>
  await _repository.getListDzikirDetail(id_dzikir);

}