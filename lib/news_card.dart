import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'network_utils/News.dart';
import 'pages/web_view.dart';



class NewsCard extends StatefulWidget {
  final News info;

  const NewsCard(this.info);
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
        width: width/1.1,
        height: height/2,
        child: InkWell(
          onTap: (){
            Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => WebNews(widget.info.url, widget.info.headline)));
          },
          child: Card(
            color: Colors.grey,
            child: Column(
              children: [


              CachedNetworkImage(
              imageUrl: widget.info.imgUrl,
              placeholder: (context, url) => Container(
                  height: 200,
                  child: Center(child: Image.asset('assets/placeholder-news.jpg'))),
                errorWidget: (context, url, error) => SizedBox(
                  height: 200.0,
                  child:
                  Center(child: Text('Error loading image: $error'))),
            ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(widget.info.headline, style: TextStyle(
                    fontSize:  18                ),),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(widget.info.description,
                  softWrap: true,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 200),
                  child: Text('date: ${widget.info.date.substring(0,10)}', textAlign: TextAlign.right,),
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}
