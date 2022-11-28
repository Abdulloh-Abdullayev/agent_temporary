class RemainsModel {
  int? id;
  String? name;
  int? count;
  String? imgUrl;

  RemainsModel({
    this.id,
    this.name,
    this.count,
    this.imgUrl,
  });
}

class RemainsCategoryModel {
  int? id;
  String? name;
  List<RemainsModel>? list;

  RemainsCategoryModel({
    this.id,
    this.name,
    this.list = const [],
  });
}
