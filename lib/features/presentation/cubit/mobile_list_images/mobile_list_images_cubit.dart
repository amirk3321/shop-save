import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shopsave/core/custom_exceptions.dart';
import 'package:shopsave/features/data/models/mobile_list_images_model.dart';
import 'package:shopsave/features/domain/entities/mobile_item_entity.dart';
import 'package:shopsave/features/domain/use_cases/get_mobile_list_images_usecase.dart';

part 'mobile_list_images_state.dart';

class MobileListImagesCubit extends Cubit<MobileListImagesState> {
  final GetMobileListImagesUseCase getMobileListImagesUseCase;

  MobileListImagesCubit({required this.getMobileListImagesUseCase})
      : super(MobileListImagesInitial());

  Future<void> getMobileListImages(MobileItemEntity mobileItem) async {
    emit(MobileListImagesLoading());
    try {

      final data= await getMobileListImagesUseCase.call(mobileItem);

      emit(MobileListImagesLoaded(data: data));


    } on IOException catch (_) {
      emit(MobileListImagesFailure());
    } on ServerException catch (_) {
      emit(MobileListImagesFailure());
    }
  }
}
