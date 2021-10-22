

import 'package:shopsave/features/domain/entities/mobile_item_entity.dart';
import 'package:shopsave/features/domain/repositories/local_repository.dart';

class DeleteFvtUseCase{
  final LocalRepository localRepository;

  DeleteFvtUseCase({required this.localRepository});

  Future<void> call(MobileItemEntity mobileItem){
    return localRepository.deleteFvt(mobileItem);
  }
}