part of 'mobile_fvt_cubit.dart';

abstract class MobileFvtState extends Equatable {
  const MobileFvtState();
}

class MobileFvtInitial extends MobileFvtState {
  @override
  List<Object> get props => [];
}

class MobileFvtLoading extends MobileFvtState {
  @override
  List<Object> get props => [];
}
class MobileFvtLoaded extends MobileFvtState {
  final List<MobileItemEntity> taskData;

  MobileFvtLoaded({required this.taskData});
  @override
  List<Object> get props => [taskData];
}
class MobileFvtFailure extends MobileFvtState {
  @override
  List<Object> get props => [];
}



