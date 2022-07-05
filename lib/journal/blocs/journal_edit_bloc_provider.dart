import 'package:flutter/cupertino.dart';

import '../models/journal.dart';
import 'journal_edit_bloc.dart';

class JournalEditBlocProvider extends InheritedWidget {
  final JournalEditBloc journalEditBloc;
  final bool add;
  final Journal journal;

  const JournalEditBlocProvider(
      {Key? key, required Widget child, required this.journalEditBloc, required this.add, required this.journal})
      : super(key: key, child: child);

  static JournalEditBlocProvider of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType(
        aspect: JournalEditBlocProvider) as JournalEditBlocProvider);
    }

  @override
  bool updateShouldNotify(covariant JournalEditBlocProvider oldWidget) => false;

}