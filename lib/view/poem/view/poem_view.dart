import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:poem_app/view/poem/viewmodel/poem_viewmodel.dart';

class PoemView extends StatefulWidget {
  @override
  _PoemViewState createState() => _PoemViewState();
}

class _PoemViewState extends State<PoemView> {
  final PoemViewModel viewModel = PoemViewModelStore();

  @override
  void initState() {
    super.initState();
    viewModel.init();
    asyncInit();
  }

  Future<void> asyncInit() async {
    await viewModel.fetchAuthors();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: backgroundContainer(),
    );
  }

  Container backgroundContainer() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/bg.jpeg"), fit: BoxFit.cover)),
      child: Column(
        children: [
          titleBar,
          bodyListView(),
        ],
      ),
    );
  }

  Padding get titleBar {
    return Padding(
      padding: const EdgeInsets.only(top: 35.0),
      child: Center(
          child: Text(
            'All Poets',
            textScaleFactor: 2,
          )),
    );
  }

  Flexible bodyListView() {
    return Flexible(
      child: Observer(builder: (context) {
        return viewModel.isLoading
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: viewModel.authorList?.length,
                itemBuilder: (BuildContext context, int index) {
                  return authorListTile(index);
                },
              );
      }),
    );
  }

  ListTile authorListTile(int index) {
    return ListTile(
      title: Text(
        viewModel.authorList?[index] ?? 'null',
        textScaleFactor: 1.2,
      ),
      leading: CircleAvatar(
        backgroundColor: Colors.green,
      ),
      trailing: Icon(Icons.info, color: Colors.black),
    );
  }
}
