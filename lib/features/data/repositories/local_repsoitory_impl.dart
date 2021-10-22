


import 'package:sembast/src/api/v2/database.dart';
import 'package:shopsave/features/data/local_data_source/local_data_source.dart';
import 'package:shopsave/features/domain/entities/mobile_item_entity.dart';
import 'package:shopsave/features/domain/repositories/local_repository.dart';

class LocalRepositoryImpl implements LocalRepository{

  final LocalDataSource localDataSource;

  LocalRepositoryImpl({required this.localDataSource});

  @override
  Future<void> addFvt(MobileItemEntity mobileItem) async =>
      localDataSource.addFvt(mobileItem);

  @override
  Future<void> deleteFvt(MobileItemEntity mobileItem) async =>
      localDataSource.deleteFvt(mobileItem);

  @override
  Future<List<MobileItemEntity>> getAllMobileItem() async =>
      localDataSource.getAllMobileItem();

  @override
  Future<Database> openDatabase() async =>
      localDataSource.openDatabase();

  @override
  Future<void> updateFvt(MobileItemEntity mobileItem) async =>
      localDataSource.updateFvt(mobileItem);

}