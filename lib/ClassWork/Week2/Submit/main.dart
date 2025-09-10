import 'package:flutter/material.dart';

/*
  [0] remove SingleChildScrollView 

  [1] Remove the appBar
  [2] Make 5 buttons using ButtonWithText()
  [3] Change the Color of each Button and Text (Color: black)
  [4] Especially, in ButtonSection Container needs padding
  [5] Change the text to your NAME and STUDENT NUMBER.
  [6] Change the color of star icon (Color: yellow) and add interactivity to the star icon as guided in [Adding interactivity] doc.
  [7] add interactivity to the star icon as guided in [Adding interactivity] doc.
  [8-1] Add a Divider under the TitleSection
  [8-2] Add a Divider under the ButtonSection
  [9] Set the padding area(EdgeInsets.all(32.0)) to all four sides of the Text Section.
  [10-1] Place the Icon on the left side, and the text on the right side
  [10-2] Icon : Icons.message, size: 40.0
  [11] Change the font weight of the Text('Recent Message') bold.
  [12-1] Use CrossAxisAlignment.start for each row.
  [12-2] Use CrossAxisAlignment.start for each column.
  [13] Apply padding (EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0) to the text part of messageSection.
*/
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // const String appTitle = 'Flutter layout demo';
    return MaterialApp(
      home: Scaffold(
        // [1] Remove the appBar
        // appBar: AppBar(title: const Text(appTitle)),
        body: const Center(
          // [0] remove SingleChildScrollView
          child: Column(
            children: [
              ImageSection(
                image: 'images/lake.jpg',
              ),

              TitleSection(
                // [5] Change the text to your NAME and STUDENT NUMBER.
                name: 'Kwangil Kim',
                location: '22000051',
              ),

              // [8-1] Add a Divider under the TitleSection
              Divider(
                height: 1.0,
                color: Colors.black,
              ),

              ButtonSection(),

              // [8-2] Add a Divider under the ButtonSection
              Divider(
                height: 1.0,
                color: Colors.black,
              ),

              TextSection(recentMessage: "Long time no see!"),
            ],
          ),
        ),
      ),
    );
  }
}

class ImageSection extends StatelessWidget {
  const ImageSection({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return Image.asset(image, width: 600, height: 240, fit: BoxFit.cover);
  }
}

class TitleSection extends StatelessWidget {
  const TitleSection({super.key, required this.name, required this.location});

  final String name;
  final String location;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            /*1*/
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /*2*/
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    name,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Text(location, style: TextStyle(color: Colors.grey[500])),
              ],
            ),
          ),
          /*3*/
          // Icon(Icons.star, color: Colors.red[500]),
          // const Text('41'),
          const FavoriteWidget(),
        ],
      ),
    );
  }
}

class FavoriteWidget extends StatefulWidget {
  const FavoriteWidget({super.key});

  @override
  State<FavoriteWidget> createState() => _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  bool _isFavorited = false;
  int _favoriteCount = 41;

  void _toggleFavorite() {
    setState(() {
      if (_isFavorited) {
        _favoriteCount -= 1;
        _isFavorited = false;
      } else {
        _favoriteCount += 1;
        _isFavorited = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(0),
          child: IconButton(
            padding: const EdgeInsets.all(0),
            alignment: Alignment.center,
            icon: (_isFavorited
                ? const Icon(Icons.star)
                : const Icon(Icons.star_border)),
            // [6] Change the color of star icon (Color: yellow)
            color: Colors.yellow,
            // [7] add interactivity to the star icon as guided in [Adding interactivity] doc.
            onPressed: _toggleFavorite,
          ),
        ),
        SizedBox(width: 20, child: SizedBox(child: Text('$_favoriteCount'))),
      ],
    );
  }
}

class ButtonSection extends StatelessWidget {
  const ButtonSection({super.key});

  @override
  Widget build(BuildContext context) {
    // [3] Change the Color of each Button and Text (Color: black)
    Color color = Colors.black;
    return SizedBox(
      child: Padding(
        // [4] Especially, in ButtonSection Container needs padding
        // 설명 : const EdgeInsets.fromLTRB(this.left, this.top, this.right, this.bottom);
        padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // [2] Make 5 buttons using ButtonWithText()
            ButtonWithText(color: color, icon: Icons.call, label: 'CALL'),
            ButtonWithText(color: color, icon: Icons.message, label: 'MESSAGE'),
            ButtonWithText(color: color, icon: Icons.email, label: 'EMAIL'),
            ButtonWithText(color: color, icon: Icons.share, label: 'SHARE'),
            ButtonWithText(color: color, icon: Icons.description, label: 'ETC'),
          ],
        ),
      ),
    );
  }
}

class ButtonWithText extends StatelessWidget {
  const ButtonWithText({
    super.key,
    required this.color,
    required this.icon,
    required this.label,
  });

  final Color color;
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}

class TextSection extends StatelessWidget {
  const TextSection({super.key, required this.recentMessage});

  final String recentMessage;

  @override
  Widget build(BuildContext context) {
    return Padding(
        // [9] Set the padding area(EdgeInsets.all(32.0)) to all four sides of the Text Section.
        padding: const EdgeInsets.all(32.0),
        child: Row(
          // [12-1] Use CrossAxisAlignment.start for each row.
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // [10-1] Place the Icon on the left side, and the text on the right side
            // [10-2] Icon : Icons.message, size: 40.0
            Icon(
              Icons.message,
              size: 40.0,
            ),
            Padding(
              // [13] Apply padding (EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0) to the text part of messageSection.
              padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
              child: Column(
                // [12-2] Use CrossAxisAlignment.start for each column.
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Recent Message",

                    // [11] Change the font weight of the Text('Recent Message') bold.
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(recentMessage),
                ],
              ),
            )
          ],
        ));
  }
}
