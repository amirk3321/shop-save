part of 'mobile_list_cubit.dart';

abstract class MobileListState extends Equatable {
  const MobileListState();
}

class MobileListInitial extends MobileListState {
  @override
  List<Object> get props => [];
}
class MobileListLoading extends MobileListState {
  @override
  List<Object> get props => [];
}
class MobileListFailure extends MobileListState {
  @override
  List<Object> get props => [];
}
class MobileListLoaded extends MobileListState {
  final List<MobileListModel> data;

  MobileListLoaded({required this.data});
  @override
  List<Object> get props => [data];
}



