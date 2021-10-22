class MobileListImagesModel {
  final int? mobile_id;
  final String? url;
  final int? id;

  MobileListImagesModel({
    this.mobile_id,
    this.url,
    this.id,
  });

  factory MobileListImagesModel.fromJson(Map<String, dynamic> json) {
    return MobileListImagesModel(
        mobile_id: json['mobile_id'],
        url: json['url'],
        id: json['id'],
    );
  }
}
