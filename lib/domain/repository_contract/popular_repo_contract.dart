import 'package:movie_app/domain/entities/popular_entity.dart';
import 'package:movie_app/result.dart';

abstract class PopularRepository{
  Future<Result<List<PopularEntity>>> getPopular();
}