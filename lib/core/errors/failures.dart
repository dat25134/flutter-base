import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  const Failure();

  @override
  List<Object> get props => [];
}

class ServerFailure extends Failure {}

class NetworkFailure extends Failure {}

class CacheFailure extends Failure {}

class InvalidCredentialsFailure extends Failure {}

class ConnectionFailure extends Failure {
  final String message;

  const ConnectionFailure(this.message);

  @override
  List<Object> get props => [message];
} 