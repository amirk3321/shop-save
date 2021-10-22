import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:shopsave/features/data/local_data_source/local_data_source.dart';
import 'package:shopsave/features/data/local_data_source/local_data_source.dart';
import 'package:shopsave/features/data/repositories/local_repsoitory_impl.dart';
import 'package:shopsave/features/domain/local_usecases/add_fvt_usecase.dart';
import 'package:shopsave/features/domain/local_usecases/add_fvt_usecase.dart';
import 'package:shopsave/features/domain/local_usecases/delete_fvt_usecase.dart';
import 'package:shopsave/features/domain/local_usecases/delete_fvt_usecase.dart';
import 'package:shopsave/features/domain/local_usecases/get_all_mobile_items.dart';
import 'package:shopsave/features/domain/local_usecases/get_all_mobile_items.dart';
import 'package:shopsave/features/domain/local_usecases/open_database_usecase.dart';
import 'package:shopsave/features/domain/local_usecases/open_database_usecase.dart';
import 'package:shopsave/features/domain/local_usecases/update_usecase.dart';
import 'package:shopsave/features/domain/local_usecases/update_usecase.dart';
import 'package:shopsave/features/domain/repositories/local_repository.dart';
import 'package:shopsave/features/domain/use_cases/get_mobile_list_images_usecase.dart';
import 'package:shopsave/features/domain/use_cases/get_mobile_list_images_usecase.dart';
import 'package:shopsave/features/domain/use_cases/get_mobile_list_usecase.dart';
import 'package:shopsave/features/domain/use_cases/get_mobile_list_usecase.dart';
import 'package:shopsave/features/presentation/cubit/mobile_fvt/mobile_fvt_cubit.dart';
import 'package:shopsave/features/presentation/cubit/mobile_fvt/mobile_fvt_cubit.dart';
import 'package:shopsave/features/presentation/cubit/mobile_list/mobile_list_cubit.dart';
import 'package:shopsave/features/presentation/cubit/mobile_list/mobile_list_cubit.dart';
import 'package:shopsave/features/presentation/cubit/mobile_list_images/mobile_list_images_cubit.dart';
import 'package:shopsave/features/presentation/cubit/mobile_list_images/mobile_list_images_cubit.dart';

import 'features/data/data_sources/remote_data_source.dart';
import 'features/data/data_sources/remote_data_source_impl.dart';
import 'features/data/local_data_source/local_data_source_impl.dart';
import 'features/domain/repositories/repository.dart';
import 'features/data/repositories/repository_impl.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //futures bloc
  sl.registerFactory<MobileListCubit>(
    () => MobileListCubit(
      getMobileListUseCase: sl.call(),
    ),
  );
  sl.registerFactory<MobileListImagesCubit>(
    () => MobileListImagesCubit(
      getMobileListImagesUseCase: sl.call(),
    ),
  );
  sl.registerFactory<MobileFvtCubit>(
    () => MobileFvtCubit(
      addFvtUseCase: sl.call(),
      deleteFvtUseCase: sl.call(),
      getAllMobileItemsUseCase: sl.call(),
      openDatabaseUseCase: sl.call(),
      updateFvtUseCase: sl.call(),
    ),
  );

  //useCases
  sl.registerLazySingleton<GetMobileListUseCase>(() => GetMobileListUseCase(
        repository: sl.call(),
      ));
  sl.registerLazySingleton<GetMobileListImagesUseCase>(
      () => GetMobileListImagesUseCase(
            repository: sl.call(),
          ));
  //local useCases
  sl.registerLazySingleton<AddFvtUseCase>(() => AddFvtUseCase(
        localRepository: sl.call(),
      ));
  sl.registerLazySingleton<DeleteFvtUseCase>(() => DeleteFvtUseCase(
        localRepository: sl.call(),
      ));
  sl.registerLazySingleton<GetAllMobileItemsUseCase>(
      () => GetAllMobileItemsUseCase(
            localRepository: sl.call(),
          ));
  sl.registerLazySingleton<OpenDatabaseUseCase>(() => OpenDatabaseUseCase(
        localRepository: sl.call(),
      ));
  sl.registerLazySingleton<UpdateFvtUseCase>(() => UpdateFvtUseCase(
        localRepository: sl.call(),
      ));

  //repository
  sl.registerLazySingleton<Repository>(
      () => RepositoryImpl(remoteDataSource: sl.call()));
  sl.registerLazySingleton<LocalRepository>(
      () => LocalRepositoryImpl(localDataSource: sl.call()));

  //Remote dataSource
  sl.registerLazySingleton<RemoteDataSource>(() => RemoteDataSourceImpl(
        httpClient: sl.call(),
      ));

  sl.registerLazySingleton<LocalDataSource>(() => LocalDataSourceImpl());

  //external
  final http.Client httpClient = http.Client();
  // final Dio dioClient = Dio();

  sl.registerLazySingleton<http.Client>(() => httpClient);
  // sl.registerLazySingleton<Dio>(() => dioClient);
}
