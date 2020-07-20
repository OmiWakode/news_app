import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'network_utils/News.dart';
import 'pages/web_view.dart';



class NewsCard extends StatefulWidget {
  final News news;

  const NewsCard(this.news);
  @override
  _NewsCardState createState() => _NewsCardState();
}

class _NewsCardState extends State<NewsCard> {

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Center(

      child: Container(
        width: width/1.2,
        height: height/2,
        child: InkWell(
          onTap: (){
            Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => WebView(widget.news.url, widget.news.headline)));
          },
          child: Card(
            color: Colors.red,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
              CachedNetworkImage(
              imageUrl: widget.news.imgUrl,
              placeholder: (context, url) => Container(
                  height: 100.0,
                  child: Center(child: Image.asset('assets/placeholder-news.jpg'))),
                errorWidget: (context, url, error) => SizedBox(
                  height: 200.0,
                  child:
                  Center(child: Text('Error loading image: $error'))),
            ),
                Text(widget.news.headline, style: TextStyle(
                  fontSize:  20                ),),

                Text(widget.news.description)

              ],
            ),
          ),
        ),
      ),
    );
  }
}
