class RemainsModel {
  int? id;
  int? id_blok;
  String? name;
  int? count;
  String? imgUrl;

  RemainsModel({
    this.id,
    this.name,
    this.count,
    this.imgUrl,
    this.id_blok,
  });
}

class RemainsCategoryModel {
  int? id;
  int? id_blok;
  String? name;
  List<RemainsModel>? list;
  List<RemainsModel>? list_blok;

  RemainsCategoryModel({
    this.id,
    this.id_blok,
    this.name,
    this.list = const [],
    this.list_blok = const [],
  });
}
