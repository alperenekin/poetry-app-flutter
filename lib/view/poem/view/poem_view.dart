import 'package:flutter/material.dart';
import 'package:poem_app/view/poem/viewmodel/poem_viewmodel.dart';

class PoemView extends StatefulWidget {
  @override
  _PoemViewState createState() => _PoemViewState();
}

class _PoemViewState extends State<PoemView> {
  final PoemViewModel? viewModel = PoemViewModelStore();

  @override
  void initState() {
    super.initState();
    viewModel?.init();
    asyncInit();
  }

  Future<void> asyncInit() async {
    await viewModel?.fetchAuthors();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('data'),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: viewModel?.authorList?.length,
          itemBuilder: (BuildContext context, int index) {
            return Text(viewModel?.authorList?[index] ?? 'null');
          },
        ),
      ),
    );
  }
}
