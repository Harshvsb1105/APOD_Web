import 'dart:convert';
import 'package:astrology_pic_of_day/Model/AstrologyModel.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;


class FetchDataController extends GetxController {
  Future<AstrologyModel> fetchData(
    String selectedDate,
  ) async {
    final apiUrl = 'https://api.nasa.gov/planetary/apod?api_key=aWPhODExHc5j48m59viPzCysv1jkoaN7ID2dchPw&date=$selectedDate';
    final http.Response response = await http.get(
      apiUrl,
    );
    print(apiUrl);
    if(response.statusCode == 200){

      var convertDataToJson = jsonDecode(response.body);
      AstrologyModel astrologyModel = AstrologyModel.fromJson(convertDataToJson);
      print("this is astro body : ${response.body}");
      return astrologyModel;
    } else {
      return null;
    }
  }
}
