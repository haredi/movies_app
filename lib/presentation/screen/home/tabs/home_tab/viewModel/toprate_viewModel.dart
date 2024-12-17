import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/domain/entities/toprate_entity.dart';
import 'package:movie_app/domain/usecases/toprate_usecase.dart';

import '../../../../../../result.dart';

class TopRateViewMode extends Cubit<TopRateState> {
  TopRateUseCase useCase;
  TopRateViewMode({required this.useCase}) : super(TopRateLoadingState());

  getTopRate() async {
    emit(TopRateLoadingState());
    var result = await useCase.execute();
    switch (result) {
      case Success<List<TopRateEntity>>():
        emit(TopRateSuccessState(topRateList: result.data));
      case ServerError<List<TopRateEntity>>():
        emit(TopRateErrorState(
            serverError: ServerError(
                statusMessage: result.statusMessage,
                statusCode: result.statusCode,
                success: result.success)));
      case Error<List<TopRateEntity>>():
      emit(TopRateErrorState(error: result));
    }
  }
}

sealed class TopRateState {}

class TopRateSuccessState extends TopRateState {
  List<TopRateEntity> topRateList;
  TopRateSuccessState({required this.topRateList});
}

class TopRateLoadingState extends TopRateState {
  String? loadingMessage;
  TopRateLoadingState({this.loadingMessage});
}

class TopRateErrorState extends TopRateState {
  ServerError? serverError;
  Error? error;
  TopRateErrorState({this.serverError, this.error});
}
