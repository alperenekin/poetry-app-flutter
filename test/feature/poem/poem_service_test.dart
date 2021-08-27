
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:poem_app/view/poem/model/poem_model.dart';
import 'package:poem_app/view/poem/service/poem_service.dart';

void main() {
  late Dio dio;
  late IPoemService poemService;
  setUp(() {
    dio = Dio(BaseOptions(
        responseType: ResponseType.json, baseUrl: 'https://poetrydb.org/'));
    poemService = PoemService(dio);
  });
  test('Get All Authors', () async {

    final List<String?>? authorNames  = await poemService.getAllAuthors();
    expect(authorNames?.isNotEmpty,true);
  });

  test('Get Poems By Author', () async {

    final List<PoemModel?>? poems = await poemService.getAllPoemsOfAuthor('emily');
    expect(poems?.isNotEmpty, true);
  });
}
