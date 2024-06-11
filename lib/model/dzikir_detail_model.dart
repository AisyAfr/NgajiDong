import 'dart:convert';

List<DzikirDetail> dzikirdetailFromJson(String str) => List<DzikirDetail>.from(
      json.decode(str).map(
            (x) => DzikirDetail.fromJson(x),
          ),
    );

class DzikirDetail {
  String? id;
  String? title;
  List<Dzikir>? dzikir;

  DzikirDetail({this.id, this.title, this.dzikir});

  DzikirDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    if (json['dzikir'] != null) {
      dzikir = <Dzikir>[];
      json['dzikir'].forEach((v) {
        dzikir!.add(new Dzikir.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    if (this.dzikir != null) {
      data['dzikir'] = this.dzikir!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Dzikir {
  String? title;
  String? arabic;
  String? latin;
  String? translation;
  String? notes;
  String? fawaid;
  String? source;

  Dzikir(
      {this.title,
      this.arabic,
      this.latin,
      this.translation,
      this.notes,
      this.fawaid,
      this.source});

  Dzikir.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    arabic = json['arabic'];
    latin = json['latin'];
    translation = json['translation'];
    notes = json['notes'];
    fawaid = json['fawaid'];
    source = json['source'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['arabic'] = this.arabic;
    data['latin'] = this.latin;
    data['translation'] = this.translation;
    data['notes'] = this.notes;
    data['fawaid'] = this.fawaid;
    data['source'] = this.source;
    return data;
  }
}
