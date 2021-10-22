


import 'package:shopsave/features/data/models/mobile_list_images_model.dart';
import 'package:shopsave/features/data/models/mobile_list_model.dart';
import 'package:shopsave/features/domain/entities/mobile_item_entity.dart';
import 'package:shopsave/features/domain/repositories/repository.dart';

class GetMobileListImagesUseCase{
  final Repository repository;

  GetMobileListImagesUseCase({required this.repository});

  Future<List<MobileListImagesModel>>call(MobileItemEntity mobileItem)async{
    return repository.getMobileItemImage(mobileItem);
  }
}