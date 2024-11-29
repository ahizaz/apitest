import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart'as http;
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var data;
  Future<void>getApi()async{
    final response = await http.get(Uri.parse('https://webhook.site/d8db1bb0-efaa-4078-9114-0dd5bc40a1ea'));
    if(response.statusCode==200){
       data=jsonDecode(response.body.toString());
    }else{
      Text('Loding');
    }


  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title:Text('Api Check'),
      ),
      body:Column(
        children: [
          Expanded(child: FutureBuilder(future: getApi(), builder: (context,snapshot){
            if(snapshot.connectionState==ConnectionState.waiting){
              return Text('Loading');
            }else{
              return Text(data['info'].toString());
            }
          },),)
        ],
      ),
    );
  }
}

