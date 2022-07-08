// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:training/journal/blocs/authentication_bloc_provider.dart';
import 'package:training/journal/classes/format_dates.dart';
import 'package:training/journal/classes/mood_icons.dart';

import '../blocs/authentication_bloc.dart';
import '../blocs/home_bloc.dart';
import '../blocs/home_bloc_provider.dart';
import '../models/journal.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late AuthenticationBloc _authenticationBloc;
  late HomeBloc _homeBloc;
  late String _uid;
  final MoodIcons _moodIcons = MoodIcons();
  final FormatDates _formatDates = FormatDates();

  Future<bool> _confirmDeleteJournal() async {
    return await showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) => AlertDialog(
              title: const Text("Delete Journal"),
              content: const Text("Are you sure you would like to Delete?"),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context, false);
                    },
                    child: const Text("CANCEL")),
                TextButton(
                    onPressed: () {
                      Navigator.pop(context, true);
                    },
                    child: const Text(
                      "DELETE",
                      style: TextStyle(color: Colors.red),
                    )),
              ],
            ));
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _authenticationBloc =
        AuthenticationBlocProvider.of(context).authenticationBloc;
    _homeBloc = HomeBlocProvider.of(context).homeBloc;
    _uid = HomeBlocProvider.of(context).uid;
  }

  @override
  void dispose() {
    _homeBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Journal",
          style: TextStyle(color: Colors.lightGreen.shade800),
        ),
        centerTitle: true,
        elevation: 0,
        bottom: PreferredSize(
          child: Container(),
          preferredSize: const Size.fromHeight(32),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: [Colors.lightGreen, Colors.lightGreen.shade50],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          )),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.exit_to_app,
              color: Colors.lightGreen.shade800,
            ),
            onPressed: () {
              // signOut
              _authenticationBloc.logoutUser.add(true);
            },
          ),
        ],
      ),
      body: StreamBuilder<List<Journal>>(
          stream: _homeBloc.listJournal,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasData) {
              return ListView.separated(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    String _titleDate =
                        _formatDates.dateFormatShortMonthDayYear(
                            snapshot.data![index].date);
                    String _subtitle = snapshot.data![index].mood +
                        "\n" +
                        snapshot.data![index].note;

                    return Dismissible(
                      key: Key(snapshot.data![index].documentID),
                      child: ListTile(
                        title: Text(_titleDate),
                        subtitle: Text(_subtitle),
                        leading: Column(
                          children: [
                            Text(
                              _formatDates.dateFormatShortMonthDayYear(
                                  snapshot.data![index].date),
                              style: const TextStyle(
                                  color: Colors.lightGreen,
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(_formatDates.dateFormatShortMonthDayYear(
                                snapshot.data![index].date)),
                          ],
                        ),
                        trailing: Transform(
                          transform: Matrix4.rotationZ(_moodIcons
                              .getMoodRotation(snapshot.data![index].mood)),
                          alignment: Alignment.center,
                          child: Icon(
                            _moodIcons.getMoodIcon(snapshot.data![index].mood),
                            color: _moodIcons
                                .getMoodColor(snapshot.data![index].mood),
                            size: 42.0,
                          ),
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
                      background: Container(
                        color: Colors.red,
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.only(left: 16),
                        child: const Icon(
                          Icons.delete,
                          color: Colors.white,
                        ),
                      ),
                      confirmDismiss: (direction) async {
                        bool confirmDelete = await _confirmDeleteJournal();
                        if (confirmDelete) {
                          _homeBloc.deleteJournal.add(snapshot.data![index]);
                        }
                      },
                    );
                  },
                  separatorBuilder: (context, _) => const Divider(
                        color: Colors.grey,
                      ));
            } else {
              return const Center(
                child: Text('Add Journals.'),
              );
            }
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // Add _addOrEditJournal method
          //_addOrEditJournal(add: true, journal: Journal(uid: _uid));
        },
        tooltip: 'Add Journal Entry',
        backgroundColor: Colors.lightGreen.shade300,
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: [Colors.lightGreen.shade50, Colors.lightGreen],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          )),
          height: 44,
        ),
      ),
    );
  }
}
