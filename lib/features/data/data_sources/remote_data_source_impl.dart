import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:shopsave/core/core_const.dart';
import 'package:shopsave/core/custom_exceptions.dart';

import 'package:shopsave/features/data/data_sources/remote_data_source.dart';
import 'package:shopsave/features/data/models/mobile_list_images_model.dart';
import 'package:shopsave/features/data/models/mobile_list_model.dart';
import 'package:shopsave/features/domain/entities/mobile_item_entity.dart';

class RemoteDataSourceImpl implements RemoteDataSource {
  final http.Client httpClient;

  //final http.Client httpClient1=http.Client();
  // final Dio dioClient;

  RemoteDataSourceImpl({required this.httpClient});

  //private endPoint Engine
  String _endPoint(String endPoint) => "$baseURL/$endPoint";

  // //headerOption
  // Map<String, String> get _headerOption => {"Content-Type": "application/json"};
  //

  @override
  Future<List<MobileListModel>> getMobileList() async{
    final String endPoint = "mobiles/";

    final response = await httpClient.get(Uri.parse(_endPoint(endPoint)));

    if (response.statusCode == 200) {
      final items=json.decode(response.body) as List;

      List<MobileListModel> itemData=items.map((singleItem) => MobileListModel.fromJson(singleItem)).toList();


      return itemData;
    } else {
      print(response.body);
      throw ServerException(message: json.decode(response.body)['status']);
    }

  }



  @override
  Future<List<MobileListImagesModel>> getMobileItemImage(MobileItemEntity mobileItem) async{
    final String endPoint = "mobiles/${mobileItem.itemId}/images/";


    final response = await httpClient.get(Uri.parse(_endPoint(endPoint)));


    if (response.statusCode == 200) {
      final items=json.decode(response.body) as List;

      List<MobileListImagesModel> itemData=items.map((singleItem) => MobileListImagesModel.fromJson(singleItem)).toList();


      return itemData;
    } else {
      print(response.body);
      throw ServerException(message: json.decode(response.body)['status']);
    }

  }

}
