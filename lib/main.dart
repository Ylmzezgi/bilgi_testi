import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:untitled6/sabitler.dart';
import 'package:untitled6/test_veri.dart';
import 'package:untitled6/soru.dart';
void main() => runApp(BilgiTesti());

class BilgiTesti extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            backgroundColor: Colors.indigo[700],
            body: SafeArea(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: SoruSayfasi(),
                ))));
  }
}
class SoruSayfasi extends StatefulWidget {
  @override
  _SoruSayfasiState createState() => _SoruSayfasiState();
}
class _SoruSayfasiState extends State<SoruSayfasi> {
  void butonFonksiyonu(bool secilenbuton){
    if(test_1.TestBittiMi()==true){
      /*alertdialog göster*/
      showDialog(
          context: context,
          builder:(BuildContext context){
            return AlertDialog(
              title:new Text("TEST BİTTİ"),
              //content: new Text("alert dialog body"),
              actions: <Widget>[
                new ElevatedButton(
                  child: new Text("close"),
                    onPressed:(){
                    Navigator.of(context).pop();//close basıldığında kapanmasını ekrandan gitmesini sağlar
                    setState(() {
                      test_1.testiSifirla();
                      secimler=[];
                    });
                  }


                ),
              ],
            );
          },);
      /*indexi sıfırla test_1.testiSifirla();*/
      /*secimleri sisfırla secimler=[];*/
      /*EKRANI TEKRAR ÇİZMESİ İÇİN setState in içine konulması gerek*/

    }
    else{
      setState(() {
        test_1.getSoruYanit()==secilenbuton ? secimler.add(kdogruIcon):secimler.add(kyanlisIcon) ;
        test_1.sonrakkiSoru();
      });
    }
  }
 TestVeri test_1=TestVeri();
  List<Widget> secimler=[];
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 4,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                test_1.getSoruMetni(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Wrap(runSpacing:3,children:secimler),
        Expanded(
          flex: 1,
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 6.0),
              child: Row(children: <Widget>[
                Expanded(
                    child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 6),
                        child: ElevatedButton(
                            onPressed: (){
                              butonFonksiyonu(false);

                            },
                            child:Icon(
                                Icons.thumb_down,size:30.0),)

                        )
                        ),

                Expanded(
                    child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 6),
                        child: ElevatedButton(onPressed: (){
                          setState(() {
                            butonFonksiyonu(true);

                          });
                        }, child:Icon(Icons.thumb_up)))),
              ])),
        )
      ],
    );
  }
}

