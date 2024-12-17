import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/domain/entities/upcoming_entity.dart';
import 'package:movie_app/domain/usecases/upcoming_usecase.dart';
import 'package:movie_app/result.dart';

class UpcomingViewModel extends Cubit<UpcomingState> {
  GetUpcomingUseCase useCase;
  UpcomingViewModel({required this.useCase}) : super(UpcomingLoadingState());

  getUpcoming() async {
    emit(UpcomingLoadingState());
    var result = await useCase.execute();

    switch (result) {
      case Success<List<UpcomingEntity>>():
        emit(UpcomingSuccessState(upcomingList: result.data));
      case ServerError<List<UpcomingEntity>>():
        emit(UpcomingErrorState(
            serverError: ServerError(
          statusMessage: result.statusMessage,
          statusCode: result.statusCode,
          success: result.success,
        )));
      case Error<List<UpcomingEntity>>():
      emit(UpcomingErrorState(error: Error(exception: result.exception)));
    }
  }
}

sealed class UpcomingState {}

class UpcomingSuccessState extends UpcomingState {
  List<UpcomingEntity> upcomingList;
  UpcomingSuccessState({required this.upcomingList});
}

class UpcomingLoadingState extends UpcomingState {
  String? loadingMessage;
  UpcomingLoadingState({this.loadingMessage});
}

class UpcomingErrorState extends UpcomingState {
  ServerError? serverError;
  Error? error;
  UpcomingErrorState({this.serverError, this.error});
}
