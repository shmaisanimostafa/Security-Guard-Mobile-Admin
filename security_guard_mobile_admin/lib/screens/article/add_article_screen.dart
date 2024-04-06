import 'package:capstone_proj/functions/article_api_handler.dart';
import 'package:capstone_proj/models/article.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddArticleScreen extends StatefulWidget {
  const AddArticleScreen({super.key});

  @override
  State<AddArticleScreen> createState() => _AddArticleScreenState();
}

class _AddArticleScreenState extends State<AddArticleScreen> {
  String title = '';
  String body1 = '';
  String body2 = '';
  String imgUrl = '';
  String url = '';
  int id = 0;
  int rating = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Article'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              decoration: const InputDecoration(
                labelText: 'Title',
              ),
              onChanged: (value) {
                setState(() {
                  title = value;
                });
              },
            ),
            const SizedBox(height: 16.0),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Body 1',
              ),
              onChanged: (value) {
                setState(() {
                  body1 = value;
                });
              },
            ),
            const SizedBox(height: 16.0),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Body 2',
              ),
              onChanged: (value) {
                setState(() {
                  body2 = value;
                });
              },
            ),
            const SizedBox(height: 16.0),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Image URL',
              ),
              onChanged: (value) {
                setState(() {
                  imgUrl = value;
                });
              },
            ),
            const SizedBox(height: 16.0),
            TextField(
              decoration: const InputDecoration(
                labelText: 'URL',
              ),
              onChanged: (value) {
                setState(() {
                  url = value;
                });
              },
            ),
            const SizedBox(height: 16.0),
            // TextField(
            //   decoration: const InputDecoration(
            //     labelText: 'ID',
            //   ),
            //   onChanged: (value) {
            //     setState(() {
            //       id = int.parse(value);
            //     });
            //   },
            // ),
            // const SizedBox(height: 16.0),
            TextField(
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: const InputDecoration(
                labelText: 'Rating',
              ),
              onChanged: (value) {
                setState(() {
                  rating = int.parse(value);
                });
              },
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                Article article = Article(
                  id: id,
                  title: title,
                  body1: body1,
                  body2: body2,
                  imgUrl: imgUrl,
                  url: url,
                  rating: rating,
                );
                if (title.isEmpty || body1.isEmpty || body2.isEmpty) {
                  Navigator.pop(context);
                } else {
                  ArticleAPIHandler apiHandler = ArticleAPIHandler();
                  apiHandler.postArticle(article);
                  Navigator.pop(context);
                }
              },
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
