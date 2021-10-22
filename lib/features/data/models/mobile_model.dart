import 'package:shopsave/features/domain/entities/mobile_item_entity.dart';

class MobileModel extends MobileItemEntity {
  MobileModel({
    int? id,
    final num? price,
    final String? thumbImageURL,
    final String? description,
    final int? itemId,
    final String? brand,
    final String? name,
    final num? rating,
    final bool? isFvt,
  }) : super(
          itemId: itemId,
          thumbImageURL: thumbImageURL,
          rating: rating,
          price: price,
          brand: brand,
          description: description,
          name: name,
          isFvt: isFvt,
        );

  static MobileModel fromJson(Map<String, dynamic> json) {
    return MobileModel(
      itemId: json['itemId'],
      thumbImageURL: json['thumbImageURL'],
      rating: json['rating'],
      price: json['price'],
      brand: json['brand'],
      description: json['description'],
      name: json['name'],
      isFvt: json['isFvt'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "itemId": itemId,
      "thumbImageURL": thumbImageURL,
      "rating": rating,
      "price": price,
      "brand": brand,
      "description": description,
      "name": name,
      "isFvt": isFvt,
    };
  }
}
