import 'package:flutter/material.dart';
import 'HomePage.dart';

class SeatPage extends StatefulWidget {
  const SeatPage({super.key});

  @override
  State<SeatPage> createState() => _SeatPageState();
}

class _SeatPageState extends State<SeatPage> {
  Set<String> selectedSeats = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('좌석 선택'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // 출발역-도착역 표시
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                Text(
                  '수서',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.purple,
                  ),
                ),
                Icon(
                  Icons.arrow_circle_right_outlined,
                  size: 30,
                  color: Colors.black,
                ),
                Text(
                  '부산',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.purple,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            
            // 좌석 상태 표시
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    color: Colors.purple,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                const SizedBox(width: 4),
                const Text('선택됨'),
                const SizedBox(width: 20),
                Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                const SizedBox(width: 4),
                const Text('선택안됨'),
              ],
            ),
            const SizedBox(height: 20),

            // ABCD 레이블
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ...['A', 'B'].map((label) => 
                    Container(
                      width: 50,
                      height: 50,
                      alignment: Alignment.center,
                      margin: const EdgeInsets.symmetric(horizontal: 2),
                      child: Text(
                        label,
                        style: const TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    alignment: Alignment.center,
                    child: Text(
                      '',
                      style: const TextStyle(fontSize: 18),
                    ),
                  ),
                  ...['C', 'D'].map((label) => 
                    Container(
                      width: 50,
                      height: 50,
                      alignment: Alignment.center,
                      margin: const EdgeInsets.symmetric(horizontal: 2),
                      child: Text(
                        label,
                        style: const TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // 좌석 목록
            Expanded(
              child: ListView.builder(
                itemCount: 20,
                itemBuilder: (context, row) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // A, B 좌석
                        ...['A', 'B'].map((col) {
                          String seatNumber = '${row + 1}$col';
                          bool isSelected = selectedSeats.contains(seatNumber);
                          return Container(
                            width: 50,
                            height: 50,
                            margin: const EdgeInsets.symmetric(horizontal: 2),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  if (isSelected) {
                                    selectedSeats.remove(seatNumber);
                                  } else {
                                    selectedSeats.add(seatNumber);
                                  }
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: isSelected ? Colors.purple : Colors.grey[300],
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                          );
                        }),
                        
                        // 행 번호
                        Container(
                          width: 50,
                          height: 50,
                          alignment: Alignment.center,
                          child: Text(
                            '${row + 1}',
                            style: const TextStyle(fontSize: 18),
                          ),
                        ),
                        
                        // C, D 좌석
                        ...['C', 'D'].map((col) {
                          String seatNumber = '${row + 1}$col';
                          bool isSelected = selectedSeats.contains(seatNumber);
                          return Container(
                            width: 50,
                            height: 50,
                            margin: const EdgeInsets.symmetric(horizontal: 2),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  if (isSelected) {
                                    selectedSeats.remove(seatNumber);
                                  } else {
                                    selectedSeats.add(seatNumber);
                                  }
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: isSelected ? Colors.purple : Colors.grey[300],
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                          );
                        }),
                      ],
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 20),
            // 예매하기 버튼
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: selectedSeats.isNotEmpty ? () {
                  if (selectedSeats.length == 1) {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Text(
                                '예매 하시겠습니까?',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 8),
                              Text(
                                '좌석 : ${selectedSeats.first}',
                                style: const TextStyle(
                                  fontSize: 14,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                          actions: [
                            Container(
                              decoration: BoxDecoration(
                                border: Border(
                                  top: BorderSide(color: Colors.grey[300]!),
                                ),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop(); // Dialog 제거
                                      },
                                      style: TextButton.styleFrom(
                                        padding: const EdgeInsets.symmetric(vertical: 12),
                                      ),
                                      child: const Text(
                                        '취소',
                                        style: TextStyle(
                                          color: Colors.red,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 1,
                                    height: 40,
                                    color: Colors.grey[300],
                                  ),
                                  Expanded(
                                    child: TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop(); // Dialog 제거
                                        Navigator.of(context).pushAndRemoveUntil(
                                          MaterialPageRoute(
                                            builder: (context) => const HomePage(),
                                          ),
                                          (route) => false, // 모든 이전 화면 제거
                                        );
                                      },
                                      style: TextButton.styleFrom(
                                        padding: const EdgeInsets.symmetric(vertical: 12),
                                      ),
                                      child: const Text(
                                        '확인',
                                        style: TextStyle(
                                          color: Colors.blue,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          contentPadding: const EdgeInsets.fromLTRB(24, 20, 24, 20),
                          actionsPadding: EdgeInsets.zero,
                          titlePadding: EdgeInsets.zero,
                        );
                      },
                    );
                  }
                } : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: const Text(
                  '예매하기',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}