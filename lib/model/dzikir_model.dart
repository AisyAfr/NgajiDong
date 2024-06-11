import 'dart:convert';

List<DzikirUmum> dzikirumumFromJson(String str) => List<DzikirUmum>.from(
      json.decode(str).map(
            (x) => DzikirUmum.fromJson(x),
          ),
    );

class DzikirUmum {
  String? id;
  String? judul;

  DzikirUmum({this.id, this.judul});

  DzikirUmum.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    judul = json['judul'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['judul'] = this.judul;
    return data;
  }
}
