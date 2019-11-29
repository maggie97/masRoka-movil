class Product{
  final int productId;
  final String name;
  final String routeImg;
  final int existences;

  Product({this.productId, this.name, this.routeImg, this.existences});


  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      productId: json['id'] as int,
      name: json['nombre'] as String,
      routeImg: json['title'] as String,
      existences: json['existences'] as int
    );
  }
}