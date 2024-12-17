import 'package:dio/dio.dart';
import 'package:movie_app/data/api_manager/end_points.dart';
import 'package:movie_app/data/model/details_response/movie_details.dart';
import 'package:movie_app/data/model/popular_response/popular_response.dart';
import 'package:movie_app/data/model/results.dart';
import 'package:movie_app/data/model/upcoming_response/Upcoming_response.dart';
import 'package:movie_app/result.dart';
extension IsSuccess on Response {
  bool get isSuccess =>
      statusCode != null && statusCode! >= 200 && statusCode! < 300;
}
class ApiManager {
  Dio dio = Dio(
    BaseOptions(baseUrl: EndPoints.baseUrl, headers: {
      "Authorization": EndPoints.authorization,
    }),
  );

  Future<Result<List<Results>>> getPopular() async {
    // dio.interceptors.add(LogInterceptor(responseBody: true,requestBody: true));
    try {
      var serverResponse = await dio.get(EndPoints.popularEndPoint);

      var json = serverResponse.data;

      PopularResponse response = PopularResponse.fromJson(json);
      if (serverResponse.isSuccess) {
        List<Results>? popularMovies = response.results;
        return Success(data: popularMovies!);
      } else {
        return ServerError(
            statusMessage: response.statusMessage!,
            statusCode: response.statusCode!,
            success: response.success!);
      }
    } on DioException catch (ex) {
      return Error(exception: ex);
    }
  }

  Future<Result<List<Results>>> getUpcoming() async {
   try{
     var serverResponse = await dio.get(EndPoints.upcomingEndPoint);
     var json = serverResponse.data;
     UpcomingResponse upcomingResponse = UpcomingResponse.fromJson(json);
     if (serverResponse.isSuccess) {
       return Success(data: upcomingResponse.results!);
     } else {
       return ServerError(
         statusMessage: upcomingResponse.statusMessage!,
         statusCode: upcomingResponse.statusCode!,
         success: upcomingResponse.success!,
       );
     }
   }on DioException  catch(ex){
     return Error(exception: ex);
   }
  }

  Future<Result<List<Results>>> getTopRate()async {
    // dio.interceptors.add(LogInterceptor(responseBody: true,requestBody: true));
   try {
      var serverResponse = await dio.get(EndPoints.topRatedEndPoint);
      var json = serverResponse.data;
      PopularResponse response = PopularResponse.fromJson(json);
      if (serverResponse.isSuccess) {
        return Success(data: response.results ?? []);
      } else {
        return ServerError(
            statusMessage: response.statusMessage ?? '',
            statusCode: response.statusCode ?? 0,
            success: response.success ?? false);
      }
    }on DioException catch(ex){
     return Error(exception: ex);
   }

  }

  Future<Result<MovieDetails>> getMovieDetails(num? movieId)async{
  try{
    var serverResponse= await dio.get('${EndPoints.detailsEndPoint}/$movieId');
    var details=MovieDetails.fromJson(serverResponse.data);
    if(serverResponse.isSuccess){
      return Success(data: details);
    }else{
      return ServerError(statusMessage: details.statusMessage??'Failed', statusCode: details.statusCode??0, success: details.success??false);
    }
  }on DioException catch(ex){
    return Error(exception: ex);
  }
  }
}
