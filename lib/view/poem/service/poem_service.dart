import 'dart:io';

import 'package:dio/dio.dart';
import 'package:poem_app/view/poem/model/poem_model.dart';

abstract class IPoemService {
  final Dio _dio;

  IPoemService(this._dio);

  Future<List<String?>?> getAllAuthors();

  Future<List<PoemModel?>?> getAllPoemsOfAuthor(String authorName);
}

class PoemService extends IPoemService {
  PoemService(Dio dio) : super(dio);

  Future<List<String?>?> getAllAuthors() async {
    Response response = await _dio.get('author',
        options: Options(contentType: Headers.formUrlEncodedContentType));
    if (response.statusCode == HttpStatus.ok) {
      final Map? data = response.data;
      final List<String> authorNames = List<String>.from(data?['authors']);
      return authorNames;
    } else {
      return null; // can be a better solution other than null
    }
  }

  @override
  Future<List<PoemModel?>?> getAllPoemsOfAuthor(String authorName) async {
    Response response = await _dio.get('author/$authorName',
        options: Options(contentType: Headers.formUrlEncodedContentType));
    if (response.statusCode == HttpStatus.ok) {
      final List poemList = response.data;
      final List<PoemModel>? poems = poemList.map((e) => PoemModel.fromJson(e)).toList();
      return poems;
    } else {
      return null; // can be a better solution other than null
    }
  }
}
