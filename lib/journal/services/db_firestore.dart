import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:training/journal/models/journal.dart';
import 'package:training/journal/services/db_firestore_api.dart';

class DbFirestoreService implements DbApi {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String _collectionJournals = 'journals';

  @override
  Future<bool> addJournal(Journal journal) async {
    await _firestore.collection(_collectionJournals).add({
      'date': journal.date,
      'mood': journal.mood,
      'note': journal.note,
      'uid': journal.uid,
    });
    return true;
  }

  @override
  void deleteJournal(Journal journal) async {
    await _firestore
        .collection(_collectionJournals)
        .doc(journal.documentID)
        .delete()
        .catchError((error) => log('Error while deleting: $error'));
  }

  @override
  Future<Journal> getJournal(String documentID) async {

  }

  @override
  Stream<List<Journal>> getJournalList(String uid) {
    return _firestore
        .collection(_collectionJournals)
        .where('uid', isEqualTo: uid)
        .snapshots()
        .map((QuerySnapshot snapshot) {
      List<Journal> _journalDocs =
          snapshot.docs.map((doc) => Journal.fromDoc(doc)).toList();
      _journalDocs.sort((comp1, comp2) => comp2.date.compareTo(comp1.date));
      return _journalDocs;
    });
  }

  @override
  void updateJournal(Journal journal) async {
    await _firestore
        .collection(_collectionJournals)
        .doc(journal.documentID)
        .update({
      'date': journal.date,
      'mood': journal.mood,
      'note': journal.note,
      'uid': journal.uid,
    }).catchError((error) => log('Error when updating: $error'));
  }

  @override
  void updateJournalWithTransaction(Journal journal) {

  }
}
