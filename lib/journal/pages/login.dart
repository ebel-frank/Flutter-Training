import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:training/firebase_options.dart';

import 'package:training/journal/blocs/login_bloc.dart';
import 'package:training/journal/services/authentication.dart';

import '../blocs/authentication_bloc.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late LoginBloc _loginBloc;

  Future<void> _initializeFirebase() async {
    try {
      FirebaseApp app = await Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform);
      log('Initialized default app $app');
    } catch (e) {
      log(e.toString());
    }
    
    _loginBloc = LoginBloc(AuthenticationService());
  }

  Column _buttonsLogin() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        StreamBuilder(
            initialData: false,
            stream: _loginBloc.enableLoginCreateButton,
            builder: (BuildContext context, AsyncSnapshot snapshot) =>
                ElevatedButton(
                  onPressed: snapshot.data
                      ? () => _loginBloc.loginOrCreateChanged.add('Login')
                      : null,
                  child: const Text('Login'),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Colors.lightGreen.shade200)),
                )),
        TextButton(
            onPressed: () {
              _loginBloc.loginOrCreateButtonChanged.add('Create Account');
            },
            child: const Text('Create Account'))
      ],
    );
  }

  Column _buttonsCreateAccount() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        StreamBuilder(
            initialData: false,
            stream: _loginBloc.enableLoginCreateButton,
            builder: (BuildContext context, AsyncSnapshot snapshot) =>
                ElevatedButton(
                  onPressed: snapshot.data
                      ? () =>
                          _loginBloc.loginOrCreateChanged.add('Create Account')
                      : null,
                  child: const Text('Create Account'),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Colors.lightGreen.shade200)),
                )),
        TextButton(
            onPressed: () {
              _loginBloc.loginOrCreateButtonChanged.add('Login');
            },
            child: const Text('Login'))
      ],
    );
  }

  @override
  void dispose() {
    _loginBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: const PreferredSize(
          child: Icon(
            Icons.account_circle,
            size: 88,
            color: Colors.white,
          ),
          preferredSize: Size.fromHeight(40),
        ),
      ),
      body: FutureBuilder(
        future: _initializeFirebase(),
        builder: (context, snapshot) => (snapshot.connectionState !=
                ConnectionState.done)
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                padding: const EdgeInsets.only(
                    left: 16, top: 32, right: 16, bottom: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    StreamBuilder(
                      stream: _loginBloc.email,
                      builder: (BuildContext context, AsyncSnapshot snapshot) =>
                          TextField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            labelText: 'Email Address',
                            icon: const Icon(Icons.mail_outline),
                            errorText: snapshot.error.toString()),
                        onChanged: _loginBloc.emailChanged.add,
                      ),
                    ),
                    StreamBuilder(
                      stream: _loginBloc.password,
                      builder: (BuildContext context, AsyncSnapshot snapshot) =>
                          TextField(
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                            labelText: 'Password',
                            icon: const Icon(Icons.security),
                            errorText: snapshot.error.toString()),
                        onChanged: _loginBloc.passwordChanged.add,
                      ),
                    ),
                    const SizedBox(
                      height: 48,
                    ),
                    StreamBuilder(
                      initialData: 'Login',
                      stream: _loginBloc.loginOrCreateButton,
                      builder: ((BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.data == 'Login') {
                          return _buttonsLogin();
                        } else {
                          return _buttonsCreateAccount();
                        }
                      }),
                    )
                  ],
                ),
              ),
      ),
    );
  }
}
