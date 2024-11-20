import 'package:flutter/material.dart';
import 'SeatPage.dart';
import 'StationListPage.dart';

class HomePage extends StatefulWidget {
  // 홈페이지의 상태를 관리하는 StatefulWidget 생성
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // 출발역과 도착역을 저장할 nullable 문자열 변수
  String? startStation;
  String? endStation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 앱바 설정 - 기차 예매 타이틀 표시
      appBar: AppBar(
        title: const Text('기차 예매'),
      ),
      // 본문 내용 패딩과 가운데 정렬
      body: Container(
        color: Colors.grey[200], // 배경색 전체 적용
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // 출발역 선택 컬럼
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // 출발역 텍스트
                      Text(
                        '출발역',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      // 출발역 선택 버튼 - 누르면 역 목록 페이지로 이동
                  TextButton(
                    onPressed: () async {
                      final selected = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => StationListPage(
                            isStart: true,
                            onStationSelected: (String station) {},
                            excludeStation: endStation, // 도착역이 선택되어 있다면 제외
                          ),
                        ),
                      );
                      if (selected != null) {
                        setState(() {
                          startStation = selected;
                        });
                      }
                    },
                    child: Text(
                      startStation ?? '선택',
                      style: TextStyle(
                        fontSize: 40,
                        color: Colors.black,
                      ),
                    ),
                  ),
                    ],
                  ),
                  // 구분선
                  Container(
                    width: 2,
                    height: 50,
                    color: Colors.grey[400],
                  ),
                  // 도착역 선택 컬럼
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // 도착역 텍스트
                      Text(
                        '도착역',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      // 도착역 선택 버튼 - 누르면 역 목록 페이지로 이동
                      TextButton(
                        onPressed: () async {
                          final selected = await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => StationListPage(
                                isStart: false,
                                onStationSelected: (String station) {},
                                excludeStation: startStation, // 출발역이 선택되어 있다면 제외
                              ),
                            ),
                          );
                          if (selected != null) {
                            setState(() {
                              endStation = selected;
                            });
                          }
                        },
                        child: Text(
                          endStation ?? '선택',
                          style: TextStyle(
                            fontSize: 40,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            //좌석 선택 버튼
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: startStation != null && endStation != null
                    ? () {
                        // SeatPage로 이동
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SeatPage(),
                          ),
                        );
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  disabledBackgroundColor: Colors.purple.withOpacity(0.5), // 비활성화 상태에서도 보라색 유지
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Text(
                  '좌석 선택',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18, // 글씨 크기 18
                    fontWeight: FontWeight.bold, // 글자 두께 bold
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ),);
  }
}