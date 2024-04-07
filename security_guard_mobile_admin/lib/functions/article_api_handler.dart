import 'dart:convert';
import 'package:capstone_proj/models/article.dart';
import 'package:http/http.dart' as http;

class ArticleAPIHandler {
  final String _baseUrl = "https://localhost:7244/api/Articles";

  Future<List<Article>> getArticles() async {
    final response = await http.get(Uri.parse(_baseUrl));
    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      List<Article> articles = body
          .map(
            (dynamic item) => Article.fromJson(item),
          )
          .toList();
      return articles;
    } else {
      throw "Can't get articles.";
    }
  }

  Future<Article> getArticle(int id) async {
    final response = await http.get(Uri.parse("$_baseUrl/$id"));
    if (response.statusCode == 200) {
      return Article.fromJson(jsonDecode(response.body));
    } else {
      throw "Can't get article.";
    }
  }

  Future<Article> postArticle(Article article) async {
    final response = await http.post(
      Uri.parse(_baseUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(article.toJson()),
    );
    if (response.statusCode == 201) {
      return Article.fromJson(jsonDecode(response.body));
    } else {
      throw "Can't post article.";
    }
  }

  Future<void> deleteArticle(int id) async {
    final response = await http.delete(Uri.parse("$_baseUrl/$id"));
    if (response.statusCode != 204) {
      throw "Can't delete article.";
    }
  }

  Future<Article> putArticle(int id, Article article) async {
    final response = await http.put(
      Uri.parse("$_baseUrl/$id"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(article.toJson()),
    );
    if (response.statusCode >= 200 && response.statusCode <= 299) {
      return Article.fromJson(jsonDecode(response.body));
    } else {
      throw "Can't put article.";
    }
  }
}
