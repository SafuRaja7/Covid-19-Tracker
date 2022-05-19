import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

import '../../models/countries.dart';

part 'countries_state.dart';
part 'data_provider.dart';

class CountriesdataCubit extends Cubit<CountriesdataState> {
  CountriesdataCubit() : super(const CountriesdataLoading());
}
