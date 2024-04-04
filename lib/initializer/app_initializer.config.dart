// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../shared/color/app_colors.dart' as _i3;
import '../shared/font/app_text_style.dart' as _i6;
import '../shared/shared.dart' as _i5;
import '../shared/theme/app_theme.dart' as _i4;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt app_init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i3.AppColors>(() => _i3.AppColors());
    gh.lazySingleton<_i4.AppTheme>(() => _i4.AppTheme(gh<_i5.AppColors>()));
    gh.lazySingleton<_i6.AppTextStyle>(
        () => _i6.AppTextStyle(gh<_i5.AppColors>()));
    return this;
  }
}
