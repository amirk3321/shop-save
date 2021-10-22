

import 'package:shopsave/features/domain/entities/mobile_item_entity.dart';
import 'package:shopsave/features/domain/repositories/local_repository.dart';

class AddFvtUseCase{
  final LocalRepository localRepository;

  AddFvtUseCase({required this.localRepository});

  Future<void> call(MobileItemEntity mobileItem){
    return localRepository.addFvt(mobileItem);
  }
}