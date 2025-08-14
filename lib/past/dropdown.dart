import 'package:flutter/material.dart';

// 드롭다운 버튼을 보여주는 StatefulWidget
class HomeDropDown extends StatefulWidget {
  const HomeDropDown({super.key});

  @override
  State<HomeDropDown> createState() => _HomeDropDownState();
}

// 상태(State)를 관리하는 클래스
// 여기서 드롭다운의 현재 선택 값 등 변하는 데이터를 관리
class _HomeDropDownState extends State<HomeDropDown> {
  // 드롭다운에 표시할 문자열 목록
  final List<String> list = <String>['PARD', 'P', 'A', 'R', 'D'];

  // 현재 선택된 값 (초기값 'PARD')
  String dropdownValue = 'PARD';

  @override
  Widget build(BuildContext contest) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min, // Column의 세로 크기를 자식 위젯 최소 높이에 맞춤
        children: <Widget>[
          DropdownButton(
            // 현재 선택된 값
            value: dropdownValue,
            // 드롭다운 오른쪽의 화살표 아이콘
            icon: const Icon(Icons.arrow_drop_down),
            // 드롭다운에서 선택된 항목의 텍스트 스타일
            style: const TextStyle(color: Colors.deepOrange),
            // 드롭다운 아래쪽 밑줄 모양 설정
            underline: Container(height: 2, color: Colors.deepOrange),
            // 값이 변경되었을 때 실행되는 콜백
            onChanged: (value) {
              setState(() {
                // 새로운 값을 상태에 반영하고 UI를 재빌드
                dropdownValue = value!;
              });
            },
            // 드롭다운 항목 리스트 생성
            // list의 각 요소를 DropdownMenuItem으로 변환
            items: list.map<DropdownMenuItem<String>>((item) {
              return DropdownMenuItem(
                value: item, // 해당 항목의 실제 값
                child: Text(item), // UI에 표시할 텍스트
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
