import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:trudosys/models/data_model.dart';

class HomeScreenProvider extends ChangeNotifier{
 List<Datum> apiList = [];
  bool isLoading = true;
 int _page = 1;

 bool hasNextPage = true;

   Future<List<Datum>> fetchData() async {

          final response = await http.get(Uri.parse("https://reqres.in/api/users?page=$_page"));
          if(response.statusCode == 200) {
            var responseData = json.decode(response.body);
            DataModel datas =DataModel.fromJson(responseData);
            apiList.addAll(datas.data);
            hasNextPage = (_page < responseData['total_pages']);
            _page++;
            notifyListeners();
          }else{
            print("Something went wrong");
          }

          isLoading = false;
          notifyListeners();
          return apiList;


      }
}