class MobileItemEntity {
  int id=0;
  final num? price;
  final String? thumbImageURL;
  final String? description;
  final int? itemId;
  final String? brand;
  final String? name;
  final num? rating;
  final bool? isFvt;

  MobileItemEntity({
    this.price,
    this.thumbImageURL,
    this.description,
    this.itemId,
    this.brand,
    this.name,
    this.rating,
    this.isFvt
  });
}
