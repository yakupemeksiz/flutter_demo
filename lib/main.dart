import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_demo/bootstrap.dart';
import 'package:flutter_demo/presentation/theme/theme_data.dart';
import 'package:flutter_demo/presentation/views/home/home_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  await bootstrap(() => const App());
}

final class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) {
        return AnnotatedRegion<SystemUiOverlayStyle>(
          value: const SystemUiOverlayStyle(
            statusBarBrightness: Brightness.dark,
            systemNavigationBarIconBrightness: Brightness.light,
          ),
          child: MaterialApp(
            themeMode: ThemeMode.dark,
            theme: AppThemeData.appTheme,
            darkTheme: AppThemeData.appTheme,
            home: HomeView(),
          ),
        );
      },
    );
  }
}
