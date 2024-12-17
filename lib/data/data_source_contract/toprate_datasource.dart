import 'package:movie_app/data/model/results.dart';
import 'package:movie_app/result.dart';

abstract class TopRateDataSource{
  Future<Result<List<Results>>>getTopRate();
}