class RemainsModel {
  int? id;
  String? name;
  String? img;
  int? summa;
  int? blog;
  int? count;

  RemainsModel({
    this.id,
    this.name,
    this.img,
    this.summa,
    this.blog,
    this.count,
  });
}

class RemainsCategoryModel {
  int? id;
  String? name;
  List<RemainsModel>? list;

  RemainsCategoryModel({
    this.id,
    this.name,
    this.list,
  });
}
