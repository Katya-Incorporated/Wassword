import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wassword/pages/about_page.dart';
import 'package:wassword/pages/home_page.dart';
import 'package:wassword/styles/colors.dart' as mcolors;

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);

  final _router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: '/about',
        builder: (context, state) => const AboutPage(),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) => MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routeInformationProvider: _router.routeInformationProvider,
        routeInformationParser: _router.routeInformationParser,
        routerDelegate: _router.routerDelegate,
        theme: ThemeData(
          useMaterial3: true,
          textTheme: GoogleFonts.robotoTextTheme(
            Theme.of(context).textTheme,
          ),
          appBarTheme: AppBarTheme(
            backgroundColor: mcolors.backgroundView,
            centerTitle: true,
            elevation: 0,
          ),
          brightness: Brightness.dark,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          backgroundColor: mcolors.backgroundView,
          scaffoldBackgroundColor: mcolors.backgroundView,
        ),
      );
}
