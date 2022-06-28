import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:training/local_persistence/classes/database_file_routines.dart';
import 'package:training/local_persistence/classes/journal_edit.dart';

import '../classes/database.dart';
import '../classes/database_file_routines.dart';
import '../classes/journal.dart';
import 'edit_entry.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Database _database;

  Future<void> _addOrEditJournal(
      {required bool add, required int index, required Journal journal}) async {
    JournalEdit _journalEdit = JournalEdit(action: '', journal: journal);
    _journalEdit = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => EditEntry(
                  add: add,
                  index: index,
                  journalEdit: _journalEdit,
                ),
            fullscreenDialog: true));
    switch (_journalEdit.action) {
      case 'Save':
        if (add) {
          setState(() {
            _database.journal.add(_journalEdit.journal);
          });
        } else {
          setState(() {
            _database.journal[index] = _journalEdit.journal;
          });
        }
        DatabaseFileRoutines().writeJournals(databaseToJson(_database));
        break;
      case 'Cancel':
        break;
      default:
        break;
    }
  }

  Future<List<Journal>> _loadJournals() async {
    await DatabaseFileRoutines().readJournals().then((journalsJson) {
      _database = databaseFromJson(journalsJson);
      _database.journal.sort((comp1, comp2) => comp2.date
          .compareTo(comp1.date)); // sorts the journal entries by DESC date
    });
    return _database.journal;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Local Persistence"),
        centerTitle: true,
      ),
      body: FutureBuilder(
        initialData: const [],
        future: _loadJournals(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return !snapshot.hasData
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              // Build ListView separated
              : ListView.separated(
                  itemBuilder: (BuildContext context, int index) {
                    String _titleDate = DateFormat.yMMMd()
                        .format(DateTime.parse(snapshot.data[index].date));
                    String _subtitleDate = snapshot.data[index].mood +
                        "\n" +
                        snapshot.data[index].note;
                    return Dismissible(
                      key: Key(snapshot.data[index].id),
                      child: ListTile(
                        leading: Column(
                          children: [
                            Text(
                              DateFormat.d().format(
                                  DateTime.parse(snapshot.data[index].date)),
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 32,
                                  color: Colors.blue),
                            ),
                            Text(DateFormat.E().format(
                                DateTime.parse(snapshot.data[index].date))),
                          ],
                        ),
                        title: Text(
                          _titleDate,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(_subtitleDate),
                        onTap: () {
                          _addOrEditJournal(
                              add: false,
                              index: index,
                              journal: snapshot.data[index]);
                        },
                      ),
                      background: Container(
                        color: Colors.red,
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.only(left: 16),
                        child: const Icon(
                          Icons.delete,
                          color: Colors.white,
                        ),
                      ),
                      secondaryBackground: Container(
                        color: Colors.red,
                        alignment: Alignment.centerRight,
                        padding: const EdgeInsets.only(right: 16),
                        child: const Icon(
                          Icons.delete,
                          color: Colors.white,
                        ),
                      ),
                      onDismissed: (direction) {
                        setState(() {
                          _database.journal.removeAt(index);
                        });
                        DatabaseFileRoutines()
                            .writeJournals(databaseToJson(_database));
                      },
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                      const Divider(
                        color: Colors.grey,
                      ),
                  itemCount: snapshot.data.length);
        },
      ),
      bottomNavigationBar: const BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Padding(
          padding: EdgeInsets.all(24),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _addOrEditJournal(
              add: true,
              index: -1,
              journal: Journal(id: '', date: '', mood: '', note: ''));
        },
        tooltip: "Add Journal Entry",
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
