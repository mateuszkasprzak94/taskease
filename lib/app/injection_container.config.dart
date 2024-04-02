// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:to_do/app/cubit/auth_cubit.dart' as _i3;
import 'package:to_do/app/domain/repositories/items_repository.dart' as _i4;
import 'package:to_do/app/features/pages/add_task_page/cubit/add_task_cubit.dart'
    as _i5;
import 'package:to_do/app/features/pages/home_page/tab_screens/cubit/tab_screen_cubit.dart'
    as _i6;

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
    gh.factory<_i3.AuthCubit>(() => _i3.AuthCubit());
    gh.factory<_i4.ItemsRepository>(() => _i4.ItemsRepository());
    gh.factory<_i5.AddTaskCubit>(
        () => _i5.AddTaskCubit(gh<_i4.ItemsRepository>()));
    gh.factory<_i6.TabScreenCubit>(
        () => _i6.TabScreenCubit(gh<_i4.ItemsRepository>()));
    return this;
  }
}
