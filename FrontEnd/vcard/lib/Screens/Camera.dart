import 'dart:async';
import 'dart:io';
import 'package:http/http.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'CardDisplay.dart';
import 'package:dio/dio.dart';


class CameraApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Image Scan',
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  File file;
  PostData() {
    Dio dio = new Dio();
    FormData formdata = new FormData(); // just like JS
    formdata.add("photos", new UploadFileInfo(file, basenam));
    dio.post("http://172.20.53.12:8000/api/images/", data: formdata, options: Options(
    method: 'POST',
    responseType: ResponseType.JSON,
     
    ))
    .then((response) => print(response))
    .catchError((error) => print(error));
    //Navigator.push(context, 
    //MaterialPageRoute(builder: (context) => ()));
  }
  /*
  upload() async {    
      // open a bytestream
      var stream = new http.ByteStream(DelegatingStream.typed(file.openRead()));
      // get file length
      var length = await file.length();

      // string to uri
      var uri = Uri.parse("http://ip:8082/composer/predict");

      // create multipart request
      var request = new http.MultipartRequest("POST", uri);

      // multipart that takes file
      var multipartFile = new http.MultipartFile('file', stream, length,
          filename: basename(file.path));

      // add file to multipart
      request.files.add(multipartFile);

      // send
      var response = await request.send();
      print(response.statusCode);

     
    }*/
  @override
  Widget build(BuildContext context) {
    //display image selected from gallery
    imageSelectorGallery(source) async {
      file = await ImagePicker.pickImage(
        source: source,
        // maxHeight: 50.0,
        // maxWidth: 50.0,
      );
      print("You selected gallery image : " + file.path);
      setState(() {});
    }

    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Image Picker'),
      ),
      body: new FlatButton(
          child: new Center(
          child: displaySelectedFile(file)
        ),
        onPressed: (){
            PostData();
        },
      ),

      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            onPressed: () {
              
              imageSelectorGallery(ImageSource.gallery);
            },
            heroTag: 'image0',
            tooltip: 'Pick Image from gallery',
            child: const Icon(Icons.photo_library),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: FloatingActionButton(
              onPressed: () {
              
                imageSelectorGallery(ImageSource.camera);
              },
              heroTag: 'image1',
              tooltip: 'Take a Photo',
              child: const Icon(Icons.camera_alt),
            ),
          ),
          
        ],
      ),
    );
  }

  Widget displaySelectedFile(File file) {
    return new SizedBox(
      height:400.0,
      width: 300.0,
//child: new Card(child: new Text(''+galleryFile.toString())),
//child: new Image.file(galleryFile),
      child: file == null
          ? new Text('Sorry nothing selected!!')
          : new Image.file(file),
    );
  }
}
/*class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<File> _imageFile;
  File _imageFile1;
  bool isVideo = false;
  VideoPlayerController _controller;
  VoidCallback listener;

  void _onImageButtonPressed(ImageSource source) async{
    var image = await ImagePicker.pickImage(source: source);
    setState(() {
      if (_controller != null) {
        _controller.setVolume(0.0);
        _controller.removeListener(listener);
      }
      if (isVideo) {
        ImagePicker.pickVideo(source: source).then((File file) {
          if (file != null && mounted) {
            setState(() {
              _controller = VideoPlayerController.file(file)
                ..addListener(listener)
                ..setVolume(1.0)
                ..initialize()
                ..setLooping(true)
                ..play();
            });
          }
        });
      } else {
        _imageFile = ImagePicker.pickImage(source: source);
        _imageFile1 = image;
      }
    });
  }

  @override
  void deactivate() {
    if (_controller != null) {
      _controller.setVolume(0.0);
      _controller.removeListener(listener);
    }
    super.deactivate();
  }

  @override
  void dispose() {
    if (_controller != null) {
      _controller.dispose();
    }
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    listener = () {
      setState(() {});
    };
  }
  postData() {

  }

  Widget _previewImage() {
    return FutureBuilder<File>(
        future: _imageFile,
        builder: (BuildContext context, AsyncSnapshot<File> snapshot) {
          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.data != null) {
            return Image.file(snapshot.data);
          } else if (snapshot.error != null) {
            return const Text(
              'Error picking image.',
              textAlign: TextAlign.center,
            );
          } else {
            return const Text(
              'You have not yet picked an image.',
              textAlign: TextAlign.center,
            );
          }
        });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: new FlatButton(
            child: _previewImage(),
            onPressed: (){
              postData();
            
            },
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            onPressed: () {
              isVideo = false;
              _onImageButtonPressed(ImageSource.gallery);
            },
            heroTag: 'image0',
            tooltip: 'Pick Image from gallery',
            child: const Icon(Icons.photo_library),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: FloatingActionButton(
              onPressed: () {
                isVideo = false;
                _onImageButtonPressed(ImageSource.camera);
              },
              heroTag: 'image1',
              tooltip: 'Take a Photo',
              child: const Icon(Icons.camera_alt),
            ),
          ),
          
        ],
      ),
    );
  }
}*/

