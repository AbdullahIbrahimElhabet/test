import 'dart:convert';

import 'package:flutter/material.dart';
import 'dart:io';
import 'package:http/http.dart'as http;
import 'package:image_picker/image_picker.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'server conected',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'server'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  File? selectedImage;
  String? message ="";
  File? img ;
  Future getImage()async {
    final PickedImage =
    await ImagePicker().getImage(source: ImageSource.camera);
    selectedImage = File(PickedImage !.path);
    setState(() {});
  }
  var x ;
  var  m  ;
  File? v;
  int id =0 ;

  uploadImage() async{
  final request = http.MultipartRequest("POST",Uri.parse("http://username.pythonanywhere.com/upload"));
  final headers = {"content-type":"multipart/from-data"};
  request.files.add(http.MultipartFile('image', selectedImage!.readAsBytes().asStream(), selectedImage!.lengthSync(),filename: selectedImage!.path.split("/").last ) );
  request.headers.addAll(headers);
  final response = await request.send();
  http.Response res = await  http.Response.fromStream(response);
  final resJson = jsonDecode(res.body);
  message = resJson['message'];
  id =resJson['id'];
  //img = resJson['img'];
  x = message ;
  m= id  ;
  //v=img;
  Text(x);
   id ;
   //img ;
  setState(() {});
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
           children: <Widget>[
            selectedImage == null
                 ? Text("upload  photo")
                  : Text("message")
           // Image.file(selectedImage!)


           // ,
             ,
          x == null? Text("not apload"):Text(x)
          ,


        id==0 ?Text("."): Text("$id")
              ,
       // img ==null? Text("."):Image.file(img!),



          TextButton.icon(onPressed:  uploadImage , icon: Icon(Icons.fifteen_mp), label: Text("upload"))

           ],

        ),

      ),


    floatingActionButton: FloatingActionButton(onPressed: getImage  ,
    child: Icon(Icons.add_a_photo),
    ),


    );
  }
}
