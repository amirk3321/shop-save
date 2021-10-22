



import 'package:sembast/sembast.dart';
import 'package:shopsave/features/domain/repositories/local_repository.dart';

class OpenDatabaseUseCase{
  final LocalRepository localRepository;

  OpenDatabaseUseCase({required this.localRepository});

  Future<Database> call(){
    return localRepository.openDatabase();
  }
}