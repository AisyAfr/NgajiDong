import 'package:ngajidong/model/dzikir_model.dart';
import 'package:ngajidong/repository/quran_repository.dart';

class DzikirUmumViewModel {
  final QuranRepository _repository = QuranRepository();

  Future<List<DzikirUmum>> getListDzikirUmum() async => 
  await _repository.getListDzikirUmum();
}