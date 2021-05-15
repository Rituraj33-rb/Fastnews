import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news/Helper/data.dart';
import 'package:news/Helper/news.dart';
import 'package:news/models/artical_model.dart';
import 'package:news/models/catagory_model.dart';
import 'package:news/views/artical_view.dart';
import 'package:news/views/category_news.dart';
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CatagoryModel>categories=new List<CatagoryModel>();
  List<ArticalModel>articles=new List<ArticalModel>();
  bool _loding=true;
  @override
  void initState() {
    // TODO: implement initState
    // _loding=true;
    super.initState();
    categories=getCategories();
    getNews();
  }
  getNews() async{
    News newsClass=News();
    await newsClass.getNews();
    articles=newsClass.news;
    setState(() {
      _loding=false;
    });

  }
  Future<bool> _onBackpressed(){
    return showDialog(
     context: context,
     builder: (context)=>AlertDialog(
       title: Text("Do you really want to exit the app"),
       actions: <Widget>[
         FlatButton(
           child:Text("No"),
           onPressed: ()=>Navigator.pop(context,false),
         ),
         FlatButton(
           child:Text("Yes"),
           onPressed: ()=>Navigator.pop(context,true),
         ),
       ],
     )
    );
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop:_onBackpressed,
      child: Scaffold(
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
                Container(

                  height: 70,
                  child: ListView.builder(
                    itemCount: categories.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context,index){
                      return CategoryTile(
                        imageUrl: categories[index].imageUrl,
                        categoryName: categories[index].catagoryName,
                      );
                      }),
                ),
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
      ),
    );
  }
}
class CategoryTile extends StatelessWidget {
  final String imageUrl,categoryName;
  CategoryTile({this.imageUrl, this.categoryName});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
    Navigator.push(context, MaterialPageRoute(
      builder: (context)=>CategoryNews(
        category: categoryName.toLowerCase(),
      )
    ));
      },
      child: Container(
        margin: EdgeInsets.only(right: 12),
        child: Stack(
          children: <Widget>[
             ClipRRect(
               borderRadius: BorderRadius.circular(6),

               child: CachedNetworkImage(
                 imageUrl: imageUrl, width: 120,height: 60,fit:BoxFit.cover,)
             ),
                 // Image.network(imageUrl, width: 120,height: 60,fit:BoxFit.cover,),
                Container(
                  alignment: Alignment.center,
                  width: 120,height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: Colors.black26,
                  ),

                  child: Text(categoryName, style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                  ),
                ),
              ],
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




