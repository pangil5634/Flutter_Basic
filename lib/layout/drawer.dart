import 'package:flutter/material.dart';

class LayoutDrawer extends StatelessWidget {
  const LayoutDrawer({super.key});

  @override
  Widget build(BuildContext contest) {
    return Drawer(
      // 좌측 또는 우측에서 슬라이드로 열리는 네비게이션 메뉴 위젯
      child: ListView(
        // Drawer 내부의 스크롤 가능한 리스트
        padding: EdgeInsets.zero, // 기본 패딩 제거 (상단 여백 제거)
        children: <Widget>[
          const DrawerHeader(
            // Drawer의 상단 영역 (헤더)
            decoration: BoxDecoration(color: Colors.blue), // 헤더 배경색 설정
            child: Text(
              'Drawer Header', // 헤더에 표시할 텍스트
              style: TextStyle(color: Colors.white, fontSize: 24), // 글자색, 크기
            ),
          ),
          // 첫 번째 메뉴 항목
          ListTile(
            leading: const Icon(Icons.message), // 메뉴 왼쪽에 표시할 아이콘
            title: const Text('Messages'), // 메뉴 텍스트
            onTap: () {}, // 탭했을 때 실행할 동작
          ),
          // 두 번째 메뉴 항목
          ListTile(
            leading: const Icon(Icons.account_circle), // 아이콘
            title: const Text('Profile'), // 텍스트
            onTap: () {}, // 클릭 동작
          ),
          // 세 번째 메뉴 항목
          ListTile(
            leading: const Icon(Icons.settings), // 아이콘
            title: const Text('Settings'), // 텍스트
            onTap: () {}, // 클릭 동작
          ),
        ],
      ),
    );
  }
}
