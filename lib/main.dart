import 'package:flutter/material.dart';
import 'package:flutter_project_tutor/about_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(title: 'Oeschinen Lake Campground'),
    );
  }
}

class HomePage extends StatefulWidget {
  final String title;

  const HomePage({Key? key, required this.title}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> titles = [
    'Oeschinen Lake Campground',
    'Oeschinen Lake Campground',
    'Oeschinen Lake Campground',
  ];

  void _navigateToAboutPage(int index) async {
    final updatedData = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AboutPage(title: titles[index], key: UniqueKey(),),
      ),
    );

    if (updatedData != null) {
      setState(() {
        titles[index] = updatedData['title'];
      });
    }
    else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Warning'),
            content: Text('Quit without saving?'),
            actions: [
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              TextButton(
                child: Text('Cancel'),
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (context) => AboutPage(title: titles[index], key: UniqueKey(),)));
                },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: titles.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () => _navigateToAboutPage(index),
            child: Container(
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
                        Container(
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
                              '#$index',
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        Container(
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
                              _buildButtonColumn(Colors.blue, Icons.call, 'CALL'),
                              _buildButtonColumn(Colors.green, Icons.near_me, 'ROUTE'),
                              _buildButtonColumn(Colors.black, Icons.share, 'SHARE'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    left: 16,
                    right: 16,
                    bottom: 16,
                    child: Align(
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
                                    child: Text(
                                      titles[index],
                                      style: const TextStyle(
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
                    )
                  ),
                ]
              )
            )
          );
        },
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