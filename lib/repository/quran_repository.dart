import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:ngajidong/model/ayat_model.dart';
import 'package:ngajidong/model/doa_model.dart';
import 'package:ngajidong/model/dzikir_detail_model.dart';
import 'package:ngajidong/model/dzikir_model.dart';
import 'package:ngajidong/model/surah_model.dart';
import 'package:http/http.dart' as http;


class QuranRepository{
  Future<List<Surah>> getListSurah() async {
    String data = await rootBundle.loadString('assets/data/list-surah.json');

    return surahFromJson(data);
  }

  Future<AyatModel> getListAyat(String id_surah) async {
    String url = "https://equran.id/api/surat/$id_surah";
    final response = await http.get(Uri.parse(url));

    if(response.statusCode == 200) {
      final body = jsonDecode(response.body);
      return AyatModel.fromJson(body);
    }
    throw Exception("error");
  }

    Future<List<Doa>> getListDoa() async {
    String data = await rootBundle.loadString('assets/data/list-doa.json');

    return doaFromJson(data);
  }

  Future<List<DzikirUmum>> getListDzikirUmum() async {
    String data = await rootBundle.loadString('assets/data/list-dzikir.json');

    return dzikirumumFromJson(data);
  }
  Future<DzikirDetail> getListDzikirDetail(String id_dzikir) async {
    String data = await rootBundle.loadString('assets/data/list-dzikir_detail.json');

    final List<dynamic> decodedData = jsonDecode(data);

    Map<String, dynamic>? specificData = decodedData.firstWhere((element) => element['id'] == id_dzikir, orElse: () => null);

    if(specificData != null) {
      return DzikirDetail.fromJson(specificData);
    }else{
      throw Exception('Doa dengan id $id_dzikir tidak ditemukan');
    }
  }
}