import 'package:movie_app/data/model/popular_response/results.dart';
import 'package:movie_app/result.dart';

abstract class UpcomingRepo{
  Future<Result<List<Results>>>getUpcoming();
}