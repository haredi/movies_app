import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/domain/entities/popular_entity.dart';
import 'package:movie_app/domain/usecases/popular_usecase.dart';
import 'package:movie_app/result.dart';

class PopularViewModel extends Cubit<PopularState> {
  PopularViewModel({required this.popularUseCase})
      : super(PopularLoadingState());
  GetPopularUseCase popularUseCase;

  void getPopular() async {
    emit(PopularLoadingState());
    var res = await popularUseCase.execute();
    switch (res) {
      case Success<List<PopularEntity>>():
        emit(PopularSuccessState(populars: res.data));
      case ServerError<List<PopularEntity>>():
        emit(PopularErrorState(
            serverError: ServerError(
                statusMessage: res.statusMessage,
                statusCode: res.statusCode,
                success: res.success)));
      case Error<List<PopularEntity>>():
        emit(PopularErrorState(error: res));
    }
  }
}


sealed class PopularState {}

class PopularSuccessState extends PopularState {
  List<PopularEntity> populars;
  PopularSuccessState({required this.populars});
}

class PopularLoadingState extends PopularState {
  String? loadingMessage;
  PopularLoadingState({this.loadingMessage});
}

class PopularErrorState extends PopularState {
  ServerError? serverError;
  Error? error;
  PopularErrorState({this.serverError, this.error});
}
