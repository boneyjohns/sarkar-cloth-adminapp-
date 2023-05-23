class ProductModel {
  final String doc;
  final String name;
  final String price;

  final List imagelist;

  ProductModel(
      {required this.name,
      required this.doc,
      required this.price,
      required this.imagelist});
  Map<String, dynamic> toJson() =>
      {'name': name, 'price': price, 'image': imagelist, 'doc': doc};

  static ProductModel fromJson(Map<String, dynamic> json) => ProductModel(
      name: json['name'],
      price: json['price'],
      doc: json['doc'],
      imagelist: json['image']);
}
