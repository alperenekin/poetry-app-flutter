import 'package:dio/dio.dart';
import 'package:mobx/mobx.dart';
import 'package:poem_app/view/poem/service/poem_service.dart';

part 'poem_viewmodel.g.dart';

class PoemViewModelStore = PoemViewModel with _$PoemViewModelStore;

abstract class PoemViewModel with Store {
  late IPoemService _poemService;

  void init() {
    _poemService = PoemService(Dio(BaseOptions(
        responseType: ResponseType.json, baseUrl: 'https://poetrydb.org/')));
  }

  @observable
  List<String?>? authorList;

  @observable
  bool isLoading = false;

  @action
  Future<void> fetchAuthors() async {
    changeLoading();
    authorList = await _poemService.getAllAuthors();
    changeLoading();
  }

  @action
  void changeLoading(){
    isLoading = !isLoading;
  }
}
