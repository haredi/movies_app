import 'package:movie_app/data/model/results.dart';
import 'package:movie_app/domain/entities/upcoming_entity.dart';
import 'package:movie_app/result.dart';

abstract class UpcomingRepo{
  Future<Result<List<UpcomingEntity>>>getUpcoming();
}