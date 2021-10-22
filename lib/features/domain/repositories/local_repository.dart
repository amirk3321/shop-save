



import 'package:sembast/sembast.dart';
import 'package:shopsave/features/domain/entities/mobile_item_entity.dart';

abstract class LocalRepository{
  Future<void> addFvt(MobileItemEntity mobileItem);
  Future<void> deleteFvt(MobileItemEntity mobileItem);
  Future<void> updateFvt(MobileItemEntity mobileItem);
  Future<List<MobileItemEntity>> getAllMobileItem();
  Future<Database> openDatabase();
}