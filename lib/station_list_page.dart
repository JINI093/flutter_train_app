import 'package:flutter/material.dart';

class StationListPage extends StatelessWidget {
  final bool isStart;
  
  const StationListPage({super.key, required this.isStart});

  @override
  Widget build(BuildContext context) {
    const stations = [
      "수서", "동탄", "평택지제", "천안아산", "오송",
      "대전", "김천구미", "동대구", "경주", "울산", "부산"
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(isStart ? '출발역' : '도착역'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        leading: const BackButton(color: Colors.black),
      ),
      body: ListView.separated(
        itemCount: stations.length,
        separatorBuilder: (context, index) => const Divider(),
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(stations[index]),
            onTap: () {
              Navigator.pop(context, stations[index]);
            },
          );
        },
      ),
    );
  }
}