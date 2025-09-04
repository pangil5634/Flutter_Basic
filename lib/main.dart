import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// MyApp에서 정의된 앱을 실행하라고 Flutter에게 지시한다.
void main() {
  runApp(MyApp());
}

// MyApp 클래스는 StatelessWidget을 확장한다.
// 해당 위젯은 모든 Flutter 앱을 빌드하는 데 사용되는 요소이다.
// 앱 전체 상태를 생성하고, 앱의 이름을 지정하고, 시각적 테마를 정의하고, 홈 위젯을 설정한다.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Namer App',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromARGB(255, 26, 78, 162)),
        ),
        home: MyHomePage(),
      ),
    );
  }
}

// 앱의 상태를 정의한다.
// 상태 글래스는 ChangeNotifier를 확장한다.
// 즉, 자체 변경사항에 관해 다른 항목에게 알릴 수 있다. (예를 들어 현재 단어 쌍이 변경되면, 앱의 일부 위젯이 알아야 한다.)
// 상태가 만들어지고 ChangeNotifierProvider를 사용하여, 전체앱에게 제공된다.
class MyAppState extends ChangeNotifier {
  var current = WordPair.random();

  void getNext() {
    current = WordPair.random();
    // MyAppState를 보고 있는 사람에게 알림을 보낸다.
    notifyListeners();
  }

  var favorites = <WordPair>[];

  // 즐겨찾기 목록에서 현자 단어 쌍을 삭제하거나(이미 있는 경우) 목록에 추가한다.(아직 없는 경우)
  void toggleFavaorite() {
    if (favorites.contains(current)) {
      favorites.remove(current);
    } else {
      favorites.add(current);
    }
    // print(favorites);
    notifyListeners();
  }
}

class MyHomePage extends StatelessWidget {
  // 모든 위젯은 위젯이 항상 최신 상태로 유지되도록, 위젯의 상황이 변경될 때마다 자동으로 호출되는 build() 메소드를 정의한다.
  // watch 메서드를 사용하여 앱의 현재 상태에 관한 변경사항을 추적한다.

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var pair = appState.current;

    IconData icon;
    if (appState.favorites.contains(pair)) {
      icon = Icons.favorite;
    } else {
      icon = Icons.favorite_border;
    }

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Text('A random AWESOME idea:'),
              BigCard(pair: pair),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ElevatedButton.icon(
                      onPressed: () {
                        appState.toggleFavaorite();
                      },
                      icon: Icon(icon),
                      label: Text('Like')),
                  SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // print('button pressed');
                      appState.getNext();
                    },
                    child: Text('Next'),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class BigCard extends StatelessWidget {
  const BigCard({
    super.key,
    required this.pair,
  });

  final WordPair pair;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context); // 앱의 현재 태마를 요청

    // theme.textTheme.을 사용하여 앱의 글꼴 테마에 엑세스한다.
    // bodyMedium (중간 크기의 표준 텍스트) 또는 caption(이미지 설멸용), headlineLarge(큰 헤드라인용) 등이 존재한다.
    // displayMedium에서 copyWith를 호출하면, 정의된 변경사항이 포함된 텍스트 스타일의 시본이 반환된다. (여기서는 color만)
    final style = theme.textTheme.displayMedium!.copyWith(
      color: theme.colorScheme.onPrimary,
      fontWeight: FontWeight.bold,
    );

    return Card(
      color:
          theme.colorScheme.primary, // 테마 colorScheme 속성과 동일하도록, 카드의 색상을 정의한다.
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Text(
          pair.asLowerCase,
          style: style,
          // Text의 semanticsLabel 속성을 사용하여, 텍스트 위젯의 시각적 콘텐츠를 스크린 리더에 의해 더 적합한 시맨틱 콘텐츠로 재정의한다.
          semanticsLabel: "${pair.first} ${pair.second}",
        ),
      ),
    );
  }
}
