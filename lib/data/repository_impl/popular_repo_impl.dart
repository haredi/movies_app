import 'package:movie_app/data/data_source_contract/popular_datasource.dart';
import 'package:movie_app/data/model/results.dart';
import 'package:movie_app/domain/entities/popular_entity.dart';
import 'package:movie_app/domain/repository_contract/popular_repo_contract.dart';
import 'package:movie_app/result.dart';

class PopularRepoImpl extends PopularRepository{
  PopularDatasource datasource;
  PopularRepoImpl({required this.datasource});


  @override
  Future<Result<List<PopularEntity>>> getPopular()async{
   var result=await datasource.getPopular();
   switch(result){
     case Success<List<Results>>():
      return Success(data: result.data.map((e) => e.toPopularEntity(),).toList());
     case ServerError<List<Results>>():
       return ServerError(statusMessage: result.statusMessage
           , statusCode: result.statusCode
           , success: result.success);
     case Error<List<Results>>():
       return Error(exception: result.exception);
   }
  }

}