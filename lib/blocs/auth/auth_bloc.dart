import 'package:banksha/models/sign_in_form_model.dart';
import 'package:banksha/models/sign_up_form_model.dart';
import 'package:banksha/models/user_model.dart';
import 'package:banksha/services/auth_service.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthEvent>((event, emit) async {
      if (event is AuthCheckEmail) {
        try {
          emit(AuthLoading());

          final res = await AuthService().checkEmail(event.email);

          if (res == false) {
            emit(AuthCheckEmailSuccess());
          } else {
            emit(const AuthFailed('Email sudah terpakai'));
          }
        } catch (e) {
          emit(AuthFailed(e.toString()));
        }
      }

      if (event is AuthRegister) {
        emit(AuthLoading());

        try {
          final res = await AuthService().register(event.data);

          emit(AuthSuccess(res));
        } catch (e) {
          emit(AuthFailed(e.toString()));
        }
      }

      if (event is AuthLogin) {
        emit(AuthLoading());

        try {
          final res = await AuthService().login(event.data);
          emit(AuthSuccess(res));
        } catch (e) {
          emit(AuthFailed(e.toString()));
        }
      }
    });
  }
}
