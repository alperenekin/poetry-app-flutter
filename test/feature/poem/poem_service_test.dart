import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:poem_app/view/poem/model/poem_model.dart';

void main() {
  late Dio dio;
  setUp(() {
    dio = Dio(BaseOptions(
        responseType: ResponseType.json, baseUrl: 'https://poetrydb.org/'));
  });
  test('Get All Authors', () async {
    final Response response = await dio.get('author',
        options: Options(contentType: Headers.formUrlEncodedContentType));
    final Map? data = response.data;
    final List<String> authorNames = data?['authors'] as List<String>;
    expect(authorNames.isNotEmpty,true);
  });

  test('Get Poems By Author', () async {
    final Response response = await dio.get('author/emily',
        options: Options(contentType: Headers.formUrlEncodedContentType));
    final List poemList = response.data;
    final List<PoemModel>? poems = poemList.map((e) => PoemModel.fromJson(e)).toList();
    expect(poems?.isNotEmpty, true);
  });
}
