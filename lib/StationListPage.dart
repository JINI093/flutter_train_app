import 'package:flutter/material.dart';
import 'HomePage.dart';
import 'SeatPage.dart';

class StationListPage extends StatelessWidget {
  final bool isStart;
  final String? excludeStation;
  
  const StationListPage({
    super.key, 
    required this.isStart, 
    required Null Function(String station) onStationSelected,
    this.excludeStation,
  });

  @override
  Widget build(BuildContext context) {
    final List<String> allStations = [
      "수서", "동탄", "평택지제", "천안아산", "오송",
      "대전", "김천구미", "동대구", "경주", "울산", "부산"
    ];

    final stations = excludeStation != null 
        ? allStations.where((station) => station != excludeStation).toList()
        : allStations;

    return Scaffold(
      appBar: AppBar(
        title: Text(isStart ? '출발역' : '도착역'),
      ),
      body: ListView.builder(
        itemCount: stations.length,
        itemBuilder: (context, index) {
          return Container(
            height: 50,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.grey[300]!,
                ),
              ),
            ),
            child: ListTile(
              title: Text(
                stations[index],
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {
                Navigator.pop(context, stations[index]);
              },
            ),
          );
        },
      ),
    );
  }
}