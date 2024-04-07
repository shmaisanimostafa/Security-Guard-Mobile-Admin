import 'package:capstone_proj/functions/article_api_handler.dart';
import 'package:capstone_proj/models/article.dart';
import 'package:flutter/material.dart';

class EditArticleScreen extends StatefulWidget {
  final int id;

  const EditArticleScreen({super.key, required this.id});

  @override
  State<EditArticleScreen> createState() => _EditArticleScreenState();
}

class _EditArticleScreenState extends State<EditArticleScreen> {
  ArticleAPIHandler apiHandler = ArticleAPIHandler();

  //
  //SECTION Fetch Articles Data
  //
  void getData() async {
    Article article = await apiHandler.getArticle(widget.id);
    setState(() {
      _titleController.text = article.title;
      _body1Controller.text = article.body1;
      _body2Controller.text = article.body2;
      _urlController.text = article.url;
      _imgUrlController.text = article.imgUrl;
      _ratingController.text = article.rating.toString();
    });
  }

  void updateData() async {
    String title = _titleController.text;
    String body1 = _body1Controller.text;
    String body2 = _body2Controller.text;
    String url = _urlController.text;
    String imgUrl = _imgUrlController.text;
    int rating = int.parse(_ratingController.text);

    Article updatedArticle = Article(
      id: widget.id,
      title: title,
      body1: body1,
      body2: body2,
      url: url,
      imgUrl: imgUrl,
      rating: rating,
    );

    await apiHandler.putArticle(widget.id, updatedArticle);
  }

  //
  //SECTION Fetch Articles Data in the beginning of the Widget
  //
  @override
  void initState() {
    super.initState();
    getData();
  }

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _body1Controller = TextEditingController();
  final TextEditingController _body2Controller = TextEditingController();
  final TextEditingController _urlController = TextEditingController();
  final TextEditingController _imgUrlController = TextEditingController();
  final TextEditingController _ratingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Article'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: 'Title'),
            ),
            TextField(
              controller: _body1Controller,
              decoration: const InputDecoration(labelText: 'Body 1'),
            ),
            TextField(
              controller: _body2Controller,
              decoration: const InputDecoration(labelText: 'Body 2'),
            ),
            TextField(
              controller: _urlController,
              decoration: const InputDecoration(labelText: 'URL'),
            ),
            TextField(
              controller: _imgUrlController,
              decoration: const InputDecoration(labelText: 'Image URL'),
            ),
            TextField(
              controller: _ratingController,
              decoration: const InputDecoration(labelText: 'Rating'),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                updateData();

                Navigator.pop(context);
              },
              child: const Text('Update Article'),
            ),
          ],
        ),
      ),
    );
  }
}
