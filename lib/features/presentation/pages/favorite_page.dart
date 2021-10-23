import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:shopsave/const.dart';
import 'package:shopsave/features/data/models/mobile_list_model.dart';
import 'package:shopsave/features/presentation/cubit/mobile_fvt/mobile_fvt_cubit.dart';
import 'package:shopsave/features/presentation/widgets/card_item_widget.dart';
import 'package:shopsave/features/presentation/widgets/fvt_card_item_widget.dart';

class FavoriteListPage extends StatefulWidget {
  const FavoriteListPage({Key? key}) : super(key: key);

  @override
  _FavoriteListPageState createState() => _FavoriteListPageState();
}

class _FavoriteListPageState extends State<FavoriteListPage> {

  int _filterValue = -1;

  @override
  void initState() {
    BlocProvider.of<MobileFvtCubit>(context).getAllFvtItems(_filterValue);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MobileFvtCubit,MobileFvtState>(
      builder: (context,fvtState){
        if (fvtState is MobileFvtLoaded){
          return Column(
            children: [
              Expanded(
                child: fvtState.taskData.isEmpty?Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Not added yet favorite",style: TextStyle(fontSize: 16,color: Colors.black.withOpacity(.4)),),
                    SizedBox(height: 4,),
                    Icon(AntDesign.shoppingcart,size: 48,color: Colors.black.withOpacity(.4),),
                  ],
                ):ListView.builder(
                    itemCount: fvtState.taskData.length,
                    itemBuilder: (context, index) {
                      final fvtItem=fvtState.taskData[index];
                      return Slidable(
                        actionPane: SlidableDrawerActionPane(),
                        secondaryActions: [
                          InkWell(
                            onTap: (){
                              BlocProvider.of<MobileFvtCubit>(context).deleteFvtItem(mobileItem: fvtState.taskData[index]).then((value) {
                                BlocProvider.of<MobileFvtCubit>(context).getAllFvtItems(_filterValue);
                              });
                             Future.delayed(Duration(seconds: 1),(){
                               BlocProvider.of<MobileFvtCubit>(context).getAllFvtItems(_filterValue);
                             });
                            },
                            child: Container(
                              height: 50,
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(4)
                              ),
                              child: Row(
                                children: [
                                  Icon(Icons.delete,color: Colors.white,),
                                  Text("Delete",style: TextStyle(color: Colors.white),),
                                ],
                              ),
                            ),
                          ),
                        ],
                        child: FvtCardItemWidget(
                          mobileListData: fvtState.taskData[index],
                          onTap: (){
                            Navigator.pushNamed(context,PageConst.mobilePhoneViewPage,arguments: MobileListModel(
                              thumbImageURL: fvtItem.thumbImageURL,
                              rating: fvtItem.rating,
                              price: fvtItem.price,
                              brand: fvtItem.brand,
                              description: fvtItem.description,
                              name: fvtItem.name,
                              id: fvtItem.itemId,
                            ));
                          },),
                      );
                    }),
              ),
            ],
          );
        }
        if (fvtState is MobileFvtLoading){
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Not added yet favorite",style: TextStyle(fontSize: 16,color: Colors.black.withOpacity(.4)),),
              SizedBox(height: 4,),
              Icon(AntDesign.shoppingcart,size: 48,color: Colors.black.withOpacity(.4),),
              SizedBox(height: 4,),
              Center(
                child: CircularProgressIndicator(),
              )
            ],
          ),
        );
      },
    );
  }
}
