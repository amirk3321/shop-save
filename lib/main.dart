import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopsave/features/presentation/cubit/mobile_fvt/mobile_fvt_cubit.dart';
import 'package:shopsave/features/presentation/cubit/mobile_list_images/mobile_list_images_cubit.dart';
import 'package:shopsave/features/presentation/pages/splash_page.dart';
import 'package:shopsave/on_generate_route.dart';
import 'features/presentation/cubit/mobile_list/mobile_list_cubit.dart';
import 'injection_container.dart' as di;
import 'features/presentation/pages/home_page.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MobileListCubit>(
          create: (_) => di.sl<MobileListCubit>(),
        ),
        BlocProvider<MobileListImagesCubit>(
          create: (_) => di.sl<MobileListImagesCubit>(),
        ),
        BlocProvider<MobileFvtCubit>(
          create: (_) => di.sl<MobileFvtCubit>()..openDatabase()..getAllFvtItems(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'ShopSave',
        theme: ThemeData(
            primarySwatch: Colors.indigo
        ),
        onGenerateRoute: OnGenerateRoute.route,
        routes: {
          "/": (context) {
            return SplashPage();
          }
        },
      ),
    );
  }
}