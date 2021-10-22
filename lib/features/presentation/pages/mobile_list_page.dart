import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopsave/const.dart';
import 'package:shopsave/features/presentation/cubit/mobile_list/mobile_list_cubit.dart';
import 'package:shopsave/features/presentation/widgets/card_item_widget.dart';
import 'package:shopsave/features/presentation/widgets/profile_widget.dart';

class MobileListPage extends StatelessWidget {
  const MobileListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MobileListCubit, MobileListState>(
        builder: (context, mobileState) {
      if (mobileState is MobileListLoaded) {
        return Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: mobileState.data.length,
                  itemBuilder: (context, index) {
                    return CardItemWidget(
                      mobileListData: mobileState.data[index],
                      onTap: () {

                        Navigator.pushNamed(context, PageConst.mobilePhoneViewPage,arguments: mobileState.data[index]);
                      },
                    );
                  }),
            )
          ],
        );
      }
      return Column(
        children: [
          Expanded(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          ),
        ],
      );
    });
  }
}
