
import 'package:flutter/material.dart';

import 'package:shopsave/features/domain/entities/mobile_item_entity.dart';
import 'package:shopsave/features/presentation/widgets/profile_widget.dart';

class FvtCardItemWidget extends StatelessWidget {
  final MobileItemEntity mobileListData;
  final VoidCallback onTap;
  const FvtCardItemWidget({Key? key,required this.onTap,required this.mobileListData}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(left: 10,right: 10,bottom: 0,top: 5),
        child: Card(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 110,
            decoration:
            BoxDecoration(borderRadius: BorderRadius.circular(8)),
            child: Container(
              margin: EdgeInsets.symmetric(
                  horizontal: 10, vertical: 10.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(width: 100,child: profileImageWidget(imageUrl:mobileListData.thumbImageURL)),
                  SizedBox(width: 10,),
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
                                    "${mobileListData.name}",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                      "${mobileListData.description}",
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
                                      "Price: ${mobileListData.price}.",
                                      style: TextStyle(fontSize: 14),
                                    ),
                                  ),
                                  Text(
                                    "Rating ${mobileListData.rating}",
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
}
