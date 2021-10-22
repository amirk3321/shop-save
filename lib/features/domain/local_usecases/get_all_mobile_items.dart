


import 'package:shopsave/features/domain/entities/mobile_item_entity.dart';
import 'package:shopsave/features/domain/repositories/local_repository.dart';

class GetAllMobileItemsUseCase{
  final LocalRepository localRepository;

  GetAllMobileItemsUseCase({required this.localRepository});

  Future<List<MobileItemEntity>> call(){
    return localRepository.getAllMobileItem();
  }
}