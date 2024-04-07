import 'package:capstone_proj/functions/article_api_handler.dart';
import 'package:capstone_proj/models/article.dart';
import 'package:capstone_proj/screens/article/edit_article_screen.dart';
import 'package:flutter/material.dart';

class ArticleScreen extends StatefulWidget {
  const ArticleScreen({super.key, required this.id});

  final int id;

  @override
  State<ArticleScreen> createState() => _ArticleScreenState();
}

class _ArticleScreenState extends State<ArticleScreen> {
  ArticleAPIHandler apiHandler = ArticleAPIHandler();
  late Article data = Article(
    imgUrl: 'images/ProfilePic.png',
    rating: 5,
    url: 'https://www.google.com',
    id: 1,
    title: 'sample',
    body1: 'sample',
    body2: 'sample',
  );

  void getData() async {
    data = await apiHandler.getArticle(widget.id);
    setState(() {});
  }

  void deleteData() async {
    await apiHandler.deleteArticle(widget.id);
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            Text(
              data.title,
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 15.0),
            Padding(
              padding: const EdgeInsets.only(left: 5.0),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 15.0,
                    backgroundImage: AssetImage('images/ProfilePic.png'),
                  ),
                  const SizedBox(width: 5),
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Mostafa Shmaisani',
                          ),
                          SizedBox(width: 5.0),
                          Icon(Icons.verified, size: 15, color: Colors.blue),
                        ],
                      ),
                      Text(
                        'Feb 23 - 2023',
                        maxLines: 2,
                      ),
                    ],
                  ),
                  IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                EditArticleScreen(id: widget.id),
                          ),
                        );
                      },
                      icon: const Icon(Icons.edit)),
                  IconButton(
                    onPressed: () {
                      deleteData();
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.red,
                      size: 30,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15.0),
            Text(data.body1),
            const SizedBox(height: 15.0),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                'images/ProfilePic.png',
                // height: 200,
                // fit: BoxFit.fill,
              ),
            ),
            const SizedBox(height: 15.0),
            Text(data.body2),
            const SizedBox(height: 15.0),
          ],
        ),
      ),
    );
  }
}
