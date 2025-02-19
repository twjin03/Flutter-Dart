import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ResponsiveDashboard(),
    );
  }
}

class ResponsiveDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('반응형 대시보드')),
      body: Padding(
        padding: EdgeInsets.all(16), // 고정 패딩 적용
        child: LayoutBuilder(
          builder: (context, constraints) {
            // 화면 너비에 따라 그리드 열 개수 변경
            int crossAxisCount = constraints.maxWidth > 600 ? 4 : 2; // 태블릿 이상: 4, 모바일: 2

            return GridView.builder(
              itemCount: 8,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 1.2, // 카드 비율
              ),
              itemBuilder: (context, index) {
                return DashboardCard(index: index);
              },
            );
          },
        ),
      ),
    );
  }
}

class DashboardCard extends StatelessWidget {
  final int index;

  DashboardCard({required this.index});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width; // 화면 너비 가져오기
    double cardSize = screenWidth > 600 ? 120 : 80; // 태블릿과 모바일에서 크기 다르게 설정

    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blueAccent,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 5,
            spreadRadius: 1,
          )
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.dashboard, size: cardSize * 0.4, color: Colors.white),
          SizedBox(height: 10),
          Text(
            '카드 $index',
            style: TextStyle(fontSize: cardSize * 0.2, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
