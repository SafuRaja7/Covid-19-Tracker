part of 'countries_cubit.dart';

abstract class CountriesdataState extends Equatable {
  final List<Country>? data;
  final String? error;
  const CountriesdataState({this.data, this.error});

  @override
  List<Object> get props => [data!, error!];
}

class CountriesdataLoading extends CountriesdataState {
  const CountriesdataLoading() : super();
}

class CountriesdataSuccess extends CountriesdataState {
  const CountriesdataSuccess(List<Country>? data) : super(data: data);
}

class CountriesdataFailure extends CountriesdataState {
  const CountriesdataFailure(String message) : super(error: message);
}
