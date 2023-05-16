import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Widget titleSection = Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(color: Colors.black, width: 2.0),
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.8),
              blurRadius: 2.0,
              spreadRadius: 2.0,
            ),
          ],
        ),
      //color: Colors.black,
      child: Row(
        children: [
          Expanded(
            /*1*/
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /*2*/
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: const Text(
                    'Oeschinen Lake Campground',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  'Kandersteg, Switzerland',
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          /*3*/
          Icon(
            Icons.star,
            color: Colors.red[500],
          ),
          const Text(
            '41',
            style: TextStyle(
              color: Colors.white,
            ),
          )
        ],
      ),
      ),
    );
    Color color = Theme.of(context).primaryColor;

    Widget buttonSection = Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(16.0),
      width: 180,
      decoration: const BoxDecoration(
        //border: Border.all(color: Colors.white, width: 2.0),
        color: Color.fromRGBO(255, 255, 255, 0.5),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildButtonColumn(color, Icons.call, 'CALL'),
          _buildButtonColumn(Colors.green, Icons.near_me, 'ROUTE'),
          _buildButtonColumn(Colors.black, Icons.share, 'SHARE'),
        ],
      ),
    );

/*    Widget textSection = const Padding(
      padding: EdgeInsets.all(32),
      child: Text(
        'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
            'Alps. Situated 1,578 meters above sea level, it is one of the '
            'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
            'half-hour walk through pastures and pine forest, leads you to the '
            'lake, which warms to 20 degrees Celsius in the summer. Activities '
            'enjoyed here include rowing, and riding the summer toboggan run.',
        softWrap: true,
      ),
    );*/
    return MaterialApp(
      title: 'Flutter layout demo',
      home: Scaffold(
        body: ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: 3,
          itemBuilder: (BuildContext context, int index) {
            Widget numeric = Container(
              width: 75,
              height: 75,
              decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.8),
                    blurRadius: 2.0,
                    spreadRadius: 2.0,
                  ),
                ],
                shape: BoxShape.circle,
                color: Colors.black.withOpacity(0.5),
              ),
              child: Center(
                child: Text(
                  '#$index.',
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            );
            return Container(
              margin: const EdgeInsets.only(bottom: 8.0),
              child: Stack(
                children: [
                  FractionallySizedBox(
                    widthFactor: 1.0,
                    child: Image.asset(
                      'images/lake.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        numeric,
                        buttonSection,
                      ],
                    ),
                  ),
                  Positioned(
                    left: 16,
                    right: 16,
                    bottom: 16,
                    child: titleSection,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
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
