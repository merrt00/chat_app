import 'package:flutter/material.dart';

void main() => runApp(MyApp());  // Uygulamayı başlatan ana fonksiyon.

// Ana uygulama widget'ı.
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Temel mesajlaşma arayüzü",
      home: Iskele(),  // Scaffold döndüren widget.
    );
  }
}

// Scaffold, temel materyal tasarım düzenini sağlar.
class Iskele extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Mesaj Uygulaması"),  
        backgroundColor: Colors.lightGreenAccent,// AppBar'da görünen başlık.
      ),
      body: AnaEkran(),  // AnaEkran widget'ını gövde olarak kullanır.
    );
  }
}

// Mesajlaşma ekranı için StatefulWidget. State'i değiştirilebilir.
class AnaEkran extends StatefulWidget {
  @override
  _AnaEkranState createState() => _AnaEkranState();
}

class _AnaEkranState extends State<AnaEkran> {
  TextEditingController t1 = TextEditingController();  // Metin kutusu için controller.

  List mesajListesi = [];  // Mesajların saklandığı liste.

  // Mesajı listeye ekleyen fonksiyon.
  listeyeMesajEkle(String metin) {
    setState(() {
      mesajListesi.insert(0, metin);  // Mesajı listenin başına ekler.
      t1.clear();  // Metin kutusunun içeriğini temizler.
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(40),
      child: Column(
        children: <Widget>[
          // Mesajları gösteren bölüm.
          Flexible(
            child: ListView.builder(
              reverse: true,  // Listeyi tersine çevirerek yeni mesajların üstte görünmesini sağlar.
              itemCount: mesajListesi.length,  // Listede kaç adet öğe olduğunu belirtir.
              itemBuilder: (context, int indeksNumarasi) => // Her bir mesaj için Text widget'ı oluşturur.
                  Text(mesajListesi[indeksNumarasi]),
            ),
          ),
          // Mesaj girişi ve gönderme düğmesinin olduğu satır.
          Row(
            children: <Widget>[
              // Mesaj girişi için metin kutusu.
              Flexible(
                child: TextField(
                  
                  onSubmitted: listeyeMesajEkle,  // Klavyedeki gönderme tuşu ile mesajı listeye ekler.
                  controller: t1,  // Metin kutusunun controller'ı.
                ),
              ),
              // Mesajı gönderme düğmesi.
             /* ElevatedButton(
                  onPressed: () => listeyeMesajEkle(t1.text), 
                  child: Text("Gönder")),*/
          //ElevatedButton.icon(onPressed: () =>listeyeMesajEkle(t1.text), icon:Icon(Icons.send), label: const Text('')),
          IconButton(onPressed: () => listeyeMesajEkle(t1.text), icon: Icon(Icons.send_sharp),color: Colors.lightGreen,)

            ],
          ),
        ],
      ),
    );
  }
}