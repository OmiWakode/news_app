
import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:news_app/network_utils/News.dart';
import 'package:news_app/network_utils/news_id.dart';
import 'package:http/http.dart' as http;

import '../constant.dart';
import '../news_card.dart';


class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  List<NewsId> news = [
    NewsId(id: 'google-news-in', name: 'Google News India'),
    NewsId(id: 'cnn', name: 'CNN'),
    NewsId(id: 'the-hindu', name: 'The Hindu'),
    NewsId(id: 'buzzfeed', name: 'BuzzFeed'),
    NewsId(id: 'the-verge', name: 'The Verge'),
    NewsId(id: 'bbc-news', name: 'BBC News'),
    NewsId(id: 'the-times-of-india', name: 'The Times Of India')
  ];



  Future<List<News>> fetchNews(String id) async{
    String url = Constant.base_url + 'sources=$id&apikey=${Constant.key}';
    try {
      final response = await http.get(url);
      final parsed = await json.decode(response.body);

      return (parsed["articles"] as List)
          .map<News>((json) => new News.fromJson(json))
          .toList();
    }on TimeoutException catch (e){
      print(e);
      return null;
    }

  }


  Widget newsBuilder(int i){
    return FutureBuilder(
      future: fetchNews(news[i].id),
      builder: (context, snapshot){
        switch (snapshot.connectionState) {
          case(ConnectionState.done):
            if(snapshot.data==null){
              return Center(
                child: Text(
                    'Error!'
                ),
              );
            }
            return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context , int i){
                  return NewsCard(snapshot.data[i]);
                }
            );
          default:
            return Center(
              child: Image.asset('assets/placeholder-news.jpg'),
            );
        }
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: news.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text('News App'),
          centerTitle: true,
          bottom: TabBar(
            isScrollable: true,
              tabs: List<Widget>.generate(news.length, (index) => Tab(
            child: Text(news[index].name),
          ))
          ),
        ),
        body: TabBarView(children: List<Widget>.generate(news.length, (index) => newsBuilder(index))),

      ),
    );
  }
}


