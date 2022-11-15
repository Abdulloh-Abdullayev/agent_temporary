class RefundModel {
  int? id;
  String? name;
  int? count;
  String? imgUrl;

  RefundModel({
    this.id,
    this.name,
    this.count,
    this.imgUrl,
  });
}

class RefundCategoryModel {
  int? id;
  String? name;
  List<RefundModel>? list;

  RefundCategoryModel({
    this.id,
    this.name,
    this.list = const [],
  });
}
