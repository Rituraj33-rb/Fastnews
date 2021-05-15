import 'package:flutter/material.dart';
// import 'package:news/Helper/data.dart';
import 'package:news/Helper/news.dart';
import 'package:news/models/artical_model.dart';

import 'artical_view.dart';
// import 'home.dart';
class CategoryNews extends StatefulWidget {
  final String category;
  CategoryNews({this.category});

  @override
  _CategoryNewsState createState() => _CategoryNewsState();
}

class _CategoryNewsState extends State<CategoryNews> {
  List<ArticalModel>articles=new List<ArticalModel>();
  bool _loding=true;
  @override
  void initState() {
    // TODO: implement initState
    // _loding=true;
    super.initState();
    getCategoryNews();
  }
  getCategoryNews() async{
    CategoryNewsClass newsClass=CategoryNewsClass();
    await newsClass.getNews(widget.category);
    articles=newsClass.news;
    setState(() {
      _loding=false;
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children:<Widget> [
            Text("Fast"),
            Text("News",style:TextStyle(
                color: Colors.blue
            )
              ,)
          ],
        ),
        elevation: 0.0,
      ),
      body: _loding?
      Center(
        child: Container(
          child: CircularProgressIndicator(),
        ),
      )
          : SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child:Column(
            children: <Widget>[

              //types
              // Container(
              //
              //   height: 70,
              //   child: ListView.builder(
              //       itemCount: articles.length,
              //       shrinkWrap: true,
              //       scrollDirection: Axis.horizontal,
              //       itemBuilder: (context,index){
              //         return CategoryTile(
              //           imageUrl: categories[index].imageUrl,
              //           categoryName: categories[index].catagoryName,
              //         );
              //       }),
              // ),
              //news
              Container(
                padding: EdgeInsets.only(top:15),
                child: ListView.builder(
                    itemCount: articles.length,
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    itemBuilder: (context,index){
                      return NewsTile(
                        imageUrl: articles[index].urlToImage,
                        title: articles[index].title,
                        des: articles[index].description,
                        url: articles[index].url,
                      );
                    }),
              )
            ],
          ) ,
        ),
      ),
    );
  }
}
class NewsTile extends StatelessWidget {
  final String imageUrl, title, des,url;
  NewsTile({@required this.imageUrl, @required this.title, @required this.des, @required this.url});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
            builder: (context)=>ArticalView(
              newsUrl: url,
            )
        ));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 16),
        child: Column(
          children: <Widget>
          [
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image.network(imageUrl),
            ),

            SizedBox(height: 8),
            Text(title,style: TextStyle(
                fontSize: 17,
                color: Colors.black87,
                fontWeight: FontWeight.w500
            ),),
            SizedBox(height: 8),
            Text(des,style: TextStyle(
                color: Colors.black54
            ),),

          ],
        ),
      ),
    );
  }
}




