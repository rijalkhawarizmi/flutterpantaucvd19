import 'package:flutter/material.dart';
import 'package:pantaucvd19/models/modeldataindonesia.dart';
import 'package:pantaucvd19/services/services.dart';
import 'package:provider/provider.dart';

import 'package:pantaucvd19/models/modeldataprovinsi.dart';

class ProviderServices extends ChangeNotifier{

  List<ModelDataProvinsi> _list=[];

  List<ModelDataIndonesia> _alldata=[];

  fetchDataProvinsi()async{
   _list = await ServicesAPI().getDataProvinsi();
   notifyListeners();
  }

  fetchAllDataIndonesia()async{
    _alldata = await ServicesAPI().getDataAll();
    notifyListeners();
  }

  List<ModelDataProvinsi> get getlistprovinsi => _list;

  List<ModelDataIndonesia> get alldata=> _alldata;






}