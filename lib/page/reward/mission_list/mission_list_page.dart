import "package:easy_localization/easy_localization.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:go_router/go_router.dart";
import "package:yh_design_system/router.dart";
import "package:yh_design_system/atoms/font/fonts.dart";
import "package:yh_design_system/organisms/appbar/appbar.dart";
import "package:yh_design_system/organisms/collection/cell.dart";
import "package:yh_design_system/organisms/scaffold/scaffold.dart";
import "bloc/mission_list_bloc.dart";

final class MissionListPage extends StatelessWidget {
  const MissionListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<MissionListBloc>();
    return YHScaffold(
      appBar: YHAppBar(
        title: "page.mission_list.title".tr(),
        titleFont: YHFont.regular22,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            spacing: 0,
            children: [
              const SizedBox(height: 32),
              _list(bloc, context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _list(MissionListBloc bloc, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        spacing: 0,
        children: [
          YHCell(
              id: 0,
              margin: const EdgeInsets.symmetric(vertical: 12),
              title: "page.mission_list.attend_title".tr(),
              subtitle: "page.mission_list.attend_subtitle".tr(),
              showArrow: false,
              redDot: bloc.state.canAttend,
              onTap: () => context.pushNamed(YHRouteNames.attend)),
          YHCell(
              id: 1,
              margin: const EdgeInsets.symmetric(vertical: 12),
              title: "page.mission_list.ad_title".tr(),
              subtitle: "page.mission_list.ad_subtitle".tr(),
              showArrow: false,
              redDot: bloc.state.canWatchAD,
              onTap: () => context.pushNamed(YHRouteNames.ad)),
          // YHCell(
          //     margin: EdgeInsets.symmetric(vertical: 12),
          //     title: "👟 만보기",
          //     subtitle: "매일 출석하면 캐시를 얻을 수 있어요",
          //     rightType: YHCellRightType.none,
          //     onTap: () => {}),
          // YHCell(
          //     margin: EdgeInsets.symmetric(vertical: 12),
          //     title: "🍀 복권",
          //     subtitle: "매일 출석하면 캐시를 얻을 수 있어요",
          //     rightType: YHCellRightType.none,
          //     onTap: () => {}),
          YHCell(
            id: 2,
            margin: const EdgeInsets.symmetric(vertical: 12),
            title: "🛠️",
            subtitle: "page.mission_list.coming_soon_subtitle".tr(),
            showArrow: false,
          ),
        ],
      ),
    );
  }
}
