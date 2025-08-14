import 'package:flutter/material.dart';

class HomeTextButton extends StatelessWidget {
  const HomeTextButton({super.key});

  @override
  Widget build(BuildContext contest) {
    return Center(
      child: Column(
        children: [
          TextButton(
            style: TextButton.styleFrom(
              textStyle: const TextStyle(fontSize: 20),
            ),
            onPressed: () {},
            child: const Text('Disabled', style: TextStyle(color: Colors.grey)),
          ),

          // Enable
          TextButton(
            style: TextButton.styleFrom(
              textStyle: const TextStyle(fontSize: 20),
            ),
            onPressed: () {},
            child: const Text('Enabled', style: TextStyle(color: Colors.blue)),
          ),

          // Gradient
          ClipRRect(
            // 자식 위젯을 둥근 사각형 모양으로 잘라내는 위젯
            borderRadius: BorderRadius.circular(4), // 모서리 둥근 정도 (4px radius)
            child: Stack(
              // 여러 위젯을 겹쳐서 배치할 수 있는 위젯
              children: <Widget>[
                Positioned.fill(
                  // 부모 영역을 가득 채우도록 배치
                  child: Container(
                    decoration: const BoxDecoration(
                      // BoxDecoration: 배경, 테두리, 그림자 등을 설정
                      gradient: LinearGradient(
                        // 선형 그라데이션 배경
                        colors: <Color>[
                          Color(0xFF0D47A1), // 진한 파랑
                          Color(0xFF1976D2), // 중간 파랑
                          Color(0xFF42A5F5), // 밝은 파랑
                        ],
                      ),
                    ),
                  ),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white, // 버튼 텍스트/아이콘 색상
                    padding: const EdgeInsets.all(16.0), // 버튼 안쪽 여백
                    textStyle: const TextStyle(
                      fontSize: 20,
                    ), // 버튼 텍스트 스타일 (폰트 크기)
                  ),
                  onPressed: () {}, // 버튼 클릭 시 실행할 동작
                  child: const Text('Gradient'), // 버튼에 표시될 텍스트
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
