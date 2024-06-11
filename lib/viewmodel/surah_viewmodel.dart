import 'package:ngajidong/model/surah_model.dart';
import 'package:ngajidong/repository/quran_repository.dart';

class SurahViewModel {
  final QuranRepository _repository = QuranRepository();

  Future<List<Surah>> getListSurah() async => 
  await _repository.getListSurah();
}