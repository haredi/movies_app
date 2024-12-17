import 'package:movie_app/data/api_manager/api_manager.dart';
import 'package:movie_app/data/data_source_contract/toprate_datasource.dart';
import 'package:movie_app/data/model/results.dart';
import 'package:movie_app/result.dart';

class TopRateDataSourceImpl extends TopRateDataSource{
  ApiManager apiManager;
  TopRateDataSourceImpl({required this.apiManager});
  @override
  Future<Result<List<Results>>> getTopRate() async{
    return await apiManager.getTopRate();
  }

}