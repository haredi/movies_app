import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/common/loading_widget.dart';
import 'package:movie_app/common/ui_error_widget.dart';
import 'package:movie_app/config/theme/app_style.dart';
import 'package:movie_app/data/api_manager/api_manager.dart';
import 'package:movie_app/data/data_source_impl/popular_datasource_impl.dart';
import 'package:movie_app/data/data_source_impl/toprate_datasource_impl.dart';
import 'package:movie_app/data/data_source_impl/upcoming_datasource_impl.dart';
import 'package:movie_app/data/repository_impl/popular_repo_impl.dart';
import 'package:movie_app/data/repository_impl/toprate_repo_impl.dart';
import 'package:movie_app/data/repository_impl/upcoming_repo_impl.dart';
import 'package:movie_app/domain/usecases/popular_usecase.dart';
import 'package:movie_app/domain/usecases/toprate_usecase.dart';
import 'package:movie_app/domain/usecases/upcoming_usecase.dart';
import 'package:movie_app/presentation/screen/home/tabs/home_tab/viewModel/popular_viewModel.dart';
import 'package:movie_app/presentation/screen/home/tabs/home_tab/viewModel/upcoming_viewModel.dart';
import 'package:movie_app/presentation/screen/home/tabs/home_tab/widgets/header_item.dart';
import 'package:movie_app/presentation/screen/home/tabs/home_tab/widgets/new_releases_list.dart';
import 'package:movie_app/presentation/screen/home/tabs/home_tab/widgets/recomended_list.dart';

import '../../../../../../core/utils/colors_manager.dart';
import '../viewModel/toprate_viewModel.dart';

class HomeTab extends StatefulWidget {
  HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  var popularViewModel = PopularViewModel(
      popularUseCase: GetPopularUseCase(
          repository: PopularRepoImpl(
              datasource: PopularDatasourceImpl(apiManager: ApiManager()))));
  var upcomingViewModel = UpcomingViewModel(
      useCase: GetUpcomingUseCase(
          repo: UpcomingRepoImpl(
              dataSource: UpcomingDataSourceImpl(apiManager: ApiManager()))));
  var topRateViewModel = TopRateViewMode(
      useCase: TopRateUseCase(
          repo: TopRateRepoImpl(
              dataSource: TopRateDataSourceImpl(apiManager: ApiManager()))));
  @override
  void initState() {
    popularViewModel.getPopular();
    upcomingViewModel.getUpcoming();
    topRateViewModel.getTopRate();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PopularViewModel>(
          create: (context) => popularViewModel,
        ),
        BlocProvider<UpcomingViewModel>(create: (context) => upcomingViewModel),
        BlocProvider<TopRateViewMode>(create: (context) => topRateViewModel),
      ],
      child: Column(
        children: [
          SizedBox(
              height: 300.h,
              child: BlocBuilder<PopularViewModel, PopularState>(
                  builder: (context, state) {
                switch (state) {
                  case PopularSuccessState():
                    return PopularItem(
                      popularList: state.populars,
                    );
                  case PopularLoadingState():
                    return const LoadingWidget();
                  case PopularErrorState():
                    return UiErrorWidget(
                        serverError: state.serverError, error: state.error);
                }
              })),
          SizedBox(height: 12.h),
          Container(
            height: 195.h,
            padding: REdgeInsets.symmetric(vertical: 12),
            color: ColorsManager.container,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: REdgeInsets.symmetric(horizontal: 8.0),
                  child: Text('New Releases ', style: AppStyle.titleList),
                ),
                SizedBox(height: 7.h),
                SizedBox(
                    height: 135.h,
                    child: BlocBuilder<UpcomingViewModel, UpcomingState>(
                      builder: (context, state) {
                        switch (state) {
                          case UpcomingSuccessState():
                            var upcomingList = state.upcomingList;
                            return ListView.builder(
                                itemCount: upcomingList.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return NewRelease(
                                    upcomingEntity: upcomingList[index],
                                  );
                                });

                          case UpcomingLoadingState():
                            return LoadingWidget();
                          case UpcomingErrorState():
                            return UiErrorWidget(
                              serverError: state.serverError,
                              error: state.error,
                            );
                        }
                      },
                    )),
              ],
            ),
          ),
          SizedBox(height: 30.h),
          Container(
            height: 270.h,
            padding: REdgeInsets.symmetric(vertical: 10),
            color: ColorsManager.container,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                padding: REdgeInsets.symmetric(horizontal: 8),
                child: Text('Recomended ', style: AppStyle.titleList),
              ),
              SizedBox(height: 5.h),
              BlocBuilder<TopRateViewMode, TopRateState>(
                builder: (context, state) {
                  switch (state) {
                    case TopRateSuccessState():
                      return Expanded(
                        child: ListView.builder(
                            itemCount: state.topRateList.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return RecomendedList(
                                topRateItem: state.topRateList[index],
                              );
                            }),
                      );
                    case TopRateLoadingState():
                      return const LoadingWidget();
                    case TopRateErrorState():
                      return UiErrorWidget(
                        error: state.error,
                        serverError: state.serverError,
                      );
                  }
                },
              )
            ]),
          ),
          SizedBox(height: 7.h),
        ],
      ),
    );
  }
}
