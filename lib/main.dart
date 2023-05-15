import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class Item {
  final String imageUrl;
  final String name;
  final String description;

  Item({
    required this.imageUrl,
    required this.name,
    required this.description,
  });
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // int _counter = 0;

  // void _incrementCounter() {
  //   setState(() {
  //     // This call to setState tells the Flutter framework that something has
  //     // changed in this State, which causes it to rerun the build method below
  //     // so that the display can reflect the updated values. If we changed
  //     // _counter without calling setState(), then the build method would not be
  //     // called again, and so nothing would appear to happen.
  //     _counter++;
  //   });
  // }

  @override
  Widget build(BuildContext context) {

    final List<Item> items = [
    Item(
      imageUrl: 'https://nld.mediacdn.vn/Images/Uploaded/Share/2009/07/01/kaka1.jpg',
      name: 'Kaka',
      description: 'This is description 1',
    ),
    Item(
      imageUrl: 'https://cdn-i.vtcnews.vn/files/news/2018/04/04/-043337.jpg',
      name: 'C.Ronaldo',
      description: 'This is description 2',
    ),
    Item(
      imageUrl: 'https://danviet.mediacdn.vn/thumb_w/650/296231569849192448/2023/4/23/hlv-zidane-01-16822143261771425544918.jpg',
      name: 'Zidane',
      description: 'This is description 3',
    ),
    Item(
      imageUrl: 'https://balla.com.cy/wp-content/uploads/2022/10/mpape.jpg',
      name: 'Mbappe',
      description: 'This is description 4',
    ),
    Item(
      imageUrl: 'https://static.cand.com.vn/Files/Image/linhchi/2021/06/24/thumb_660_c912ca5c-70af-4eb2-b49a-a8504c0f59d0.jpg',
      name: 'Modric',
      description: 'This is description 5',
    ),
    Item(
      imageUrl: 'https://vnn-imgs-f.vgcloud.vn/2020/03/13/20/ronaldo-dybala-juventus.jpg',
      name: 'Dybala',
      description: 'This is description 6',
    ),
  ];
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        title: Text('News'),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildItem(context, items[0]),
                  _buildItem(context, items[1]),
                  _buildItem(context, items[2]),
                  _buildItem(context, items[3]),
                  _buildItem(context, items[4]),
                  _buildItem(context, items[5]),
                ],
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: List.generate(
                  items.length,
                  (index) => Padding(
                    padding: EdgeInsets.all(10.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CommentPage(item: items[index]),
                          ),
                        );
                      },
                      
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: 20,
                            backgroundImage: NetworkImage(items[index].imageUrl),
                          ),
                          SizedBox(width: 16.0),
                           Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  items[index].name,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.0,
                                  ),
                                ),
                                SizedBox(height: 8.0),
                                Wrap(
                                  children: [
                                    Text(
                                      items[index].description,
                                      style: TextStyle(
                                        color: Colors.grey[600],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  Widget _buildItem(BuildContext context, Item item) {
    return Container(
      width: 200,
      height: 200,
      child: Stack(
        children: [
          Image.network(
            item.imageUrl,
            width: 200,
            height: 200,
            fit: BoxFit.cover,
          ),
          Positioned(
            bottom: 8.0,
            left: 8.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.name,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
                SizedBox(height: 4.0),
                Text(
                  item.description,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CommentPage extends StatelessWidget {
  final Item item;

  CommentPage({required this.item});
final List<Item> items = [
    Item(
      imageUrl: 'https://nld.mediacdn.vn/Images/Uploaded/Share/2009/07/01/kaka1.jpg',
      name: 'Kaka',
      description: 'This is comment 1',
    ),
    Item(
      imageUrl: 'https://cdn-i.vtcnews.vn/files/news/2018/04/04/-043337.jpg',
      name: 'C.Ronaldo',
      description: 'This is comment 2',
    ),
    Item(
      imageUrl: 'https://danviet.mediacdn.vn/thumb_w/650/296231569849192448/2023/4/23/hlv-zidane-01-16822143261771425544918.jpg',
      name: 'Zidane',
      description: 'This is comment 3',
    ),
    Item(
      imageUrl: 'https://balla.com.cy/wp-content/uploads/2022/10/mpape.jpg',
      name: 'Mbappe',
      description: 'This is comment 4',
    ),
    Item(
      imageUrl: 'https://static.cand.com.vn/Files/Image/linhchi/2021/06/24/thumb_660_c912ca5c-70af-4eb2-b49a-a8504c0f59d0.jpg',
      name: 'Modric',
      description: 'This is comment 5',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Comments for ${item.name}'),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Card(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundImage: NetworkImage(items[index].imageUrl),
                      ),
                      SizedBox(width: 8.0),
                      Text(
                        items[index].name,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    items[index].description,
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}