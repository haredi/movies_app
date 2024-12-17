import 'package:movie_app/data/model/results.dart';
import 'package:movie_app/domain/entities/toprate_entity.dart';
import 'package:movie_app/result.dart';

abstract class TopRateRepo{
  Future<Result<List<TopRateEntity>>>getTopRate();
}