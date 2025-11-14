import 'package:get_it/get_it.dart';
import 'package:yh_design_system/page/reward/0_reward_main/bloc/reward_main_bloc.dart';
import 'package:yh_design_system/page/reward/1_attend/bloc/attend_bloc.dart';
import 'package:yh_design_system/page/reward/1_cash_out/bloc/cash_out_bloc.dart';
import 'package:yh_design_system/page/reward/1_cash_out/cash_out_input_account/bloc/cash_out_input_account_bloc.dart';
import 'package:yh_design_system/page/reward/1_cash_out/cash_out_request_list/bloc/cash_out_request_list_bloc.dart';
import 'package:yh_design_system/page/reward/1_cash_out/cash_out_result/bloc/cash_out_result_bloc.dart';
import 'package:yh_design_system/page/reward/1_mission_ad/bloc/mission_ad_bloc.dart';
import 'package:yh_design_system/page/reward/1_nemo_study/bloc/nemo_study_bloc.dart';
import 'package:yh_design_system/page/reward/2_reward_result/bloc/reward_result_bloc.dart';

final getIt = GetIt.instance;

void registerRewardDependencies() {
  // ㅡㅡㅡㅡㅡ Reward ㅡㅡㅡㅡㅡ
  getIt.registerFactory(
      () => RewardMainBloc(getIt(), getIt())..add(InitRewardMain()));
  getIt.registerFactory(() => CashOutBloc(getIt())..add(InitCashOut()));
  getIt.registerFactory(() => CashOutInputAccountBloc(getIt(), getIt())
    ..add(InitCashOutInputAccount()));
  getIt.registerFactory(() => CashOutResultBloc()..add(InitCashOutResult()));
  getIt.registerFactory(() =>
      CashOutRequestListBloc(getIt(), getIt())..add(InitCashOutRequestList()));
  getIt.registerFactory(() => AttendBloc()..add(InitAttend()));
  getIt.registerFactory(() => MissionAdBloc()..add(InitMissionAd()));
  getIt.registerFactory(() => NemoStudyBloc()..add(InitNemoStudy()));
  getIt.registerFactory(() => RewardResultBloc()..add(InitRewardResult()));
  // ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
}
