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
      print(result);;
      result.fold(
        (failure) => emit(AuthError(message: _mapFailureToMessage(failure))),
        (user) => emit(AuthAuthenticated(user: user))
      );
    });
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return 'Server error occurred';
      case NetworkFailure:
        return 'Please check your internet connection';
      default:
        return 'Unexpected error';
    }
  }
} 