part of 'authentication_cubit.dart';

@immutable
abstract class AuthenticationState {}

class AuthenticationInitial extends AuthenticationState {}
class LoginLoadingState extends AuthenticationState {}
class LoginSuccessState extends AuthenticationState {}
class LoginErrorState extends AuthenticationState {}

class LogoutLoadingState extends AuthenticationState {}
class LogoutSuccessState extends AuthenticationState {}
class LogoutErrorState extends AuthenticationState {}
