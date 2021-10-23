import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:shopsave/features/presentation/cubit/mobile_fvt/mobile_fvt_cubit.dart';
import 'package:shopsave/features/presentation/cubit/mobile_list/mobile_list_cubit.dart';
import 'package:shopsave/features/presentation/pages/favorite_page.dart';
import 'package:shopsave/features/presentation/pages/mobile_list_page.dart';
import 'package:shopsave/features/presentation/widgets/customTabBar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> get pages => [
        MobileListPage(),
        FavoriteListPage(),
      ];

  int _filterValue = -1;


  PageController _pageController = PageController(initialPage: 0);
  int _currentPageIndex = 0;

  @override
  void initState() {
    BlocProvider.of<MobileListCubit>(context).getMobileList(_filterValue);
    BlocProvider.of<MobileFvtCubit>(context).openDatabase();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text("Mobile phone"),
        elevation: 0.0,
        actions: [
          InkWell(
            onTap: (){
              _filterAlert(context);
            },
            child: Container(
              margin: EdgeInsets.only(right: 10),
              child: Icon(
                MaterialCommunityIcons.filter_variant,
              ),
            ),
          )
        ],
      ),
      body: Container(
        child: Column(
          children: [
            CustomTabBar(
              index: _currentPageIndex,
              tabClickListener: (index) {
                print(index);
                _currentPageIndex = index;
                _pageController.jumpToPage(index);
              },
            ),
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _currentPageIndex = index;
                  });
                },
                itemCount: pages.length,
                itemBuilder: (_, index) {
                  return pages[index];
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  _filterAlert(BuildContext context) {


    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      contentPadding: EdgeInsets.zero,
      content: StatefulBuilder(builder: (BuildContext context, void Function(void Function()) setState) {
        return Container(
          height: 175,
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: _myRadioButton(value: 0,title: "Price low to high",onChanged: (value){
                      setState((){
                        _filterValue=value!;
                      });
                      BlocProvider.of<MobileListCubit>(context).getMobileList(value!);
                      BlocProvider.of<MobileFvtCubit>(context).getAllFvtItems(value);
                    }),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: _myRadioButton(value: 1,title: "Price high to low",onChanged: (value){
                      setState((){
                        _filterValue=value!;
                      });
                      BlocProvider.of<MobileListCubit>(context).getMobileList(value!);
                      BlocProvider.of<MobileFvtCubit>(context).getAllFvtItems(value);
                    }),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: _myRadioButton(value: 2,title: "Price Rating 5-1",onChanged: (value){
                      setState((){
                        _filterValue=value!;
                      });
                      BlocProvider.of<MobileListCubit>(context).getMobileList(value!);
                      BlocProvider.of<MobileFvtCubit>(context).getAllFvtItems(value);
                    }),
                  ),
                ],
              ),

            ],
          ),
        );
      },),
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
  Widget _myRadioButton({String? title, required int value, Function(int? value)? onChanged}) {
    return RadioListTile(
      value: value,
      groupValue: _filterValue,
      onChanged: onChanged,
      title: Text("$title"),
    );
  }
}
