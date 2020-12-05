import 'package:flutter/material.dart';



class Explain1 extends StatelessWidget {

  Widget _bangun( Text text){
    return  Padding(
      padding: const EdgeInsets.only(left:20.0,top: 10.0,right: 20.0,),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(0, 10),
                          color: Colors.black54,
                          blurRadius: 10.0
                      )
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)
                ),
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: <Widget>[
                        text
                      ],
                    )
                )),
          ),
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body:Column(
            children: <Widget>[
              _bangun(Text('Anda yang mengunjungi klinik atau rumah sakit, termasuk dokter, perawat, dan tenaga medis yang bekerja di sana',style: TextStyle(fontFamily: 'poppins'),),),
              _bangun(Text('Anda memiliki gejala penyakit, terutama infeksi pernapasan, dan orang lain berada dalam ruangan yang sama dengan Anda.',style: TextStyle(fontFamily: 'poppins'),),),
              _bangun(Text('Anda berada di tempat keramaian, seperti terminal, bandara, stasiun, dan tempat lainnya yang memiliki potensi penularan penyakit lebih besar dari orang lain terhadap Anda. ',style: TextStyle(fontFamily: 'poppins'),))
            ],
          )
      ),
    );
  }
}


class Explain2 extends StatelessWidget {
  Widget _bangun( Text textjudul,Text text) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, top: 10.0, right: 20.0,),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(0,0),
                          color: Colors.black38,
                          blurRadius: 20.0
                      )
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)
                ),
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        textjudul,
                        SizedBox(
                          height: 10.0,
                        ),
                        text
                      ],
                    )
                )),
          ),
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              _bangun(Text('Sering mencuci tangan',style: TextStyle(fontFamily: 'Spartan',fontSize: 20.0),),Text('Salah satu cara pencegahan virus corona adalah dengan sering mencuci tangan. Pastikan mencuci tangan setelah dari toilet, setelah batuk dan bersin, serta sebelum makan.Anda bisa mencuci tangan menggunakan air mengalir dan sabun. Namun, jika Anda sulit menemukan akses air mengalir, Anda bisa mencuci tangan dengan cairan pembersih yang mengandung alkohol 60%.Mencuci tangan dengan air mengalir dan sabun atau cairan pembersih yang mengandung alkohol dapat membantu menyingkirkan dan membunuh virus yang mungkin terdapat pada tangan Anda. Pastikan Anda mencuci tangan dengan cara yang tepat selama minimal 20 detik.',style: TextStyle(fontFamily: 'poppins',fontSize: 12.0),)),
              _bangun(Text('Jaga jarak dengan orang yang sedang sakit',style: TextStyle(fontFamily: 'Spartan',fontSize: 20.0)), Text('Hindari berdekatan dengan orang yang sedang sakit, termasuk orang yang mengalami gejala batuk atau bersin, paling tidak sejauh 1 meter.Ketika ada seseorang yang batuk dan bersin, mereka akan mengeluarkan percikan cairan yang mengandung virus dari hidung atau mulutnya.Jika jarak Anda terlalu dekat dengannya, Anda bisa menghirup percikan cairan sehingga menyebabkan Anda tertular penyakit yang dialami oleh orang tersebut. Hal ini berlaku pula bila seseorang tersebut mengalami COVID-19.',style: TextStyle(fontFamily: 'poppins',fontSize: 12.0)),),
              _bangun(Text('Hindari menyentuh mata, hidung, dan mulut sampai tangan sudah bersih',style: TextStyle(fontFamily: 'Spartan',fontSize: 20.0)), Text('Cara pencegahan virus corona lainnya adalah dengan menghindari sentuh mata, hidung, dan mulut, sampai tangan sudah dalam kondisi bersih.Pasalnya, sehari-hari Anda mungkin menyentuh benda apa pun yang berada di sekitar Anda. Disadari atau tidak, benda-benda tersebut dapat berisiko meningkatkan penyebaran virus di tangan Anda.Saat tangan menyentuh mata, hidung, dan mulut maka virus dapat masuk ke dalam tubuh sehingga membuat Anda jatuh sakit.',style: TextStyle(fontSize: 12.0,fontFamily: 'poppins'),),),
              _bangun(Text('Menjaga kebersihan saat bersin dan batuk',style: TextStyle(fontFamily: 'Spartan',fontSize: 20.0)), Text('Ketika Anda bersin dan batuk, pastikan Anda menutup hidung dan mulut dengan siku bagian dalam atau tisu.Dengan ini, Anda dapat melindungi orang lain di sekitar Anda dari berbagai macam virus, seperti flu, pilek, hingga COVID-19, yang mungkin keluar melalui percikan cairan dari mulut dan hidung.',style: TextStyle(fontFamily: 'poppins',fontSize: 12),)),
              _bangun(Text('Periksakan diri ke dokter bila alami kondisi tertentu',style: TextStyle(fontSize: 20.0,fontFamily: 'Spartan'),), Text('Sebaiknya jangan bepergian keluar rumah bila Anda sedang sakit. Jika Anda mengalami demam, batuk, atau sulit bernapas, segera periksakan diri ke dokter guna mendapatkan penanganan yang tepat.',style: TextStyle(fontFamily: 'poppins',fontSize: 12.0),))
            ],
          ),
        ),
      ),
    );
  }
}
