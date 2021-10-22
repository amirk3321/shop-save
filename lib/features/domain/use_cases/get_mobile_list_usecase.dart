


import 'package:shopsave/features/data/models/mobile_list_model.dart';
import 'package:shopsave/features/domain/repositories/repository.dart';

class GetMobileListUseCase{
  final Repository repository;

  GetMobileListUseCase({required this.repository});

  Future<List<MobileListModel>>call()async{
    return repository.getMobileList();
  }
}