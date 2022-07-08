import 'package:flutter/material.dart';
import 'package:training/journal/blocs/authentication_bloc_provider.dart';
import 'package:training/journal/blocs/home_bloc.dart';
import 'package:training/journal/blocs/home_bloc_provider.dart';
import 'package:training/journal/services/db_firestore.dart';

import 'blocs/authentication_bloc.dart';
import 'pages/home.dart';
import 'pages/login.dart';
import 'services/authentication.dart';

void main() => runApp(MyApp());

Widget _buildMaterialApp(Widget page) => MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Security Inherited',
      theme: ThemeData(
          primarySwatch: Colors.lightGreen,
          canvasColor: Colors.lightGreen.shade50,
          bottomAppBarColor: Colors.lightGreen),
      home: page,
    );

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthenticationService _authenticationService =
        AuthenticationService();
    final AuthenticationBloc _authenticationBloc =
        AuthenticationBloc(_authenticationService);

    return AuthenticationBlocProvider(
      authenticationBloc: _authenticationBloc,
      child: StreamBuilder(
          initialData: null,
          stream: _authenticationBloc.user,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: Container(
                  color: Colors.lightGreen,
                  child: const CircularProgressIndicator(),
                ),
              );
            } else if (snapshot.hasData) {
              return HomeBlocProvider(
                  child: _buildMaterialApp(const Home()),
                  homeBloc:
                      HomeBloc(DbFirestoreService(), _authenticationService),
                  uid: snapshot.data);
          } else {
              return _buildMaterialApp(const Login());
            }
          }),
    );
  }
}
