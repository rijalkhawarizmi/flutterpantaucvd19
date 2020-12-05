

class ModelDataIndonesia{

  String positif;
  String sembuh;
  String meninggal;

  ModelDataIndonesia({this.meninggal,this.positif,this.sembuh});

  factory ModelDataIndonesia.fromJson(Map<String,dynamic>json){
    return ModelDataIndonesia(
      positif: json['positif'],
      sembuh: json['sembuh'],
      meninggal: json['meninggal']
    );
  }

}