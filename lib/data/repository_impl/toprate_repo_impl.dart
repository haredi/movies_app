import 'package:movie_app/data/data_source_contract/toprate_datasource.dart';
import 'package:movie_app/domain/entities/toprate_entity.dart';

import 'package:movie_app/result.dart';

import '../../domain/repository_contract/toprate_repo_contract.dart';
import '../model/results.dart';

class TopRateRepoImpl extends TopRateRepo {
  TopRateDataSource dataSource;
  TopRateRepoImpl({required this.dataSource});
  @override
  Future<Result<List<TopRateEntity>>> getTopRate() async {
    Result<List<Results>> result = await dataSource.getTopRate();

    switch (result) {
      case Success<List<Results>>():
        return Success(
            data: result.data
                .map(
                  (e) => e.toTopRateEntity(),
                )
                .toList());
      case ServerError<List<Results>>():
        return ServerError(
            statusMessage: result.statusMessage,
            statusCode: result.statusCode,
            success: result.success);
      case Error<List<Results>>():
     return Error(exception: result.exception);
    }
  }
}
