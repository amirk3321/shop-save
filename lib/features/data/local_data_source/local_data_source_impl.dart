import 'dart:async';

import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:path/path.dart';
import 'package:sembast/sembast_io.dart';
import 'package:shopsave/features/data/models/mobile_model.dart';
import 'package:shopsave/features/data/models/mobile_model.dart';
import 'package:shopsave/features/data/models/mobile_model.dart';
import 'package:shopsave/features/data/models/mobile_model.dart';
import 'package:shopsave/features/domain/entities/mobile_item_entity.dart';

import 'local_data_source.dart';

const String MAP_STORE = "MAP_STORE_FVT";

class LocalDataSourceImpl implements LocalDataSource {
  Completer<Database>? _dbOpenCompleter;



  Future<Database> get _db async => _dbOpenCompleter!.future;
  final _taskStore = intMapStoreFactory.store(MAP_STORE);

  Future<Database> openDataBaseConnection() async {
    if (_dbOpenCompleter == null) {
      _dbOpenCompleter = Completer();

      _initDatabase();
    }

    return _dbOpenCompleter!.future;
  }

  Future _initDatabase() async {
    final appDocumentDir = await getApplicationDocumentsDirectory();

    final dbPath = join(appDocumentDir.path, 'task.db');

    final database = await databaseFactoryIo.openDatabase(dbPath);

    _dbOpenCompleter!.complete(database);
  }

  @override
  Future<void> addFvt(MobileItemEntity mobileItem) async {
    final newTask = MobileModel(
      itemId: mobileItem.itemId,
      thumbImageURL: mobileItem.thumbImageURL,
      rating: mobileItem.rating,
      price: mobileItem.price,
      brand: mobileItem.brand,
      isFvt: mobileItem.isFvt,
      description: mobileItem.description,
      name: mobileItem.name,
    ).toJson();
    _taskStore.add(await _db, newTask);
  }

  @override
  Future<void> deleteFvt(MobileItemEntity mobileItem) async {
    final finder = Finder(filter: Filter.byKey(mobileItem.id));
    _taskStore.delete(await _db, finder: finder);
  }

  @override
  Future<List<MobileItemEntity>> getAllMobileItem() async {
    final finder = Finder(sortOrders: [SortOrder('id')]);

    final recordSnapshots = await _taskStore.find(
      await _db,
      finder: finder,
    );
    return recordSnapshots.map((task) {
      final taskData = MobileModel.fromJson(task.value);

      taskData.id = task.key;

      return taskData;
    }).toList();
  }


  @override
  Future<Database> openDatabase() {
    if (_dbOpenCompleter == null) {
      _dbOpenCompleter = Completer();
      _initDatabase();
    }
    return _dbOpenCompleter!.future;
  }


  @override
  Future<void> updateFvt(MobileItemEntity mobileItem) async {
    final newTask = MobileModel(
      itemId: mobileItem.itemId,
      thumbImageURL: mobileItem.thumbImageURL,
      rating: mobileItem.rating,
      price: mobileItem.price,
      brand: mobileItem.brand,
      isFvt: mobileItem.isFvt==true?false:true,
      description: mobileItem.description,
      name: mobileItem.name,
    ).toJson();

    final finder = Finder(filter: Filter.byKey(mobileItem.id));
    _taskStore.update(await _db, newTask, finder: finder);
  }

}
