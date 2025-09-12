import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: FeedLoadingExample(),
  ));
}

class FeedLoadingExample extends StatefulWidget {
  const FeedLoadingExample({super.key});

  @override
  State<FeedLoadingExample> createState() => _FeedLoadingExampleState();
}

class _FeedLoadingExampleState extends State<FeedLoadingExample> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();

    // 5초 뒤 로딩 해제
    Future.delayed(const Duration(seconds: 5), () {
      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("피드 로딩 Shimmer 예제")),
      body: _isLoading ? _buildLoadingList() : _buildRealList(),
    );
  }

  /// 로딩 중일 때 Shimmer 리스트
  Widget _buildLoadingList() {
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: 5,
      separatorBuilder: (_, __) => const SizedBox(height: 20),
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 이미지 영역 (로딩)
              Container(
                width: double.infinity,
                height: 180,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              const SizedBox(height: 12),

              // 텍스트 2줄 (로딩)
              Container(
                width: double.infinity,
                height: 16,
                color: Colors.white,
              ),
              const SizedBox(height: 8),
              Container(
                width: 150,
                height: 16,
                color: Colors.white,
              )
            ],
          ),
        );
      },
    );
  }

  /// 실제 데이터 리스트
  Widget _buildRealList() {
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: 5,
      separatorBuilder: (_, __) => const SizedBox(height: 20),
      itemBuilder: (context, index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 실제 이미지
            Container(
              width: double.infinity,
              height: 180,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  "https://picsum.photos/400/200?random=$index",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 12),

            // 실제 텍스트
            Text(
              "피드 제목 $index",
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              "여기는 실제 데이터가 표시되는 부분입니다. " "Shimmer 로딩이 끝나면 이렇게 보이게 돼요.",
            )
          ],
        );
      },
    );
  }
}
