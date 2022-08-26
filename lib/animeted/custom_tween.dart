import 'package:flutter/material.dart';

class CustomTweenPage extends Tween<String> {
  CustomTweenPage({String begin = '', String end = ''})
      : super(begin: begin, end: end);

  @override
  String lerp(double t) {
    var cutoff = (end!.length * t).round();
    return end!.substring(0, cutoff);
  }
}

class CustomTweenA extends StatefulWidget {
  const CustomTweenA({super.key});

  @override
  State<CustomTweenA> createState() => _CustomTweenAState();
}

class _CustomTweenAState extends State<CustomTweenA>
    with SingleTickerProviderStateMixin {
  static const Duration _duration = Duration(seconds: 5);
  static const String message = loremIpsum;
  late final AnimationController controller;
  late final Animation<String> animation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(vsync: this, duration: _duration);
    animation = CustomTweenPage(end: message).animate(controller);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom Tween'),
        actions: [
          MaterialButton(
            textColor: Colors.white,
            onPressed: () {
              if (controller.status == AnimationStatus.completed) {
                controller.reverse().whenComplete(() {
                  setState(() {});
                });
              } else {
                controller.forward().whenComplete(() {
                  setState(() {});
                });
              }
            },
            child: Text(
              controller.status == AnimationStatus.completed
                  ? 'Delete Essay'
                  : 'Flutter about',
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Container(
          color: Colors.purpleAccent,
          alignment: Alignment.bottomCenter,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      child: AnimatedBuilder(
                        animation: animation,
                        builder: (context, child) {
                          return Text(
                            animation.value,
                            style: const TextStyle(
                                fontSize: 16, fontFamily: 'SpecialElite'),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

const String loremIpsum = '''
Flutter - bu Google tomonidan yaratilgan ochiq manbali dasturiy ta'minotni ishlab chiqish to'plami. U Android, iOS, Windows, Mac, Linux, Google Fuchsia va veb-dasturlarni bitta kod bazasidan ishlab chiqish uchun ishlatiladi.

Flutterning birinchi versiyasi "Sky" kod nomi bilan tanilgan va Android operatsion tizimida ishlaydi. Bu 2015 Dart dasturchilar sammitida e'lon qilindi, sekundiga 120 kvadrat tezlikda ishlash imkoniyatiga ega bo'lish. Shanxayda Google dasturchilar kunlarining asosiy nutqida Google Flutter 1.0-dan oldingi so'nggi yirik nashr bo'lgan Flutter Release Preview 2 ni e'lon qildi. 2018 yil 4 dekabr kuni Flutter 1.0 Flutter Live tadbirida Framework-ning birinchi "barqaror" versiyasini bildirgan holda chiqarildi. Flutter Interfaol tadbirida 2019 yil 11-dekabr kuni Flutter 1.12 sotuvga chiqarildi.

2020 yil 6-may kuni 2.8 versiyadagi Dart SDK va 1.17.0 versiyadagi Flutter chiqdi, unda iOS API qurilmalarida ish faoliyatini yaxshilash (taxminan 50%), yangi Moddiy vidjetlar va yangi tarmoqni Metal API qo'llab-quvvatladi.

Flutterning asosiy tarkibiy qismlari quyidagilardan iborat:

Dart platformasi

Flutter dvigateli

Fond kutubxonasi

Dizaynga tegishli vidjetlar


Dart platformasi
Flutter dasturlari dart tilida yozilgan va tilning ilg'or xususiyatlaridan foydalanadi. Yarim rasmiy Flutter Desktop Embedded loyihasi orqali Windows, MacOS va Linux-da, Flutter Dart virtual mashinasida ishlaydi, u bir vaqtning o'zida ijro etadigan dvigatelga ega. Ilovani yozish va disk raskadrovka qilish jarayonida, Flutter Just In Time kompilyatsiyasidan foydalanadi, bu esa "qayta yuklash" imkonini beradi, uning yordamida ishlaydigan dasturga o'zgartirish kiritilishi mumkin. Flutter bu holatni shtatdagi issiq qayta yuklash uchun qo'llab-quvvatlaydi, aksariyat hollarda boshlang'ich kodiga kiritilgan o'zgartirishlar qayta ishga tushirilmasdan yoki biron bir holatni yo'qotishni talab qilmasdan ishlayotgan ilovada darhol aks ettirilishi mumkin.

Flutter ilovalarining reliz versiyalari Android va iOS-da oldindan ishlab chiqilgan (AOT) kompilyatsiya bilan tuzilgan, bu Flutter-ning mobil qurilmalarda yuqori ishlashini ta'minlaydi.

Flutter dvigateli
Flutter dvigateli asosan C ++ tilida yozilgan bo'lib, Googlening Skia grafik kutubxonasidan foydalangan holda past darajadagi xizmat ko'rsatishni ta'minlaydi. Bundan tashqari, u Android va iOS tomonidan ta'minlangan platformalar uchun maxsus SDK-lar bilan interfeysga kiradi. Flutter dvigateli - bu Flutter dasturlarini qabul qilish uchun ko'chma ish vaqti. U Flutter-ning asosiy kutubxonalarini, jumladan, animatsiya va grafikani, fayl va tarmoqning I / O tarmog'ini, kirishni qo'llab-quvvatlashni, plaginlar arxitekturasini va Dart ish vaqti va kompilyatsiya qilish vositalarini o'z ichiga oladi. Ko'pgina ishlab chiquvchilar Flutter bilan zamonaviy, reaktiv ramka va platforma, sxemasi va poydevorining keng to'plamini ta'minlaydigan Flutter Framework orqali o'zaro aloqada bo'lishadi.

Dart tilida yozilgan "Foundation" kutubxonasi dvigatel bilan aloqa qilish uchun API kabi API kabi dasturlarni qurish uchun ishlatiladigan asosiy sinflar va funktsiyalarni ta'minlaydi.

Flutter platformasi maxsus dizayn tillariga mos keladigan ikkita vidjet to'plamini o'z ichiga oladi. Material Design vidjetlari xuddi shu nomdagi Google-ning dizayn tilini, Cupertino vidjetlari esa Apple-ning iOS Inson interfeysi bo'yicha ko'rsatmalarini bajaradi.

"Hello World" so'zining Flutterdagi kodlari.

import 'package:flutter/material.dart';

void main() => runApp(HelloWorldApp());

class HelloWorldApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //MaterialApp acts as a wrapper to the app and 
    //provides many features like title,home,theme etc
    
    return MaterialApp(
      title: 'Hello World App',
      //Scaffold acts as a binder that binds the appBar,
      //bottom nav bar and other UI components at their places
     
      home: Scaffold(
          //AppBar() widget automatically creates a material app bar
        appBar: AppBar(
          title: Text('Hello World App'),
        ),
        //Center widget aligns the child in center
        body: Center(
          child: Text('Hello World'),
        ),
      ),
    );
  }
}''';