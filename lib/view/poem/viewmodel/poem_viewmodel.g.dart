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

  final _$fetchAuthorsAsyncAction = AsyncAction('PoemViewModel.fetchAuthors');

  @override
  Future<void> fetchAuthors() {
    return _$fetchAuthorsAsyncAction.run(() => super.fetchAuthors());
  }

  @override
  String toString() {
    return '''
authorList: ${authorList}
    ''';
  }
}
