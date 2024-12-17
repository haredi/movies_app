import 'package:movie_app/data/api_manager/api_manager.dart';
import 'package:movie_app/data/model/results.dart';
import 'package:movie_app/result.dart';

abstract class UpcomingDataSource{
  Future<Result<List<Results>>>getUpcoming();
}