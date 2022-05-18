part of 'covid_cubit.dart';

abstract class CovidState extends Equatable {
  final String? error;
  final List<Covid>? data;
  const CovidState({this.error, this.data});

  @override
  List<Object> get props => [error!, data!];
}

class CovidLoading extends CovidState {
  const CovidLoading() : super();
}

class CovidSuccess extends CovidState {
  const CovidSuccess(List<Covid>? data) : super(data: data);
}

class CovidFailure extends CovidState {
  const CovidFailure(String? message) : super(error: message);
}
