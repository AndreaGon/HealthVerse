import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_userprofile1/page/communities/utils/post_preferences.dart';
import 'package:flutter_userprofile1/page/content_page/content_page.dart';

import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../model/post.dart';
import '../../widget/appbar_widget.dart';

class Communities extends StatefulWidget {
  @override
  _CommunitiesState createState() => _CommunitiesState();
}

class _CommunitiesState extends State<Communities> {

  List posts = [];
  
  @override
  Widget build(BuildContext context) {

    getData();

    return FutureBuilder<List>(
      future: getData(),
      builder: (BuildContext context, AsyncSnapshot<List> snapshot){
        if( snapshot.connectionState == ConnectionState.waiting){
          return  Scaffold(
            body: Center(
              child: LoadingAnimationWidget.staggeredDotsWave(
                color: Colors.purple, size: 200
              )
            )
          );
        }
        else{
          if (snapshot.hasError){
            return Center(child: Text('Error: ${snapshot.error}'));
          }   
          else{
            posts = snapshot.data!;
            return Scaffold(
              floatingActionButton: buildFloatingAddContent(context),
              appBar: buildAppBar(context, "Communities"),
              backgroundColor: Color(0xF4EEED),
              body: SafeArea(
                child: ListView.builder(
                  itemCount: posts.length,
                  itemBuilder: (context, index) => buildPostCard(context, index),)
              )
            );
          }     
        }
      }
    );

    
  }

  @override
  Widget buildPostCard(BuildContext context, int index){
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.person),
                backgroundColor: Colors.purple,
              ),
              title: Text("Sample text"),
              subtitle: Text(posts[index].text)
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: buildButtons(context, index)
          )
        ]
      )
    );
  }

  @override
  Widget buildButtons(BuildContext context, int index){
    return Center(
      child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            IconButton(
              onPressed: (){}, 
              icon: const Icon(Icons.favorite_border)),
            Text(posts[index].likes_number),
            const SizedBox(width: 8),
            IconButton(
              onPressed: (){}, 
              icon: const Icon(Icons.comment)),
            Text(posts[index].comments_number),
            const SizedBox(width: 8),
          ],
        )
    );
    
  }

  @override
  Widget buildFloatingAddContent(BuildContext context){
    return FloatingActionButton(
      onPressed: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => ContentPage()));
      },
      backgroundColor: Colors.purple,
      child: const Icon(
        Icons.edit,
        color: Colors.white
      )
    );
  }


  Future<List> getData() async {
    QuerySnapshot query = await FirebaseFirestore.instance.collection("Postings").get();

    final allPostings = query.docs.map((doc)=> Post.fromJson(doc.data() as Map<String, dynamic>)).toList();

    return allPostings;
  }

}