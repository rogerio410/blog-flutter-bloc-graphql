// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:graphql_flutter/graphql_flutter.dart' as _i4;
import 'package:injectable/injectable.dart' as _i2;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i5;

import '../../features/blog/data/datasources/post_remote_datasource.dart'
    as _i9;
import '../../features/blog/data/repositories/post_repository_impl.dart'
    as _i11;
import '../../features/blog/domain/repositories/post_repository.dart' as _i10;
import '../../features/blog/domain/usecases/get_all_posts.dart' as _i12;
import '../../features/blog/presentation/cubit/all_posts_cubit.dart' as _i13;
import '../../features/blog/presentation/cubit/authentication_cubit.dart'
    as _i3;
import '../../features/blog/presentation/cubit/login_cubit.dart' as _i6;
import '../platform/network_info.dart' as _i7;
import '../platform/network_info_impl.dart' as _i8;
import 'register_module.dart' as _i14; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final registerModule = _$RegisterModule();
  gh.lazySingleton<_i3.AuthenticationCubit>(() => _i3.AuthenticationCubit());
  gh.lazySingleton<_i4.GraphQLClient>(() => registerModule.gqlClient);
  gh.lazySingleton<_i5.InternetConnectionChecker>(
      () => registerModule.connectionChecker);
  gh.factory<_i6.LoginCubit>(() =>
      _i6.LoginCubit(authenticationCubit: get<_i3.AuthenticationCubit>()));
  gh.lazySingleton<_i7.NetworkInfo>(
      () => _i8.NetworkInfoImpl(get<_i5.InternetConnectionChecker>()));
  gh.lazySingleton<_i9.PostRemoteDataSource>(
      () => _i9.PostRemoteDataSourceImpl(get<_i4.GraphQLClient>()));
  gh.factory<_i10.PostRepository>(() => _i11.PostRepositoryImpl(
      networkInfo: get<_i7.NetworkInfo>(),
      remoteDataSource: get<_i9.PostRemoteDataSource>()));
  gh.factory<_i12.GetAllPosts>(
      () => _i12.GetAllPosts(get<_i10.PostRepository>()));
  gh.factory<_i13.AllPostsCubit>(
      () => _i13.AllPostsCubit(get<_i12.GetAllPosts>()));
  return get;
}

class _$RegisterModule extends _i14.RegisterModule {}
