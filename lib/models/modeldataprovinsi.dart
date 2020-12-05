


class ModelDataProvinsi{

  Attributes attributes;

  ModelDataProvinsi({this.attributes});

  factory ModelDataProvinsi.fromJson(Map<String,dynamic>json){

    return ModelDataProvinsi(
      attributes: Attributes.fromJson(json['attributes'])
    );
  }

}

class Attributes{

  String Provinsi;
  int Kasus_Posi;
  int Kasus_Semb;
  int Kasus_Meni;

  Attributes({this.Provinsi,this.Kasus_Meni,this.Kasus_Posi,this.Kasus_Semb});

  factory Attributes.fromJson(Map<String,dynamic>json){
    return Attributes(
      Provinsi:json['Provinsi'],
      Kasus_Semb:json['Kasus_Semb'],
      Kasus_Posi:json['Kasus_Posi'],
      Kasus_Meni:json['Kasus_Meni'],
    );
  }


}

