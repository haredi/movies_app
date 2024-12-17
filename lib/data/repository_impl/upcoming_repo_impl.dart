import 'package:movie_app/data/data_source_contract/upcoming_datasource.dart';
import 'package:movie_app/data/model/results.dart';
import 'package:movie_app/domain/entities/upcoming_entity.dart';
import 'package:movie_app/domain/repository_contract/upcoming_repo_contract.dart';
import 'package:movie_app/result.dart';

class UpcomingRepoImpl extends UpcomingRepo{
  UpcomingDataSource dataSource;
  UpcomingRepoImpl({required this.dataSource});
  @override
  Future<Result<List<UpcomingEntity>>> getUpcoming() async{
    Result<List<Results>> result= await dataSource.getUpcoming();
    switch(result){
      case Success<List<Results>>():
        return Success(data: result.data.map((upcoming) =>upcoming.toUpcomingEntity()).toList());
      case ServerError<List<Results>>():
        return ServerError(statusMessage: result.statusMessage, statusCode: result.statusCode, success: result.success);
      case Error<List<Results>>():
        return Error(exception: result.exception);
    }
  }
  
}