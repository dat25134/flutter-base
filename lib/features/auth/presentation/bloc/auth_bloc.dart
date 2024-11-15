import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/errors/failures.dart';
import '../../domain/usecases/login_user.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUser loginUser;

  AuthBloc({required this.loginUser}) : super(AuthInitial()) {
    on<LoginSubmitted>((event, emit) async {
      emit(AuthLoading());
      
      final result = await loginUser(event.email, event.password);
      
      result.fold(
        (failure) {
          if (failure is ConnectionFailure) {
            emit(AuthError(message: failure.message));
          } else if (failure is NetworkFailure) {
            emit(AuthError(message: 'Không có kết nối internet'));
          } else if (failure is ServerFailure) {
            emit(AuthError(message: 'Lỗi server'));
          } else {
            emit(AuthError(message: 'Đăng nhập thất bại'));
          }
        },
        (user) => emit(AuthAuthenticated(user: user)),
      );
    });
  }
} 