import 'package:harvesthub/constants/global_variable.dart';
import 'package:harvesthub/features/admin/screen/admin_screen.dart';
import 'package:harvesthub/provider/user_provider.dart';
import 'package:harvesthub/router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'common/widgets/bottm_bar.dart';
import 'features/auth/screens/auth_screen.dart';
import 'features/auth/services/auth_service.dart';

void main() {
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => UserProvider()),
    ], child: const MyApp()),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  final AuthService authService = AuthService();
  @override
  void initState() {
    super.initState();
    authService.getUserData(context: context);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'HarvestHub',
      theme: ThemeData(
        scaffoldBackgroundColor: GlobalVariables.backgroundColor,
        colorScheme: const ColorScheme.light(
          primary: GlobalVariables.secondaryColor,
        ),
        appBarTheme: const AppBarTheme(
            elevation: 0,
            // ignore: prefer_const_constructors
            iconTheme: IconThemeData(
              color: Colors.black,
            )),
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: (settings) => generateRoute(settings),
      // home: Scaffold(
      //   body: Tips(),
      // )
      home: Provider.of<UserProvider>(context).user.token.isNotEmpty
          ? Provider.of<UserProvider>(context).user.type == 'user'
              ? const BottomBar()
              : const AdminScreen()
          : const AuthScreen(),
    );
  }
}
