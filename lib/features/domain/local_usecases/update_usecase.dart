


import 'package:shopsave/features/domain/entities/mobile_item_entity.dart';
import 'package:shopsave/features/domain/repositories/local_repository.dart';

class UpdateFvtUseCase{

  final LocalRepository localRepository;

  UpdateFvtUseCase({required this.localRepository});

  Future<void> call(MobileItemEntity mobileItem){
    return localRepository.updateFvt(mobileItem);
  }
}