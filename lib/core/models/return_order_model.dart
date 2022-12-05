class ReturnOrderModel {
  int? id;
  String? name;
  String? img;
  int? summa;
  int? blog;
  int? count;

  ReturnOrderModel({
    this.id,
    this.name,
    this.img,
    this.summa,
    this.blog,
    this.count,
  });
}

class ReturnOrderCategoryModel {
  int? id;
  String? name;
  List<ReturnOrderModel>? list;

  ReturnOrderCategoryModel({
    this.id,
    this.name,
    this.list,
  });
}
