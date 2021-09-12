import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:poem_app/core/components/background_container.dart';
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

  BackgroundContainer backgroundContainer() {
    return BackgroundContainer(
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
    return Expanded(
      child: Observer(builder: (context) {
        return viewModel.isLoading
            ? Center(child: CircularProgressIndicator())
            : Row(
              children: [
                Flexible(
                  flex: 9,
                  child: authorsListView,
                ),
                Flexible(
                  flex: 1,
                  child: letterPageView,
                )
              ],
            );
      }),
    );
  }

  ListView get authorsListView {
    return ListView.builder(
      itemCount: viewModel.searchedAuthors!.isEmpty ? viewModel.authorList?.length : viewModel.searchedAuthors?.length,
      itemBuilder: (BuildContext context, int index) {
        return authorListTile(index);
      },
    );
  }

  ListTile authorListTile(int index) {
    return ListTile(
      title: Text(
        authorName(index),
        textScaleFactor: 1.2,
      ),
      leading: CircleAvatar(
        backgroundColor: Colors.green,
      ),
      trailing: IconButton(
        icon: Icon(
          Icons.info,
          color: Colors.black,
        ),
        onPressed: () {
          viewModel.navigateToAuthorView(authorName(index));
        },
      ),
    );
  }

  String authorName(int index){
    return viewModel.searchedAuthors!.isEmpty ? (viewModel.authorList?[index] ?? '') : (viewModel.searchedAuthors?[index] ?? '');
  }

  PageView get letterPageView {
    return PageView.builder(
      physics: PageScrollPhysics(),
      onPageChanged: (value) {
        viewModel.changeIndex(value);
        viewModel.findAuthors(viewModel.letterList?[value] ?? '');
      },
      controller: PageController(viewportFraction: 0.1),
      scrollDirection: Axis.vertical,
      itemCount: viewModel.letterList?.length,
      itemBuilder: (context, index) {
        return letterText(index);
      },
    );
  }

  Center letterText(int index) {
    return Center(
        child: index == 0
            ? Icon(
                Icons.wifi_protected_setup,
                color: Colors.black,
              )
            : Observer(builder: (context) {
                return Text(viewModel.letterList?[index] ?? '',
                    style: viewModel.selectedIndex == index
                        ? TextStyle(fontSize: 35, fontWeight: FontWeight.bold)
                        : TextStyle(fontWeight: FontWeight.normal));
              }));
  }
}
