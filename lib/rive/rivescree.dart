import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class RiveScreen extends StatefulWidget {
  const RiveScreen({super.key});

  @override
  State<RiveScreen> createState() => _RiveScreenState();
}

class _RiveScreenState extends State<RiveScreen> {
  late final StateMachineController _stateMachineController;

  //아트보드 초기화 메소드(RIVE 애니메이션이 그려지는 보드)
  void _onInit(Artboard artboard) {
    _stateMachineController = StateMachineController.fromArtboard(
      artboard,
      "State Machine 1",
      onStateChange: (stateMachineName, stateName) {
        //State가 바뀔 때 값을 가져옴
        //stateMachineName:State Machine 1
        //stateName: Correct, Incorrect, Idle
        final snackBar = SnackBar(
          content: Text(
            '$stateMachineName / $stateName',
            style: const TextStyle(fontSize: 28, color: Colors.yellow),
          ),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      },
    )!;
    artboard.addController(_stateMachineController);
  }

  //Correct 버튼을 클릭했을 때 메소드
  void _onTapCorrect() {
    //state Machine 으로 부터 "Correct" Input을 가져옴(bool형)
    final input = _stateMachineController.findInput<bool>("Correct")!;
    //input이 true로 바뀌었다고 알려줌
    input.change(true);
  }

  //InCorrect 버튼을 클릭했을 때 메소드
  void _onTapIncorrect() {
    //state Machine 으로 부터 "InCorrect" Input을 가져옴(bool형)
    final input = _stateMachineController.findInput<bool>("Incorrect")!;
    //input이 true로 바뀌었다고 알려줌
    input.change(true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 400,
              width: 500,
              //https://rive.app/community/595-1139-bear-avatar-remix/
              child: RiveAnimation.asset(
                //
                "assets/animations/bear_avatar_remix.riv", //경로 입력
                fit: BoxFit.cover,
                artboard: "Artboard", //Artboard 이름 입력
                stateMachines: const ["State Machine 1"], //State Machine명 입력
                onInit: _onInit, //아트보드(Artboard) 초기화 소스 입력
              ),
            ),
            ElevatedButton(
              onPressed: _onTapCorrect,
              child: const Text("Correct Answer"),
            ),
            ElevatedButton(
              onPressed: _onTapIncorrect,
              child: const Text("Incorrect Answer"),
            ),
          ],
        ),
      ),
    );
  }
}
