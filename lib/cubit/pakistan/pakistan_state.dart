// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'pakistan_cubit.dart';

abstract class PakistanState extends Equatable {
  final Pakistan? data;
  final String? message;
  const PakistanState({
    this.data,
    this.message,
  });

  @override
  List<Object> get props => [message!, data!];
}

class PakistanLoading extends PakistanState {
  const PakistanLoading() : super();
}

class PakistanSuccess extends PakistanState {
  const PakistanSuccess(Pakistan? data) : super(data: data);
}

class PakistanFailure extends PakistanState {
  const PakistanFailure(String? error) : super(message: error);
}
