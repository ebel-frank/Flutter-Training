import 'dart:async';

import 'package:training/journal/models/journal.dart';

class HomeBloc {
  final DbApi dbApi;

  final StreamController<List<Journal>> _journalController = StreamController<List<Journal>>();
  Sink<List<Journal>> get _addJournal => _journalController.sink;
  Stream<List<Journal>> get listJournal => _journalController.stream;

  // Constructor
  HomeBloc(this.dbApi) {
    _startListeners();
  }

  // Close StreamControllers when no longer needed
  void dispose() {
    _journalController.close()
  }

  void _startListeners() {
    // Retrieve Firestore Journal Records as List<Journal> not DocumentSnapshot
    dbApi.getJournalList().listen((journalDocs) {
      _addListJournal.add(journalDocs);
    });
  }

}