// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'poem_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PoemViewModelStore on PoemViewModel, Store {
  final _$authorListAtom = Atom(name: 'PoemViewModel.authorList');

  @override
  List<String?>? get authorList {
    _$authorListAtom.reportRead();
    return super.authorList;
  }

  @override
  set authorList(List<String?>? value) {
    _$authorListAtom.reportWrite(value, super.authorList, () {
      super.authorList = value;
    });
  }

  final _$isLoadingAtom = Atom(name: 'PoemViewModel.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$searchedAuthorsAtom = Atom(name: 'PoemViewModel.searchedAuthors');

  @override
  List<String?>? get searchedAuthors {
    _$searchedAuthorsAtom.reportRead();
    return super.searchedAuthors;
  }

  @override
  set searchedAuthors(List<String?>? value) {
    _$searchedAuthorsAtom.reportWrite(value, super.searchedAuthors, () {
      super.searchedAuthors = value;
    });
  }

  final _$selectedIndexAtom = Atom(name: 'PoemViewModel.selectedIndex');

  @override
  int get selectedIndex {
    _$selectedIndexAtom.reportRead();
    return super.selectedIndex;
  }

  @override
  set selectedIndex(int value) {
    _$selectedIndexAtom.reportWrite(value, super.selectedIndex, () {
      super.selectedIndex = value;
    });
  }

  final _$fetchAuthorsAsyncAction = AsyncAction('PoemViewModel.fetchAuthors');

  @override
  Future<void> fetchAuthors() {
    return _$fetchAuthorsAsyncAction.run(() => super.fetchAuthors());
  }

  final _$PoemViewModelActionController =
      ActionController(name: 'PoemViewModel');

  @override
  void changeIndex(int index) {
    final _$actionInfo = _$PoemViewModelActionController.startAction(
        name: 'PoemViewModel.changeIndex');
    try {
      return super.changeIndex(index);
    } finally {
      _$PoemViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  void findAuthors(String firstLetter) {
    final _$actionInfo = _$PoemViewModelActionController.startAction(
        name: 'PoemViewModel.findAuthors');
    try {
      return super.findAuthors(firstLetter);
    } finally {
      _$PoemViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeLoading() {
    final _$actionInfo = _$PoemViewModelActionController.startAction(
        name: 'PoemViewModel.changeLoading');
    try {
      return super.changeLoading();
    } finally {
      _$PoemViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
authorList: ${authorList},
isLoading: ${isLoading},
searchedAuthors: ${searchedAuthors},
selectedIndex: ${selectedIndex}
    ''';
  }
}
