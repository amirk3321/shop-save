import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shopsave/core/custom_exceptions.dart';
import 'package:shopsave/features/data/models/mobile_list_model.dart';
import 'package:shopsave/features/domain/use_cases/get_mobile_list_usecase.dart';

part 'mobile_list_state.dart';

class MobileListCubit extends Cubit<MobileListState> {
  final GetMobileListUseCase getMobileListUseCase;
  MobileListCubit({required this.getMobileListUseCase}) : super(MobileListInitial());


  Future<void> getMobileList()async{
    emit(MobileListLoading());
    try{

     final response= await getMobileListUseCase.call();


    emit(MobileListLoaded(data:response));
    }on IOException catch(_){
      emit(MobileListFailure());
    }on ServerException catch(_){
      emit(MobileListFailure());
    }

  }


}
