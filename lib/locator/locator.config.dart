// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:data_connection_checker_tv/data_connection_checker.dart'
    as _i10;
import 'package:dio/dio.dart' as _i5;
import 'package:fluttercalls/core/api/api_consumer.dart' as _i15;
import 'package:fluttercalls/core/api/app_interceptors.dart' as _i3;
import 'package:fluttercalls/core/api/dio_consumer.dart' as _i16;
import 'package:fluttercalls/core/network/network_info.dart' as _i9;
import 'package:fluttercalls/core/services/snack_bar_service.dart' as _i14;
import 'package:fluttercalls/home/home_view_model.dart' as _i7;
import 'package:fluttercalls/signin/signin_view_model.dart' as _i12;
import 'package:fluttercalls/signup/sign_up_view_model.dart' as _i13;
import 'package:get_it/get_it.dart' as _i1;
import 'package:google_sign_in/google_sign_in.dart' as _i6;
import 'package:injectable/injectable.dart' as _i2;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i8;
import 'package:shared_preferences/shared_preferences.dart' as _i11;
import 'package:stacked_services/stacked_services.dart' as _i4;

import 'register_module.dart' as _i17;

/// ignore_for_file: unnecessary_lambdas
/// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of main-scope dependencies inside of [GetIt]
Future<_i1.GetIt> $initLocator(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final registerModule = _$RegisterModule();
  gh.lazySingleton<_i3.AppInterceptors>(() => _i3.AppInterceptors());
  gh.singleton<_i4.BottomSheetService>(registerModule.bottomSheetService);
  gh.singleton<_i4.DialogService>(registerModule.dialogService);
  gh.lazySingleton<_i5.Dio>(() => registerModule.dio);
  gh.factory<_i6.GoogleSignIn>(() => registerModule.googleSignIn);
  gh.factory<_i7.HomeViewModel>(() => _i7.HomeViewModel());
  gh.lazySingleton<_i8.InternetConnectionChecker>(
      () => registerModule.internetConnectionChecker);
  gh.lazySingleton<_i5.LogInterceptor>(() => registerModule.logInterceptor);
  gh.singleton<_i4.NavigationService>(registerModule.navigationService);
  gh.lazySingleton<_i9.NetworkInfo>(() => _i9.NetworkInfoImp(
      dataConnectionChecker: gh<_i10.DataConnectionChecker>()));
  await gh.factoryAsync<_i11.SharedPreferences>(
    () => registerModule.prefs,
    preResolve: true,
  );
  gh.factory<_i12.SignInViewModel>(() => _i12.SignInViewModel());
  gh.factory<_i13.SignUpViewModel>(() => _i13.SignUpViewModel());
  gh.lazySingleton<_i14.SnackBarService>(() => _i14.SnackBarService());
  gh.lazySingleton<_i15.ApiConsumer>(
      () => _i16.DioConsumer(client: gh<_i5.Dio>()));
  return getIt;
}

class _$RegisterModule extends _i17.RegisterModule {}
