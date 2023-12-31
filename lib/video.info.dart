// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:applover/homepage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:applover/color.dart' as color;
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';


class VideoInfo extends StatefulWidget {
  const VideoInfo({ Key? key }) : super(key: key);

  @override
  _VideoInfoState createState() => _VideoInfoState();
}

class _VideoInfoState extends State<VideoInfo> {
List videoInfo = [];
bool _playArea = false;
bool _isPlaying = false;
VideoPlayerController? _controller;
  _initData() async {
    await DefaultAssetBundle.of(context).loadString('json/videoinfo.json').then((value){
     setState(() {
        videoInfo = json.decode(value);
     });
    });
  }
  @override
    void initState(){
      super.initState();
      _initData();
    }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: _playArea==false?BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.AppColor.gradientFirst.withOpacity(0.9),
              color.AppColor.gradientSecond,
            ],
            begin: const FractionalOffset(0.0, 0.4),
            end: Alignment.topRight,
            )
        ):BoxDecoration(color: color.AppColor.gradientSecond),
        child: Column(
          children: [
           _playArea==false? Container(
              padding: const EdgeInsets.only(top:  70, left: 30, right: 30),
              width: MediaQuery.of(context).size.width,
              height: 300,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      InkWell(
                        onTap: (){
                          Get.back();
                        },
                        child: Icon(Icons.arrow_back_ios, size: 20,
                        color: color.AppColor.secondPageIconColor,),
                      ),
                      Expanded(child: Container(),),
                      Icon(Icons.info_outline, size: 20,
                      color: color.AppColor.secondPageIconColor,)
                    ],
                  ),
                  SizedBox(height: 30,),
                  Text(
                      'Next Training',
                      style: TextStyle(
                        fontSize: 16,
                        color: color.AppColor.secondPageTitleColor,
                      ),
                    ),
                    SizedBox( height: 5,
                    ),
                    Text(
                      'Squating Pushup',
                      style: TextStyle(
                        fontSize: 25,
                        color: color.AppColor.secondPageTitleColor,
                      ),
                    ),
                    SizedBox(height: 50,),
                    Row(
                      children: [
                        Container(
                          width: 90,
                          height: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(
                              colors: [
                                color.AppColor.secondPageContainerGradient1stColor,
                                color.AppColor.secondPageContainerGradient2ndColor,
                                
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.timer,
                              size: 20,
                              color: color.AppColor.secondPageIconColor,),
                              SizedBox(width: 5,),
                            Text('50 min',
                            style: TextStyle(
                              fontSize: 13,
                              color: color.AppColor.secondPageIconColor,
                            ),)
                            ],
                          ),
                        ),
                        SizedBox(width: 20,),
                        Expanded(
                          child: Container(
                            width: 250,
                            height: 30,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient: LinearGradient(
                                colors: [
                                  color.AppColor.secondPageContainerGradient1stColor,
                                  color.AppColor.secondPageContainerGradient2ndColor,
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.handyman_outlined,
                                size: 20,
                                color: color.AppColor.secondPageIconColor,),
                                SizedBox(width: 3,),
                              Text('Resistant Band, Ketttebell',
                              style: TextStyle(
                                fontSize: 13,
                                color: color.AppColor.secondPageIconColor,
                                
                              ),),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ) : Container(
              child: Column(children: [
                Container(
                  height: 100,
                  padding: const EdgeInsets.only(top: 50, left: 30, right: 30),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: (){
                          debugPrint('tapped');
                        },
                        child: Icon(Icons.arrow_back_ios,
                        size: 20,
                        color: color.AppColor.secondPageIconColor,),
                        
                      ),
                      Expanded(child: Container(),),
                      Icon(Icons.info_outline,
                      size: 20,
                      color: color.AppColor.secondPageTopIconColor,
                      ),
                    ],
                  ),
                ),
              _playView(context),
              _controlView(context),
              
              ],),
            ),

            Expanded(
              child: Container(

                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(70),
                  )
                ),
                child: Column(
                  children: [
                    SizedBox(height: 30,),
                    Row(
                      children: [
                        SizedBox(width: 30,),
                        Text('Activity: Legs Toning',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color:  color.AppColor.circuitsColor,
                        ),),
                      Expanded(child: Container()),
                      Row(
                        children: [
                          Icon(Icons.loop, color: color.AppColor.loopColor,
                          size: 30,),
                          SizedBox(width: 10,),
                          Text('3 sets',
                          style: TextStyle(
                            color: color.AppColor.setsColor,
                            fontSize: 15,
                          ),
                          ),
                        ],
                      ),
                      SizedBox(width: 30,),
                      ],
                    ),
                    SizedBox(height: 20,),
                  Expanded(child: _listView(),),
                  ],
                ),

              ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _controlView(BuildContext context){
    return Container(
      height: 120,
      width: MediaQuery.of(context).size.width,
      color: color.AppColor.gradientSecond,
      child: Row(
        children: [
          ElevatedButton(
            onPressed: ()async{}, 
            child: Icon(
              Icons.fast_rewind,
              size: 36,
              color: Colors.white,
            ),),
          ElevatedButton(
            onPressed: ()async{
              if(_isPlaying){
                setState(() {
                  _isPlaying = false;
                });
                _controller?.pause();
              }else{
                 setState(() {
                  _isPlaying = false;
                }); 
                _controller?.play();
              }
            }, 
            child: Icon( _isPlaying?Icons.pause: Icons.play_arrow,
              size: 36,
              color: Colors.white,
            ),),
          ElevatedButton(
            onPressed: ()async{}, 
            child: Icon(
              Icons.fast_forward,
              size: 36,
              color: Colors.white,
            ),),
        ],
      ),
    );
  }
  
  void _onControllerUpdate()async{
    final controller = _controller;
    if(controller == null){
      debugPrint('controller is null');
      return;
    }if(!controller.value.isInitialized){
      debugPrint('controller can not be initialized');
      return;
    }
    final playing = controller.value.isPlaying;
    _isPlaying=playing;
  }
  _initializeVideo(int index)async{
    final controller = VideoPlayerController.network(videoInfo[index]["videoUrl"]);
    _controller = controller;
    setState(() {
      controller
      ..initialize().then((_){
        controller.addListener(_onControllerUpdate);
        controller.play();
        setState(() {
          
        });
      });
    });
  }
  Widget _playView(BuildContext context){
    final controller = _controller;
    if(controller!=null&&controller.value.isInitialized){
      return AspectRatio(
       aspectRatio: 16/9,
        child: VideoPlayer(controller),
      ); 
    }else{
     return AspectRatio(
       aspectRatio: 16/9,
       child: Center(child: Text('Loading...',
       style: TextStyle(
         color: Colors.white60,
         fontSize: 20,
       ),
       )));
    }
  }
  _onTapVideo(int index){
    final controller = VideoPlayerController.network(videoInfo[index]["videoUrl"]);
    _controller = controller;
    setState(() {
      
    });
    // ignore: avoid_single_cascade_in_expression_statements
    controller..initialize().then((_){
      controller.play();
      setState(() {
      });
    });

  }
  _listView(){
    return ListView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 8),
                    itemCount: videoInfo.length ,
                    itemBuilder: (_, int index){
                      return GestureDetector(
                        onTap: (){
                          _onTapVideo(index);
                          debugPrint(index.toString());
                          setState(() {
                            if(_playArea==false){
                              _playArea= true;
                            }
                          });
                        },
                        child: _buildCard(index),
                      );
                    },);
  }
  _buildCard(int index){
    return Container(
                          height: 135,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width: 80,
                                    height: 80,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      image: DecorationImage(
                                        image: AssetImage(
                                          videoInfo[index]['thumbnail'],
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                SizedBox(width: 10,),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(videoInfo[index]['title'],
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(height: 10,),
                                      Padding(padding: EdgeInsets.only(top: 3),
                                      child: Text(
                                        videoInfo[index]['time'],
                                        style: TextStyle(
                                          color: Colors.grey[500],
                                        ),
                                      ),),
                                  ],
                                ),
                                ],
                              ),
                            SizedBox(height: 18,),
                            Row(
                              children: [
                                Container(
                                  width: 80,
                                  height: 20,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFeaeefc),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Center(
                                    child: Text(
                                      '15s calm',
                                      style: TextStyle(
                                        color: Color(0xFF839fed),),
                                    ),
                                  ),
                                ),
                              Row(children: [
                                for(int i = 0; i<70; i++)
                                i.isEven?Container(
                                  width: 3,
                                  height: 1,
                                  decoration: BoxDecoration(
                                    color: Color(0xFF839fed),
                                    borderRadius: BorderRadius.circular(2),
                                  ),
                                ):Container(
                                  width: 3,
                                  height: 1,
                                  color: Colors.white,
                                ),
                              ],),
                              ],
                            ),
                            ],
                          ),
                        );
  }
}
