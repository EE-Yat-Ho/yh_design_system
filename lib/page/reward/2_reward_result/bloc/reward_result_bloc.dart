import "package:bloc/bloc.dart";

part "reward_result_event.dart";
part "reward_result_state.dart";

final class RewardResultBloc extends Bloc<RewardResultEvent, RewardResultState> {
  RewardResultBloc() : super(const RewardResultState()) {
    on<InitRewardResult>((event, emit) async {
      emit(state.copyWith(type: RewardResultType.loading));
    });
  }
}
