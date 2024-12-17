import 'package:movie_app/data/model/results.dart';
import 'package:movie_app/result.dart';

abstract class PopularDatasource{
  Future<Result<List<Results>>> getPopular();
}