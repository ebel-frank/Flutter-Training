import 'package:flutter/material.dart';

import 'authentication_bloc.dart';

class AuthenticationBlocProvider extends InheritedWidget {
  final AuthenticationBloc authenticationBloc;

  const AuthenticationBlocProvider(
      {Key? key, required Widget child, required this.authenticationBloc})
      : super(key: key, child: child);

  @override
  bool updateShouldNotify(AuthenticationBlocProvider oldWidget) =>
      authenticationBloc != oldWidget.authenticationBloc;

  static AuthenticationBlocProvider of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType(
        aspect: AuthenticationBlocProvider) as AuthenticationBlocProvider);
  }
}
