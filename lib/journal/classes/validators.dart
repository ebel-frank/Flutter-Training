import 'dart:async';

class Validators {
  final validateEmail = StreamTransformer.fromHandlers(handleData: (String email, sink) {
    if(email.contains('@') && email.contains('.')) {
      sink.add(email);
    } else {
      sink.addError('Enter a valid email');
    }
  });

  final validatePassword = StreamTransformer.fromHandlers(handleData: (String password, sink) {
    if(password.length >= 6) {
      sink.add(password);
    } else {
      sink.addError('Password must be at least 6 characters');
    }
  });
}