import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:prominamce_test/app_root/material_app.dart';
import 'package:prominamce_test/core/dio_services/dio_service.dart';

import 'core/bloc_observer/bloc_opserver.dart';

Future<void> main() async {
  DioHelper.init();
  Bloc.observer = MyBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  FlutterSecureStorage storage = const FlutterSecureStorage();
  String? token = await storage.read(key: 'token').catchError((error){print(error);});
  runApp( MyGallery(token: token==null?'':token!,));
}