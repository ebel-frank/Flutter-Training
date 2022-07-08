import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:training/journal/blocs/journal_edit_bloc.dart';
import 'package:training/journal/blocs/journal_edit_bloc_provider.dart';
import 'package:training/journal/classes/format_dates.dart';

import '../classes/mood_icons.dart';

class EditEntry extends StatefulWidget {
  const EditEntry({Key? key}) : super(key: key);

  @override
  State<EditEntry> createState() => _EditEntryState();
}

class _EditEntryState extends State<EditEntry> {
  late JournalEditBloc _journalEditBloc;
  late FormatDates _formatDates;
  late MoodIcons _moodIcons;
  late TextEditingController _noteController;
  late DateTime _selectedDate;

  Future<String> _selectDate(String selectedDate) async {
    DateTime _initialDate = DateTime.parse(selectedDate);
    final _pickedDate = await showDatePicker(
        context: context,
        initialDate: _initialDate,
        firstDate: DateTime.now().subtract(const Duration(days: 365)),
        lastDate: DateTime.now().add(const Duration(days: 365)));
    if (_pickedDate != null) {
      selectedDate = DateTime(
              _pickedDate.year,
              _pickedDate.month,
              _pickedDate.day,
              _initialDate.hour,
              _initialDate.minute,
              _initialDate.second,
              _initialDate.millisecond,
              _initialDate.microsecond)
          .toString();
    }
    return selectedDate;
  }

  void _addOrUpdateJournal() {
    _journalEditBloc.saveJournalChanged.add('Save');
    Navigator.pop(context);
  }

  @override
  void initState() {
    super.initState();
    _formatDates = FormatDates();
    _moodIcons = MoodIcons();
    _noteController = TextEditingController();
    _noteController.text = '';
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _journalEditBloc = JournalEditBlocProvider.of(context).journalEditBloc;
  }

  @override
  void dispose() {
    _noteController.dispose();
    _journalEditBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Entry',
          style: TextStyle(color: Colors.lightGreen.shade800),
        ),
        centerTitle: true,
        elevation: 0,
        automaticallyImplyLeading: false,
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
      ),
      body: SafeArea(
          minimum: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                StreamBuilder<String>(
                  stream: _journalEditBloc.dateEdit,
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Container();
                    }
                    return TextButton(
                      onPressed: () async {
                        FocusScope.of(context).requestFocus(FocusNode());
                        String? _pickerDate = await _selectDate(snapshot.data!);
                        _journalEditBloc.dateEditChanged.add(_pickerDate);
                      },
                      child: Row(
                        children: [
                          const Icon(
                            Icons.calendar_today,
                            size: 22,
                            color: Colors.black54,
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          Text(
                            DateFormat.yMMMEd().format(_selectedDate),
                            style: const TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.bold),
                          ),
                          const Icon(
                            Icons.arrow_drop_down,
                            color: Colors.black54,
                          )
                        ],
                      ),
                    );
                  },
                ),
                StreamBuilder(
                  stream: _journalEditBloc.moodEdit,
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Container();
                    }
                    return DropdownButtonHideUnderline(
                        child: DropdownButton<MoodIcon>(
                      items: _moodIcons
                          .getMoodIconList()
                          .map((selected) => DropdownMenuItem<MoodIcon>(
                              value: selected,
                              child: Row(
                                children: [
                                  Transform(
                                    transform: Matrix4.identity()
                                      ..rotateZ(_moodIcons
                                          .getMoodRotation(selected.title)),
                                    alignment: Alignment.centerLeft,
                                    child: Icon(
                                      _moodIcons.getMoodIcon(selected.title),
                                      color: _moodIcons
                                          .getMoodColor(selected.title),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 16,
                                  ),
                                  Text(selected.title)
                                ],
                              )))
                          .toList(),
                      value: _moodIcons.getMoodIconList()[_moodIcons
                          .getMoodIconList()
                          .indexWhere((icon) => icon.title == snapshot.data)],
                      onChanged: (selected) {
                        _journalEditBloc.moodEditChanged.add(selected!.title);
                      },
                    ));
                  },
                ),
                StreamBuilder<String>(
                  stream: _journalEditBloc.noteEdit,
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Container();
                    }
                    _noteController.value =
                        _noteController.value.copyWith(text: snapshot.data!);
                    return TextField(
                      controller: _noteController,
                      textInputAction: TextInputAction.newline,
                      textCapitalization: TextCapitalization.sentences,
                      decoration: const InputDecoration(
                        labelText: 'Note',
                        icon: Icon(Icons.subject),
                      ),
                      maxLines: null,
                      onChanged: (note) =>
                          _journalEditBloc.noteEditChanged.add(note),
                    );
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.grey.shade100)),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text("Cancel"),
                    ),
                    const SizedBox(
                      width: 8.0,
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              Colors.lightGreen.shade100)),
                      onPressed: () {
                        _addOrUpdateJournal();
                      },
                      child: const Text("Save"),
                    ),
                  ],
                )
              ],
            ),
          )),
    );
  }
}
