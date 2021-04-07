class ProductModel {
/*{
    "id": "2",
    "title": "Investor Response Director",
    "image": "http://lorempixel.com/640/480/abstract",
    "price": "224.00",
    "description": "Legacy"
  },
  https://606cc5e5603ded00175029ee.mockapi.io/Product
  */
  String id;
  String title;
  String image;
  String description;
  String price;

  ProductModel({this.id, this.title, this.description, this.image, this.price});

  ProductModel.fromJson(Map<String, dynamic> json) {
    this.id = json['id'];
    this.title = json['title'];
    this.image = json['image'];
    this.description = json['description'];
    this.price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['image'] = this.image;
    data['description'] = this.description;
    data['price'] = this.price;
    data['id'] = this.id;
    return data;
  }
}
