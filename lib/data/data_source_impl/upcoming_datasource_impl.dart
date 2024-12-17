import 'package:movie_app/data/api_manager/api_manager.dart';
import 'package:movie_app/data/data_source_contract/upcoming_datasource.dart';
import 'package:movie_app/data/model/results.dart';
import 'package:movie_app/result.dart';

class UpcomingDataSourceImpl extends UpcomingDataSource{
  ApiManager apiManager;
  UpcomingDataSourceImpl({required this.apiManager});
  @override
  Future<Result<List<Results>>> getUpcoming() async{
   return await apiManager.getUpcoming();
  }

}