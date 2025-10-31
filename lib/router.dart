// context 없이 어디서든 navigate할 수 있도록 해줌
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:yh_design_system/di.dart';
import 'package:yh_design_system/page/reward/cash_out/bloc/cash_out_bloc.dart';
import 'package:yh_design_system/page/reward/cash_out/cash_out_page.dart';
import 'package:yh_design_system/page/reward/cash_out/cash_out_input_account/bloc/cash_out_input_account_bloc.dart';
import 'package:yh_design_system/page/reward/cash_out/cash_out_input_account/cash_out_input_account_page.dart';
import 'package:yh_design_system/page/reward/cash_out/cash_out_request_list/bloc/cash_out_request_list_bloc.dart';
import 'package:yh_design_system/page/reward/cash_out/cash_out_request_list/cash_out_request_list_page.dart';
import 'package:yh_design_system/page/reward/cash_out/cash_out_result/bloc/cash_out_result_bloc.dart';
import 'package:yh_design_system/page/reward/cash_out/cash_out_result/cash_out_result_page.dart';
import 'package:yh_design_system/page/reward/mission_list/attend/bloc/attend_bloc.dart';
import 'package:yh_design_system/page/reward/mission_list/attend/attend_page.dart';
import 'package:yh_design_system/page/reward/mission_list/nemo_study/bloc/nemo_study_bloc.dart';
import 'package:yh_design_system/page/reward/mission_list/nemo_study/nemo_study_page.dart';
import 'package:yh_design_system/page/reward/reward_result/bloc/reward_result_bloc.dart';
import 'package:yh_design_system/page/reward/reward_result/reward_result_page.dart';
import 'package:yh_design_system/page/reward/mission_list/bloc/mission_list_bloc.dart';
import 'package:yh_design_system/page/reward/mission_list/mission_list_page.dart';
import 'package:yh_design_system/page/reward/mission_list/mission_ad/bloc/mission_ad_bloc.dart';
import 'package:yh_design_system/page/reward/mission_list/mission_ad/mission_ad_page.dart';
import 'package:yh_design_system/page/reward/bloc/reward_main_bloc.dart';
import 'package:yh_design_system/page/reward/reward_main_page.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

final class YHRouteNames {
  // ㅡㅡㅡㅡㅡ reward ㅡㅡㅡㅡㅡ
  static const String reward = "/reward"; // 리워드
  static const String missionList = "/reward/mission"; // 미션 목록
  static const String cashOut = "/reward/cash-out"; // 현금 출금
  static const String cashOutInputAccount =
      "/reward/cash-out/input-account"; // 현금 출금 계좌 입력
  static const String cashOutResult = "/reward/cash-out/result"; // 출금 신청 결과
  static const String cashOutRequestList =
      "/reward/cash-out/request-list"; // 출금 신청 목록
  static const String attend = "/reward/mission/attend"; // 출석 체크
  static const String nemoStudy = "/reward/mission/nemo-study"; // 네모 공부
  static const String ad = "/reward/mission/ad"; // 광고 시청
  static const String rewardResult = "/reward/result"; // 리워드 결과
  // ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
}

// MARK: 리워드 탭에서 버튼 눌렀을 때 핸들러

var nemoStudyMissionRouteHandler = () {};

// MARK: Reward

GoRoute rewardRoute(List<RouteBase> routes) => GoRoute(
      name: YHRouteNames.reward,
      path: YHRouteNames.reward,
      builder: (context, state) => MultiBlocProvider(
        providers: [
          BlocProvider<RewardMainBloc>(create: (_) => getIt<RewardMainBloc>()),
        ],
        child: const RewardMainPage(),
      ),
      routes: routes,
    );

GoRoute missionListRoute(List<RouteBase> routes) => GoRoute(
      name: YHRouteNames.missionList,
      path: YHRouteNames.missionList,
      builder: (context, state) => MultiBlocProvider(
        providers: [
          BlocProvider<MissionListBloc>(
              create: (_) => getIt<MissionListBloc>()),
        ],
        child: const MissionListPage(),
      ),
      routes: routes,
    );

GoRoute cashOutRoute() => GoRoute(
      name: YHRouteNames.cashOut,
      path: YHRouteNames.cashOut,
      builder: (context, state) => MultiBlocProvider(
        providers: [
          BlocProvider<CashOutBloc>(create: (_) => getIt<CashOutBloc>()),
        ],
        child: const CashOutPage(),
      ),
    );

GoRoute cashOutInputAccountRoute() => GoRoute(
      name: YHRouteNames.cashOutInputAccount,
      path: YHRouteNames.cashOutInputAccount,
      builder: (context, state) => MultiBlocProvider(
        providers: [
          BlocProvider<CashOutInputAccountBloc>(
              create: (_) => getIt<CashOutInputAccountBloc>()),
        ],
        child: const CashOutInputAccountPage(),
      ),
    );

GoRoute cashOutResultRoute() => GoRoute(
      name: YHRouteNames.cashOutResult,
      path: YHRouteNames.cashOutResult,
      builder: (context, state) => MultiBlocProvider(
        providers: [
          BlocProvider<CashOutResultBloc>(
              create: (_) => getIt<CashOutResultBloc>()),
        ],
        child: const CashOutResultPage(),
      ),
    );

GoRoute cashOutRequestListRoute() => GoRoute(
      name: YHRouteNames.cashOutRequestList,
      path: YHRouteNames.cashOutRequestList,
      builder: (context, state) => MultiBlocProvider(
        providers: [
          BlocProvider<CashOutRequestListBloc>(
              create: (_) => getIt<CashOutRequestListBloc>()),
        ],
        child: const CashOutRequestListPage(),
      ),
    );

GoRoute attendRoute() => GoRoute(
      name: YHRouteNames.attend,
      path: YHRouteNames.attend,
      builder: (context, state) => MultiBlocProvider(
        providers: [
          BlocProvider<AttendBloc>(create: (_) => getIt<AttendBloc>()),
        ],
        child: const AttendPage(),
      ),
    );

GoRoute adRoute() => GoRoute(
      name: YHRouteNames.ad,
      path: YHRouteNames.ad,
      builder: (context, state) => MultiBlocProvider(
        providers: [
          BlocProvider<MissionAdBloc>(create: (_) => getIt<MissionAdBloc>()),
        ],
        child: const MissionAdPage(),
      ),
    );

GoRoute nemoStudyRoute() => GoRoute(
      name: YHRouteNames.nemoStudy,
      path: YHRouteNames.nemoStudy,
      builder: (context, state) => MultiBlocProvider(
        providers: [
          BlocProvider<NemoStudyBloc>(create: (_) => getIt<NemoStudyBloc>()),
        ],
        child: const NemoStudyPage(),
      ),
    );

GoRoute rewardResultRoute() => GoRoute(
      name: YHRouteNames.rewardResult,
      path: YHRouteNames.rewardResult,
      builder: (context, state) => MultiBlocProvider(
        providers: [
          BlocProvider<RewardResultBloc>(
              create: (_) => getIt<RewardResultBloc>()),
        ],
        child: RewardResultPage(reward: state.extra as int),
      ),
    );
