part of 'mobile_list_images_cubit.dart';

abstract class MobileListImagesState extends Equatable {
  const MobileListImagesState();
}

class MobileListImagesInitial extends MobileListImagesState {
  @override
  List<Object> get props => [];
}
class MobileListImagesLoading extends MobileListImagesState {
  @override
  List<Object> get props => [];
}
class MobileListImagesLoaded extends MobileListImagesState {
  final List<MobileListImagesModel> data;

  MobileListImagesLoaded({required this.data});
  @override
  List<Object> get props => [data];
}
class MobileListImagesFailure extends MobileListImagesState {
  @override
  List<Object> get props => [];
}

