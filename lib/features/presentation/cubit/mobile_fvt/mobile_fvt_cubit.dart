import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shopsave/features/domain/entities/mobile_item_entity.dart';
import 'package:shopsave/features/domain/local_usecases/add_fvt_usecase.dart';
import 'package:shopsave/features/domain/local_usecases/delete_fvt_usecase.dart';
import 'package:shopsave/features/domain/local_usecases/get_all_mobile_items.dart';
import 'package:shopsave/features/domain/local_usecases/open_database_usecase.dart';
import 'package:shopsave/features/domain/local_usecases/update_usecase.dart';

part 'mobile_fvt_state.dart';

class MobileFvtCubit extends Cubit<MobileFvtState> {
  final AddFvtUseCase addFvtUseCase;
  final DeleteFvtUseCase deleteFvtUseCase;
  final GetAllMobileItemsUseCase getAllMobileItemsUseCase;
  final OpenDatabaseUseCase openDatabaseUseCase;
  final UpdateFvtUseCase updateFvtUseCase;
  int prevFilter = -1;

  MobileFvtCubit({
    required this.addFvtUseCase,
    required this.deleteFvtUseCase,
    required this.getAllMobileItemsUseCase,
    required this.openDatabaseUseCase,
    required this.updateFvtUseCase,
  }) : super(MobileFvtInitial());

  Future<void> addFvtItem({required MobileItemEntity mobileItem})async{
    try{
      await addFvtUseCase.call(mobileItem);
      print("added");
    }catch(_){
      print("not");
      //FIXME:emit(failureState());
    }
  }
  Future<void> deleteFvtItem({required MobileItemEntity mobileItem})async{
    try{
      await deleteFvtUseCase.call(mobileItem);
    }catch(_){
      //FIXME:emit(failureState());
    }
  }
  Future<void> getAllFvtItems(int filter)async{
    prevFilter = filter;
    print("getAllFvtItems "+ filter.toString());
    emit(MobileFvtLoading());
    try{
      final List<MobileItemEntity> taskData=await getAllMobileItemsUseCase.call();

      if (filter == 0) {
        taskData.sort((a, b) => a.price!.compareTo(b.price!));
      } else if (filter == 1) {
        taskData.sort((a, b) => b.price!.compareTo(a.price!));
      } else if (filter == 2) {
        taskData.sort((a, b) => b.rating!.compareTo(a.rating!));
      }
      emit(MobileFvtLoaded(taskData: taskData));
    }catch(_){
      // print("failure");
      emit(MobileFvtFailure());
    }
  }
  Future<void> openDatabase()async{
    try{
      await openDatabaseUseCase.call();
      // print("open db");
    }catch(_){
      // //FIXME:emit(failureState());
      // print("open db ff");
    }
  }
  Future<void> updateTask({required MobileItemEntity mobileItem})async{
    try{
      await updateFvtUseCase.call(mobileItem);
    }catch(_){
      //FIXME:emit(failureState());
    }
  }

  Future<void> refreshAfterAddingToFav() async {
    getAllFvtItems(prevFilter);
  }
}
