import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pantaucvd19/models/modeldataindonesia.dart';
import 'package:pantaucvd19/models/modeldataprovinsi.dart';


class ServicesAPI{

  Future<List<ModelDataProvinsi>>getDataProvinsi()async{

    String url='https://api.kawalcorona.com/indonesia/provinsi';
    final response=await http.get(url);
   if(response.statusCode==200){
     final decode=jsonDecode(response.body);
     List<ModelDataProvinsi> list = decode.map<ModelDataProvinsi>((e){
       return ModelDataProvinsi.fromJson(e);
     }).toList();
     print(list);
     return list;
   }else{
     throw Exception('Not Found');
   }
  }

  Future<List<ModelDataIndonesia>>getDataAll()async {
    String url='https://api.kawalcorona.com/indonesia';
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final decode = jsonDecode(response.body);
      List<ModelDataIndonesia> list = decode.map<ModelDataIndonesia>((e) {
        return ModelDataIndonesia.fromJson(e);
      }).toList();
      return list;
    } else {
      throw Exception('Not Found');
    }
  }

}

