class MobileListModel {
  final num? price;
  final String? thumbImageURL;
  final String? description;
  final int? id;
  final String? brand;
  final String? name;
  final num? rating;

  MobileListModel({
    this.price,
    this.thumbImageURL,
    this.description,
    this.id,
    this.brand,
    this.name,
    this.rating,
  });
  factory MobileListModel.fromJson(Map<String,dynamic> json){
    return MobileListModel(
        name: json['name'],
        id: json['id'],
        description: json['description'],
        brand: json['brand'],
        price: json['price'],
        rating: json['rating'],
        thumbImageURL: json['thumbImageURL']
    );
  }
}
