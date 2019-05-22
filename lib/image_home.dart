import 'dart:async';
import 'dart:convert';
import 'package:shimmer/shimmer.dart';
import 'package:flutter/material.dart';
import "package:http/http.dart" as http;
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class ImageHome extends StatefulWidget {
  @override
  _ImageHomeState createState() => _ImageHomeState();
}

class _ImageHomeState extends State<ImageHome> {

  


   Future<Map> getcontent() async{
   String apiurl= "http://www.mocky.io/v2/5cdbea6d2d0000b217f5a40d";
   http.Response response = await http.get(apiurl);
    return json.decode(response.body);
 }
  Material myitems(String url){
    return Material(
      color: Colors.white,
      elevation: 14.0,
      shadowColor: Color(0x802196F3),
      borderRadius: BorderRadius.circular(24.0),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.network(url,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          
          fit: BoxFit.fill,
          ),
          
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Image Page"),
        elevation: 2.0,
        
      ),
      
      body: updateimageWidget()
    );
  }

   Widget updateimageWidget(){
   return new FutureBuilder(
     future: getcontent(),
     builder: (BuildContext context,AsyncSnapshot<Map> snapshot){
     
     switch(snapshot.connectionState){
       case ConnectionState.none:
        return updateimageWidget();
       case ConnectionState.active:
       case ConnectionState.waiting:
        return (new Shimmer.fromColors(
          baseColor: Colors.black,
          highlightColor: Colors.red,
          child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("loading")
          
        ),
      ),

        )
        );
      case ConnectionState.done:
        if(snapshot.hasError)
          return updateimageWidget();
     
        // all info will be received here 
      
          Map content = snapshot.data;
          return StaggeredGridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 12.0,
        mainAxisSpacing: 12.0,
        padding: EdgeInsets.symmetric(horizontal: 16.0,vertical: 8.0),
        children: <Widget>[
          myitems(content['Image']['image1']),
         myitems(content['Image']['image2']),
         myitems(content['Image']['image3']),
        
         myitems(content['Image']['image5']), 
         myitems(content['Image']['image6']),
          myitems(content['Image']['image7']),
          myitems(content['Image']['image8']),
           myitems(content['Image']['image9']), 
           myitems(content['Image']['image10']),
           myitems(content['Image']['image11']),
            myitems(content['Image']['image4']),
           myitems(content['Image']['image12']),
 myitems(content['Image']['image13']),
  myitems(content['Image']['image14']),
        ],
        staggeredTiles: [
          StaggeredTile.extent(2, 290.0),
          StaggeredTile.extent(2, 230.0),
          StaggeredTile.extent(2, 230.0),
          StaggeredTile.extent(2, 430.0),
          
          StaggeredTile.extent(2, 230.0),
          StaggeredTile.extent(2, 230.0),
          StaggeredTile.extent(2, 230.0),
          StaggeredTile.extent(2, 230.0),
          StaggeredTile.extent(2, 230.0),
          StaggeredTile.extent(2, 230.0),
          StaggeredTile.extent(1, 230.0),
          StaggeredTile.extent(1, 230.0), 
          StaggeredTile.extent(2, 230.0),
        ],
      );
      
        
     
     }         
       
     },
   );
 }
}

