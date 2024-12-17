import 'package:movie_app/domain/entities/popular_entity.dart';
import 'package:movie_app/domain/repository_contract/popular_repo_contract.dart';
import 'package:movie_app/result.dart';

class GetPopularUseCase{
  PopularRepository repository;
  GetPopularUseCase({required this.repository});

  Future<Result<List<PopularEntity>>>execute(){
    return repository.getPopular();
  }
}