import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:herd_service/blocs/app_events.dart';
import 'package:herd_service/blocs/app_state.dart';
import 'package:herd_service/server/api.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRespository _userrespository;
  UserBloc(this._userrespository) : super(UserLoadingState()) {
    on<LoadUserEvent>(
      (event, emit) async {
        // emit(UserLoadingState());
        // print("sfdgfhjg");
        try {
          final users = await _userrespository.getuser();
          print("userr sucess");

          emit(UserLoadedState(user: users));
        } catch (e) {
          print("error");
          emit(UserErrorstate(
            error: e.toString(),
          ));
        }
      },
    );
  }
}
