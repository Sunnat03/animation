import 'package:flutter/material.dart';

class CustomAnimatedContainer extends StatefulWidget {
  const CustomAnimatedContainer({Key? key}) : super(key: key);

  @override
  State<CustomAnimatedContainer> createState() => _CustomAnimatedContainerState();
}

class _CustomAnimatedContainerState extends State<CustomAnimatedContainer> {

  double _height = 200;
  double _width = 200;
  bool isIncrement = true;
  void _play(){
   if((_width < MediaQuery.of(context).size.width && isIncrement) || _width<=100){
     setState((){
       isIncrement = true;
       _height +=75;
       _width +=75;
     });
   }else{
     setState((){
       isIncrement = false;
       _height -=75;
       _width -=75;
     });
   }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Animated Container"),
        backgroundColor: Colors.blueGrey.shade800,
      ),
      body: Center(
        child: AnimatedContainer(
          color: Colors.pink,
          height: _height,
          width: _width,
          duration: const Duration(
            milliseconds: 1500,

          ),
          curve: Curves.fastLinearToSlowEaseIn,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueGrey.shade800,
          onPressed: _play,
      child:const Icon(Icons.play_arrow, size: 30,),
      ),
    );
  }
}
