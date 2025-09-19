import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CartModel(),
      child: const MyApp(),
    ),
  );
}

class Item {
  final String name;
  const Item(this.name);
}

class CartModel extends ChangeNotifier {
  final List<Item> _items = [];

  UnmodifiableListView<Item> get items => UnmodifiableListView(_items);

  int get totalPrice => _items.length * 42;

  void add(Item item) {
    _items.add(item);
    notifyListeners();
  }

  void removeAll() {
    _items.clear();
    notifyListeners();
  }

  void remove(Item item) {
    _items.remove(item);
    notifyListeners();
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Provider Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  final List<Item> catalog = const [
    Item("사과"),
    Item("바나나"),
    Item("딸기"),
    Item("포도"),
    Item("수박"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("상품 목록"),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const CartPage()),
              );
            },
          )
        ],
      ),
      body: ListView.builder(
        itemCount: catalog.length,
        itemBuilder: (context, index) {
          final item = catalog[index];
          final cart = Provider.of<CartModel>(context);
          final count = cart.items.where((i) => i.name == item.name).length;
          return ListTile(
            title: Text(item.name),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text('$count', style: const TextStyle(fontSize: 16)),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {
                    Provider.of<CartModel>(context, listen: false).add(item);
                  },
                  child: const Text("추가"),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartModel>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("장바구니"),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              cart.removeAll();
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: cart.items
                  .map((item) => ListTile(
                        title: Text(item.name),
                        trailing: ElevatedButton(
                          onPressed: () {
                            cart.remove(item);
                          },
                          child: const Text('삭제'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.redAccent,
                            foregroundColor: Colors.white,
                          ),
                        ),
                      ))
                  .toList(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text("총 금액: \$${cart.totalPrice}",
                style: const TextStyle(fontSize: 20)),
          ),
        ],
      ),
    );
  }
}
