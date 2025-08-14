import 'package:flutter/material.dart';

class HomeListView extends StatelessWidget {
  const HomeListView({super.key});

  @override
  Widget build(BuildContext contest) {
    //   return ListView(
    //     padding: const EdgeInsets.all(8),
    //     children: <Widget>[
    //       Container(
    //         height: 50,
    //         color: Colors.deepOrange[600],
    //         child: const Center(child: Text('Entry A')),
    //       ),
    //       Container(
    //         height: 50,
    //         color: Colors.deepOrange[300],
    //         child: const Center(child: Text('Entry B')),
    //       ),
    //       Container(
    //         height: 50,
    //         color: Colors.deepOrange[100],
    //         child: const Center(child: Text('Entry C')),
    //       ),
    //     ],
    //   );
    // }

    // return ListView(
    //   padding: const EdgeInsets.all(8),
    //   children: [
    //     for (int index = 1; index < 21; index++)
    //       Container(
    //         height: 50,
    //         color: Colors.deepOrange[100],
    //         child: Center(child: Text('Entry $index')),
    //       ),
    //   ],
    // );

    final List<int> entries = <int>[
      1,
      2,
      3,
      4,
      5,
      6,
      7,
      8,
      9,
      10,
      11,
      12,
      13,
      14,
      15,
      16,
      17,
      18,
      19,
      20,
      21,
      22,
      23,
      24,
      25,
      26,
      27,
      28,
      29,
      30,
    ];
    // return ListView.builder(
    //   padding: const EdgeInsets.all(8),
    //   itemCount: entries.length,
    //   itemBuilder: (context, index) {
    //     return Container(
    //       height: 50,
    //       color: Colors.deepOrange[100],
    //       child: Center(child: Text('Entry ${entries[index]}')),
    //     );
    //   },
    // );
    return ListView.separated(
      padding: const EdgeInsets.all(8),
      itemCount: entries.length,
      itemBuilder: (context, index) {
        return Container(
          height: 50,
          color: Colors.deepOrange[100],
          child: Center(child: Text('Entry ${entries[index]}')),
        );
      },
      separatorBuilder: (context, index) =>
          const Divider(thickness: 1, color: Colors.orange),
    );
  }
}
