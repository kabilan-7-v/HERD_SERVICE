import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:herd_service/blocs/app_events.dart';
import 'package:herd_service/blocs/app_state.dart';
import 'package:herd_service/server/Login_api.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRespository _userrespository;
  UserBloc(this._userrespository) : super(UserLoadingState()) {
    on<LoadUserEvent>(
      (event, emit) async {
        // emit(UserLoadingState());

        try {
          final users = await _userrespository.getuser();

          emit(UserLoadedState(user: users));
        } catch (e) {
          emit(UserErrorstate(
            error: e.toString(),
          ));
        }
      },
    );
  }
}
