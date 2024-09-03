import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<Map<String, dynamic>> posts = [
    {"id": 1, "name": "aasdfasdfasdf", "price": 10},
    {"id": 2, "name": "basdfasdfasdf", "price": 20},
    {"id": 3, "name": "casdfasdfasdf", "price": 30},
    {"id": 4, "name": "dasdfasdfasdf", "price": 40},
    {"id": 5, "name": "easdfasdfasdf", "price": 50},
    {"id": 6, "name": "fasdfasdfasdf", "price": 50},
    {"id": 7, "name": "gasdfasdfasdf", "price": 50},
    {"id": 8, "name": "heasdfasdfasdf", "price": 50},
    {"id": 9, "name": "ieasdfasdfasdf", "price": 50},
    {"id": 10, "name": "jeasdfasdfasdf", "price": 50},
    {"id": 11, "name": "jeasdfasdfasdf", "price": 50},
    {"id": 12, "name": "jeasdfasdfasdf", "price": 50},
    {"id": 13, "name": "jeasdfasdfasdf", "price": 50},
    {"id": 14, "name": "jeasdfasdfasdf", "price": 50},
    {"id": 15, "name": "jeasdfasdfasdf", "price": 50},
    {"id": 16, "name": "jeasdfasdfasdf", "price": 50},
    {"id": 17, "name": "jeasdfasdfasdf", "price": 50},
    {"id": 18, "name": "jeasdfasdfasdf", "price": 50},
    {"id": 19, "name": "jeasdfasdfasdf", "price": 50},
    {"id": 20, "name": "jeasdfasdfasdf", "price": 50},
  ];

  int currentPage = 1;
  int postsPerPage = 10;

  late int indexOfLastPost;
  late int indexOfFirstPost;
  late List<Map<String, dynamic>> pagenumber;

  @override
  void initState() {
    super.initState();
    updatePagination();
  }

  void updatePagination() {
    setState(() {
      indexOfLastPost = currentPage * postsPerPage;
      indexOfFirstPost = indexOfLastPost - postsPerPage;
      int adjustedLastPostIndex =
          indexOfLastPost > posts.length ? posts.length : indexOfLastPost;
      pagenumber = posts.sublist(indexOfFirstPost, adjustedLastPostIndex);
    });
  }

  void newPage(int index) {
    setState(() {
      currentPage = index;
      updatePagination();
    });
  }

  @override
  Widget build(BuildContext context) {
    int totalPages = (posts.length / postsPerPage).ceil();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Pagination"),
          backgroundColor: Colors.grey,
        ),
        body: Column(
          children: [
            Expanded(
              flex: 6,
              child: ListView.builder(
                itemCount: pagenumber.length,
                itemBuilder: (context, index) {
                  var post = pagenumber[index];
                  return ListTile(
                    title: Text(post['name']),
                    subtitle: Text('Price: ${post['price']}'),
                    leading: CircleAvatar(
                      child: Text(post['id'].toString()),
                    ),
                  );
                },
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                color: Colors.grey,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(20),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: totalPages,
                  itemBuilder: (context, index) {
                    int pageNumber = index + 1;
                    return Container(
                      padding: EdgeInsets.all(8),
                      child: GestureDetector(
                        onTap: () {
                          newPage(pageNumber);
                        },
                        child: CircleAvatar(
                          child: Text(pageNumber.toString()),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
