import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:very_simple_online_shop_cubit/cubit/online_shop/product_cubit.dart';
import 'package:very_simple_online_shop_cubit/cubit/theme/theme_cubit.dart';
import 'package:very_simple_online_shop_cubit/ui/screens/home_screen.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context) => ThemeCubit()),
        BlocProvider(create: (BuildContext context) => ProductCubit()),
      ],
      child: BlocBuilder<ThemeCubit, bool>(
        builder: (BuildContext context, bool state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              scaffoldBackgroundColor: Colors.white,
              appBarTheme: const AppBarTheme(
                backgroundColor: Colors.amber,
                centerTitle: false,
              ),
            ),
            darkTheme: ThemeData.dark(),
            themeMode: state ? ThemeMode.dark : ThemeMode.light,
            home: const HomeScreen(),
          );
        },
      ),
    );
  }
}
