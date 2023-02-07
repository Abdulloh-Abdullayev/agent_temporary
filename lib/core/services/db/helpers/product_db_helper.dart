
class ProductDbHelper {
  static final String _id = 'id';
  static final String _name = 'name';
  static final String _categoryId = 'category_id';
  static final String _unitId = 'unit_id';
  static final String _quantityInPackage = 'quantity_in_package';

  static String productQuery(String tableName) =>
      'CREATE TABLE $tableName( $_id TEXT, $_name TEXT, $_categoryId TEXT,$_unitId TEXT, $_quantityInPackage INTEGER );';
}
