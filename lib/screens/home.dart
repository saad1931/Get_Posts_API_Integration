import 'dart:convert';
import 'package:flutter/material.dart';

import '../services/services.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text("Get posts API Integration"),
          ),
          body: Center(
          child:  FutureBuilder(
          future: getPosts(),
          builder: (BuildContext context,AsyncSnapshot snapshot){
          if (snapshot.hasError) 
          {
            print('Something went Wrong');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          else
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context,index){
              return Card(
                child: ListTile(
                  leading: Text(snapshot.data[index].id.toString()),
                  title: Text(snapshot.data[index].title.toString()),
                  subtitle: Text(snapshot.data[index].body.toString()),
                  trailing: Text(snapshot.data[index].userId.toString()),
                  //title: Text(snapshot.data[index].email),
                ),
              );
            }
            );
          },
        )
      ),
      )
    );
  }
}