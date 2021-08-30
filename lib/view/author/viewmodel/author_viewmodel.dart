import 'package:dio/dio.dart';
import 'package:mobx/mobx.dart';
import 'package:poem_app/core/base/base_viewmodel.dart';
import 'package:poem_app/core/init/navigation/navigation_constants.dart';
import 'package:poem_app/view/poem/model/poem_model.dart';
import 'package:poem_app/view/poem/service/poem_service.dart';

part 'author_viewmodel.g.dart';

class AuthorViewModelStore = AuthorViewModel with _$AuthorViewModelStore;

abstract class AuthorViewModel with Store, BaseViewModel {
  late IPoemService _poemService;

  void init() {
    _poemService = PoemService(Dio(BaseOptions(
        responseType: ResponseType.json, baseUrl: 'https://poetrydb.org/')));
  }

  @observable
  List<PoemModel?>? poemList;

  @observable
  bool isLoading = false;

  @action
  Future<void> fetchPoems(String author) async {
    changeLoading();
    poemList = await _poemService.getAllPoemsOfAuthor(author);
    changeLoading();
  }

  @action
  void changeLoading() {
    isLoading = !isLoading;
  }

  void navigateToPoems() {
    navigation.navigateToPage(NavigationConstants.POEM_DETAIL, object: poemList);
  }

}
