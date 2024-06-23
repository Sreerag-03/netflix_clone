// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter_netflix/application/downloads/downloads_bloc.dart'
    as _i9;
import 'package:flutter_netflix/application/Home/home_bloc.dart' as _i10;
import 'package:flutter_netflix/application/hot_and_new/hot_and_new_bloc.dart'
    as _i11;
import 'package:flutter_netflix/application/search/search_bloc.dart' as _i12;
import 'package:flutter_netflix/domain/downloads/i_downloads_repo.dart' as _i5;
import 'package:flutter_netflix/domain/new_and_hot_resp/new_and_hot_service.dart'
    as _i3;
import 'package:flutter_netflix/domain/search/search_service.dart' as _i7;
import 'package:flutter_netflix/infrastructure/downloads/downloads_repository.dart'
    as _i6;
import 'package:flutter_netflix/infrastructure/hot_and_new/hot_and_new_impl.dart'
    as _i4;
import 'package:flutter_netflix/infrastructure/search/search_impl.dart' as _i8;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i3.HotAndNewService>(() => _i4.HotAndNewImplementation());
    gh.lazySingleton<_i5.IDownloadsRepo>(() => _i6.DownloadsRepository());
    gh.lazySingleton<_i7.SearchService>(() => _i8.SearchImpl());
    gh.factory<_i9.DownloadsBloc>(
        () => _i9.DownloadsBloc(gh<_i5.IDownloadsRepo>()));
    gh.factory<_i10.HomeBloc>(() => _i10.HomeBloc(gh<_i3.HotAndNewService>()));
    gh.factory<_i11.HotAndNewBloc>(
        () => _i11.HotAndNewBloc(gh<_i3.HotAndNewService>()));
    gh.factory<_i12.SearchBloc>(() => _i12.SearchBloc(
          gh<_i5.IDownloadsRepo>(),
          gh<_i7.SearchService>(),
        ));
    return this;
  }
}
