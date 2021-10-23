import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shopsave/core/custom_exceptions.dart';
import 'package:shopsave/features/data/models/mobile_list_model.dart';
import 'package:shopsave/features/domain/use_cases/get_mobile_list_usecase.dart';

part 'mobile_list_state.dart';

class MobileListCubit extends Cubit<MobileListState> {
  final GetMobileListUseCase getMobileListUseCase;
  int prevFilter = -1;
  MobileListCubit({required this.getMobileListUseCase}) : super(MobileListInitial());


  Future<void> getMobileList(int filter)async{
    prevFilter = filter;
    emit(MobileListLoading());
    try{

     final response= await getMobileListUseCase.call();
     if (filter == 0) {
       response.sort((a, b) => a.price!.compareTo(b.price!));
     } else if (filter == 1) {
       response.sort((a, b) => b.price!.compareTo(a.price!));
     } else if (filter == 2) {
       response.sort((a, b) => b.rating!.compareTo(a.rating!));
     }


    emit(MobileListLoaded(data:response));
    }on IOException catch(_){
      emit(MobileListFailure());
    }on ServerException catch(_){
      emit(MobileListFailure());
    }

  }

  Future<void> refreshAfterAddingToFav() async {
    getMobileList(prevFilter);
  }

}
