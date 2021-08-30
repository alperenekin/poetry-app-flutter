import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:poem_app/view/author/viewmodel/author_viewmodel.dart';

class AuthorView extends StatefulWidget {
  final String? authorName;

  const AuthorView({Key? key, required this.authorName}) : super(key: key);
  @override
  _AuthorViewState createState() => _AuthorViewState();
}

class _AuthorViewState extends State<AuthorView> {
  final AuthorViewModel viewModel = AuthorViewModelStore();

  @override
  void initState() {
    super.initState();
    viewModel.init();
    asyncInit();
  }

  Future<void> asyncInit() async {
    await viewModel.fetchPoems(widget.authorName!);
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
            'Poems By ${widget.authorName}',
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
          itemCount: viewModel.poemList?.length,
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
        viewModel.poemList?[index]?.title ?? 'null',
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
          viewModel.navigateToPoems();
          print('asf');
        },
      ),    );
  }
}
