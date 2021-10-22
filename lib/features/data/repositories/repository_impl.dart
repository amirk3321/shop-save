import 'package:shopsave/features/data/data_sources/remote_data_source.dart';
import 'package:shopsave/features/data/models/mobile_list_images_model.dart';
import 'package:shopsave/features/data/models/mobile_list_model.dart';
import 'package:shopsave/features/domain/entities/mobile_item_entity.dart';
import 'package:shopsave/features/domain/repositories/repository.dart';

class RepositoryImpl implements Repository {
  final RemoteDataSource remoteDataSource;

  RepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<MobileListModel>> getMobileList() async =>
      remoteDataSource.getMobileList();

  @override
  Future<List<MobileListImagesModel>> getMobileItemImage(MobileItemEntity mobileItem) async =>
      remoteDataSource.getMobileItemImage(mobileItem);

}
