import 'package:movie_app/domain/repository_contract/toprate_repo_contract.dart';

import '../../result.dart';
import '../entities/toprate_entity.dart';

class TopRateUseCase{
  TopRateRepo repo;
  TopRateUseCase({required this.repo});

  Future<Result<List<TopRateEntity>>> execute()async{
   return repo.getTopRate();
  }
}