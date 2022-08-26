import 'package:flutter/material.dart';

class HeroAnimeted extends StatefulWidget {
  const HeroAnimeted({Key? key}) : super(key: key);

  @override
  State<HeroAnimeted> createState() => _HeroAnimetedState();
}

class _HeroAnimetedState extends State<HeroAnimeted> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hero Animeted"),
        
      ),
      body: GestureDetector(
        onTap: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (context) => Page2())),
        child: Center(
          child: Hero(
            tag: 'image1',
            child: Image.network("https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?cs=srgb&dl=pexels-anjana-c-674010.jpg&fm=jpg",width: 150,),
          ),
        ),
      ),
    );
  }
}

class Page2 extends StatefulWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hero Animeted"),
      ),
      body:  Hero(
        tag: 'image1',
        child: Image.network("https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?cs=srgb&dl=pexels-anjana-c-674010.jpg&fm=jpg",width: MediaQuery.of(context).size.width,height: MediaQuery.of(context).size.height,),
      ),
    );
  }
}

