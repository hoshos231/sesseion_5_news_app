import 'dart:convert' as convert;

import 'package:http/http.dart' as http;
import 'package:news_app/Medels/Artical.dart';

class Connection {
  Future<List<Artincal>> getData() async {
    String apiKey = '5d493ee7c4fc413c869879c09037c08c';

    // setting Api to ready for connect
    var url = Uri.parse(
        'https://newsapi.org/v2/everything?q=tesla&from=2022-01-17&sortBy=publishedAt&apiKey=$apiKey');

    // Await the http get response

    try {
      var response = await http.get(url);

      // make sure the status code is 200 ( Connection is done and has valid data with no issues )
      if (response.statusCode == 200) {
        // then decode the json-formatted response.
        var jsonResponse =
            convert.jsonDecode(response.body) as Map<String, dynamic>;

        // modulate my data to list of objects of Artical
        List myItems = jsonResponse['articles'] as List;
        List<Artincal> list = myItems.map((e) {
          return Artincal.fromJson(e);
        }).toList();

        // return my list of Artical and data ready to view
        return list;
      } else {
        /// return
        return [];
        print('Request failed with status: ${response.statusCode}.');
      }
    } on Exception catch (e) {
      return [
        Artincal(
            description: 'Error while loading data',
            title: 'Error',
            urlToImage: '')
      ];
    }
  }
}
