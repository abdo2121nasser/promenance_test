import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:prominamce_test/core/dio_services/dio_service.dart';
import 'package:prominamce_test/core/models/user_data_model.dart';
import 'package:prominamce_test/screens/authentication_screen/login_screen.dart';

part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit() : super(AuthenticationInitial());
  static AuthenticationCubit get(context) => BlocProvider.of(context);

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  UserData? userData;

  login() async {
    try {
      // email.text='allen.gerlach@example.com';
      // password.text='password';
      emit(LoginLoadingState());
      Response responce = await DioHelper.postData(
          url: 'auth/login',
          data: {"email": email.text, "password": password.text});
      userData = await UserData.fromJson(responce.data);
      FlutterSecureStorage storage = const FlutterSecureStorage();
      await storage.write(key: 'token', value: userData!.token);
      clearControllers();
      emit(LoginSuccessState());
    } catch (error) {
      clearControllers();
      emit(LoginErrorState());
      print(error);
    }
  }

  logout({required context}) async {
    try {
      emit(LogoutLoadingState());

      FlutterSecureStorage storage = const FlutterSecureStorage();
      await storage.delete(key: 'token');
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const LoginScreen(),
          ));
      emit(LogoutSuccessState());
    } catch (error) {
      emit(LogoutErrorState());
      print(error);
    }
  }
  clearControllers()
  {
    email.clear();
    password.clear();
  }
}
