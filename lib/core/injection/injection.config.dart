// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:graphql_flutter/graphql_flutter.dart' as _i3;
import 'package:injectable/injectable.dart' as _i2;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i4;

import '../../features/blog/data/datasources/post_remote_datasource.dart'
    as _i7;
import '../../features/blog/data/repositories/post_repository_impl.dart' as _i9;
import '../../features/blog/domain/repositories/post_repository.dart' as _i8;
import '../../features/blog/domain/usecases/get_all_posts.dart' as _i10;
import '../../features/blog/presentation/cubit/all_posts_cubit.dart' as _i11;
import '../platform/network_info.dart' as _i5;
import '../platform/network_info_impl.dart' as _i6;
import 'register_module.dart' as _i12; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final registerModule = _$RegisterModule();
  gh.lazySingleton<_i3.GraphQLClient>(() => registerModule.gqlClient);
  gh.lazySingleton<_i4.InternetConnectionChecker>(
      () => registerModule.connectionChecker);
  gh.lazySingleton<_i5.NetworkInfo>(
      () => _i6.NetworkInfoImpl(get<_i4.InternetConnectionChecker>()));
  gh.lazySingleton<_i7.PostRemoteDataSource>(
      () => _i7.PostRemoteDataSourceImpl(get<_i3.GraphQLClient>()));
  gh.factory<_i8.PostRepository>(() => _i9.PostRepositoryImpl(
      networkInfo: get<_i5.NetworkInfo>(),
      remoteDataSource: get<_i7.PostRemoteDataSource>()));
  gh.factory<_i10.GetAllPosts>(
      () => _i10.GetAllPosts(get<_i8.PostRepository>()));
  gh.factory<_i11.AllPostsCubit>(
      () => _i11.AllPostsCubit(get<_i10.GetAllPosts>()));
  return get;
}

class _$RegisterModule extends _i12.RegisterModule {}
