import 'package:dio/dio.dart';
import 'package:mobx/mobx.dart';
import 'package:poem_app/core/base/base_viewmodel.dart';
import 'package:poem_app/core/init/navigation/navigation_constants.dart';
import 'package:poem_app/view/poem/service/poem_service.dart';

part 'poem_viewmodel.g.dart';

class PoemViewModelStore = PoemViewModel with _$PoemViewModelStore;

abstract class PoemViewModel with Store, BaseViewModel {
    late IPoemService _poemService;

    void init() {
      _poemService = PoemService(Dio(BaseOptions(
          responseType: ResponseType.json, baseUrl: 'https://poetrydb.org/')));
    }

    @observable
    List<String?>? authorList;

    @observable
    bool isLoading = false;

    @observable
    List<String?>? searchedAuthors = ObservableList.of([]); //!!!! searchedAuthors = [] do not work properly

    @observable
    int selectedIndex = 0;

    List<String?>? letterList = ["-"]; // All is for no alphabetic character case

  @action
  Future<void> fetchAuthors() async {
    changeLoading();
    authorList = await _poemService.getAllAuthors();
    findLetters();
    changeLoading();
  }

  @action
  void changeIndex(int index){
    selectedIndex = index;
  }

  @action
  void findAuthors(String firstLetter){
    if(searchedAuthors!.isNotEmpty){
      searchedAuthors?.clear();
    }
    authorList?.forEach((element) {
      if(element!.startsWith(firstLetter)){
        searchedAuthors?.add(element);
      }
    });
  }

  void findLetters(){ // to find all first letters in author names
    authorList?.forEach((element) {
      var letter = element?[0];
      if(!letterList!.contains(letter)){
        letterList?.add(letter);
      }
    });
    letterList?.sort(); // for our case, don't need to sort.
  }

  @action
  void changeLoading(){
    isLoading = !isLoading;
  }

  void navigateToAuthorView(String author) {
    navigation.navigateToPage(NavigationConstants.AUTHOR_VIEW, object: author);
  }

}
