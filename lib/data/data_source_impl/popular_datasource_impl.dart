import 'package:movie_app/data/api_manager/api_manager.dart';
import 'package:movie_app/data/data_source_contract/popular_datasource.dart';
import 'package:movie_app/data/model/results.dart';
import 'package:movie_app/result.dart';

class PopularDatasourceImpl extends PopularDatasource{
  ApiManager apiManager;
  PopularDatasourceImpl({required  this.apiManager});
  @override
  Future<Result<List<Results>>> getPopular()async {
    var result=await apiManager.getPopular();
    switch(result){

      case Success<List<Results>>():
        return Success(data: result.data);
      case ServerError<List<Results>>():
        return ServerError(statusMessage: result.statusMessage, statusCode: result.statusCode, success: result.success);
      case Error<List<Results>>():
        return Error(exception: result.exception);
    }
  }

}