import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopsave/features/data/models/mobile_list_model.dart';
import 'package:shopsave/features/data/models/mobile_model.dart';
import 'package:shopsave/features/domain/entities/mobile_item_entity.dart';
import 'package:shopsave/features/presentation/cubit/mobile_fvt/mobile_fvt_cubit.dart';
import 'package:shopsave/features/presentation/cubit/mobile_list/mobile_list_cubit.dart';
import 'package:shopsave/features/presentation/widgets/profile_widget.dart';

class CardItemWidget extends StatefulWidget {
  final VoidCallback onTap;
  final MobileListModel? mobileListData;

  const CardItemWidget({Key? key, required this.onTap, this.mobileListData})
      : super(key: key);

  @override
  _CardItemWidgetState createState() => _CardItemWidgetState();
}

class _CardItemWidgetState extends State<CardItemWidget> {


  @override
  void initState() {
    BlocProvider.of<MobileFvtCubit>(context).getAllFvtItems(-1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MobileFvtCubit, MobileFvtState>(
        builder: (context, fvtState) {
      if (fvtState is MobileFvtLoading) {
        return Center(
          child: CircularProgressIndicator(),
        );
      }
      if (fvtState is MobileFvtLoaded) {
        return InkWell(
          onTap: widget.onTap,
          child: Container(
            margin: EdgeInsets.only(left: 10, right: 10, bottom: 0, top: 5),
            child: Card(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 110,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(8)),
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                          width: 100,
                          child: profileImageWidget(
                              imageUrl: widget.mobileListData!.thumbImageURL)),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "${widget.mobileListData!.name}",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      InkWell(
                                          onTap: () {
                                            final item = fvtState.taskData
                                                .firstWhere(
                                                    (element) =>
                                                        element.itemId ==
                                                        widget.mobileListData!.id,
                                                    orElse: () =>
                                                        MobileModel());

                                            if (item.itemId ==
                                                widget.mobileListData!.id) {
                                              BlocProvider.of<MobileFvtCubit>(
                                                      context)
                                                  .deleteFvtItem(
                                                      mobileItem: item);
                                            } else {
                                              BlocProvider.of<MobileFvtCubit>(
                                                      context)
                                                  .addFvtItem(
                                                      mobileItem:
                                                          MobileItemEntity(
                                                itemId: widget.mobileListData!.id,
                                                isFvt: true,
                                                name: widget.mobileListData!.name,
                                                description:
                                                    widget.mobileListData!.description,
                                                brand: widget.mobileListData!.brand,
                                                price: widget.mobileListData!.price,
                                                rating: widget.mobileListData!.rating,
                                                thumbImageURL: widget.mobileListData!
                                                    .thumbImageURL,
                                              ));
                                            }

                                            BlocProvider.of<MobileListCubit>(
                                                context)
                                                .refreshAfterAddingToFav();

                                            BlocProvider.of<MobileFvtCubit>(
                                                context)
                                                .refreshAfterAddingToFav();
                                            setState(() {});

                                          },
                                          child: Icon(
                                            Icons.favorite_border,
                                            color: fvtState.taskData
                                                        .firstWhere(
                                                            (element) =>
                                                                element
                                                                    .itemId ==
                                                                widget.mobileListData!
                                                                    .id,
                                                            orElse: () =>
                                                                MobileModel())
                                                        .itemId ==
                                                    widget.mobileListData!.id
                                                ? Colors.red
                                                : Colors.black,
                                          ))
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          "${widget.mobileListData!.description}",
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(fontSize: 14),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 18),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          "Price: ${widget.mobileListData!.price}.",
                                          style: TextStyle(fontSize: 14),
                                        ),
                                      ),
                                      Text(
                                        "Rating ${widget.mobileListData!.rating}",
                                        style: TextStyle(fontSize: 14),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      }
      return Center(
        child: CircularProgressIndicator(),
      );
    });
  }
}
