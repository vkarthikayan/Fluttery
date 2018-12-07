import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' show Client;

import './Movies.dart';

class FetchData {
  Client client = Client();

  Future<List<Movies>> fetchPost() async {
    final response =
        await client.get('https://jsonplaceholder.typicode.com/photos');

    // Use the compute function to run parsePhotos in a separate isolate
    return compute(parsePhotos, response.body);
    /*final response =
        await client.get('https://jsonplaceholder.typicode.com/posts/1');

    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      return Movies.fromJson(json.decode(response.body));
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load movie list');
    }*/
  }

  List<Movies> parsePhotos(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

    return parsed.map<Movies>((json) => Movies.fromJson(json)).toList();
  }
}
