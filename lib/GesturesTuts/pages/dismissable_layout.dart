

import 'dart:developer';

import 'package:flutter/material.dart';

class DismissableHome extends StatefulWidget {
  const DismissableHome({Key? key}) : super(key: key);

  @override
  State<DismissableHome> createState() => _DismissableHomeState();
}

class _DismissableHomeState extends State<DismissableHome> {
  final List<Trip> _trips = [];

  void _markTripCompleted() {
    // Mark trip completed in Database or web service
    log("Trip Completed");
  }

  void _deleteTrip() {
    // Delete trip from Database or web service
    log("Trip Deleted");
  }

  @override
  void initState() {
    super.initState();
    _trips
      ..add(Trip(id: "0", tripName: "Rome", tripLocation: "Italy"))
      ..add(Trip(id: '1', tripName: 'Paris', tripLocation: 'France'))
      ..add(Trip(id: '2', tripName: 'New York', tripLocation: 'USA - New York'))
      ..add(Trip(id: '3', tripName: 'Cancun', tripLocation: 'Mexico'))
      ..add(Trip(id: '4', tripName: 'London', tripLocation: 'England'))
      ..add(Trip(id: '5', tripName: 'Sydney', tripLocation: 'Australia'))
      ..add(Trip(id: '6', tripName: 'Miami', tripLocation: 'USA - Florida'))
      ..add(Trip(id: '7', tripName: 'Rio de Janeiro', tripLocation: 'Brazil'))
      ..add(Trip(id: '8', tripName: 'Cusco', tripLocation: 'Peru'))
      ..add(Trip(id: '9', tripName: 'New Delhi', tripLocation: 'India'))
      ..add(Trip(id: '10', tripName: 'Tokyo', tripLocation: 'Japan'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView.builder(
            itemCount: _trips.length,
            itemBuilder: (BuildContext context, int index) => Dismissible(
                  key: Key(_trips[index].id),
                  background: Container(
                    color: Colors.green,
                    child: Padding(
                      padding: const EdgeInsets.all(14),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          Icon(
                            Icons.done,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                  ),
                  secondaryBackground: Container(
                    color: Colors.red,
                    child: Padding(
                      padding: const EdgeInsets.all(14),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: const [
                          Icon(Icons.delete, color: Colors.white,)
                        ],
                      ),
                    ),
                  ),
                  child: ListTile(
                    title: Text(_trips[index].tripName),
                    subtitle: Text(_trips[index].tripLocation),
                    leading: const Icon(Icons.flight),
                    trailing: const Icon(Icons.fastfood),
                  ),
                  onDismissed: (DismissDirection direction) {
                    direction == DismissDirection.startToEnd
                        ? _markTripCompleted()
                        : _deleteTrip();
                    setState(() {
                      _trips.removeAt(index);
                    });
                  },
                )),
      ),
    );
  }
}

// model class
class Trip {
  String id, tripName, tripLocation;

  Trip({required this.id, required this.tripName, required this.tripLocation});
}
