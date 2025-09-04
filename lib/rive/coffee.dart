import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

// 커피 평점 애니메이션 화면
class CoffeeRatingScreen extends StatefulWidget {
  const CoffeeRatingScreen({super.key});

  @override
  State<CoffeeRatingScreen> createState() => _CoffeeRatingScreenState();
}

class _CoffeeRatingScreenState extends State<CoffeeRatingScreen> {
  // Rive State Machine Controller
  StateMachineController? _controller;

  // Rive 입력 값들 (State Machine 안에서 정의한 Input과 연결)
  SMIInput<double>? _ratingInput; // 별점 값 (0 ~ 5)
  SMIInput<bool>? _sucksInput; // 커피가 별로일 때 true/false

  // Rive 초기화 시 실행되는 콜백
  void _onInit(Artboard artboard) {
    // 아트보드에서 "State Machine 1" 컨트롤러 찾기
    final controller = StateMachineController.fromArtboard(
      artboard,
      "State Machine 1", // Rive 에디터에서 정의된 State Machine 이름
    );

    if (controller != null) {
      // 아트보드에 컨트롤러 등록
      artboard.addController(controller);
      _controller = controller;

      // State Machine 안에서 정의된 Input 값들을 찾아옴
      _ratingInput = controller.findInput<double>("rating 1"); // 별점 입력
      _sucksInput = controller.findInput<bool>("sucks"); // Sucks 입력
    }
  }

  // ⭐ 별점 설정 메소드
  void _setRating(double value) {
    _ratingInput?.value = value;
  }

  // ☹️ Sucks 설정 메소드
  void _setSucks(bool value) {
    _sucksInput?.value = value;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Rate your coffee ☕")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Rive 애니메이션 표시 영역
          SizedBox(
            height: 400,
            width: 400,
            child: RiveAnimation.asset(
              "assets/animations/rate_your_coffe_popup.riv", // 불러올 Rive 파일 경로
              fit: BoxFit.contain, // 화면에 맞게 배치
              artboard: "Artboard", // 아트보드 이름 (Rive 편집기에서 확인)
              stateMachines: const ["State Machine 1"], // State Machine 이름
              onInit: _onInit, // 초기화 시 실행할 콜백
            ),
          ),
          const SizedBox(height: 20),

          // ⭐ 별점 버튼들
          Wrap(
            spacing: 10,
            children: [
              ElevatedButton(
                onPressed: () => _setRating(1),
                child: const Text("⭐ 1"),
              ),
              ElevatedButton(
                onPressed: () => _setRating(2),
                child: const Text("⭐ 2"),
              ),
              ElevatedButton(
                onPressed: () => _setRating(3),
                child: const Text("⭐ 3"),
              ),
              ElevatedButton(
                onPressed: () => _setRating(4),
                child: const Text("⭐ 4"),
              ),
              // ElevatedButton(
              //   onPressed: () => _setRating(5),
              //   child: const Text("⭐ 5"),
              // ),
            ],
          ),
          const SizedBox(height: 10),

          // ☹️ Sucks 버튼
          ElevatedButton(
            onPressed: () => _setSucks(true),
            child: const Text("☹️ Sucks"),
          ),
          ElevatedButton(
            onPressed: () => _setSucks(false),
            child: const Text("☹️ Goods"),
          ),
        ],
      ),
    );
  }
}
