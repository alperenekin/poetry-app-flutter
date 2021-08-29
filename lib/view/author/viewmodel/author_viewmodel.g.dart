// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'author_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AuthorViewModelStore on AuthorViewModel, Store {
  final _$poemListAtom = Atom(name: 'AuthorViewModel.poemList');

  @override
  List<PoemModel?>? get poemList {
    _$poemListAtom.reportRead();
    return super.poemList;
  }

  @override
  set poemList(List<PoemModel?>? value) {
    _$poemListAtom.reportWrite(value, super.poemList, () {
      super.poemList = value;
    });
  }

  final _$isLoadingAtom = Atom(name: 'AuthorViewModel.isLoading');

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

  final _$fetchPoemsAsyncAction = AsyncAction('AuthorViewModel.fetchPoems');

  @override
  Future<void> fetchPoems(String author) {
    return _$fetchPoemsAsyncAction.run(() => super.fetchPoems(author));
  }

  final _$AuthorViewModelActionController =
      ActionController(name: 'AuthorViewModel');

  @override
  void changeLoading() {
    final _$actionInfo = _$AuthorViewModelActionController.startAction(
        name: 'AuthorViewModel.changeLoading');
    try {
      return super.changeLoading();
    } finally {
      _$AuthorViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
poemList: ${poemList},
isLoading: ${isLoading}
    ''';
  }
}
