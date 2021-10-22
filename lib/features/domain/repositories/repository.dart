
import 'package:shopsave/features/data/models/mobile_list_images_model.dart';
import 'package:shopsave/features/data/models/mobile_list_model.dart';
import 'package:shopsave/features/domain/entities/mobile_item_entity.dart';

abstract class Repository {
  Future<List<MobileListModel>> getMobileList();
  Future<List<MobileListImagesModel>> getMobileItemImage(MobileItemEntity mobileItem);
}
