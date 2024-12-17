import 'package:movie_app/domain/repository_contract/upcoming_repo_contract.dart';

import '../../result.dart';
import '../entities/upcoming_entity.dart';

class GetUpcomingUseCase{
  UpcomingRepo repo;
  GetUpcomingUseCase({required this.repo});
  Future<Result<List<UpcomingEntity>>>  execute()async{
   return repo.getUpcoming();
  }
}