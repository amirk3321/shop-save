import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopsave/features/data/models/mobile_list_model.dart';
import 'package:shopsave/features/domain/entities/mobile_item_entity.dart';
import 'package:shopsave/features/presentation/cubit/mobile_list_images/mobile_list_images_cubit.dart';
import 'package:shopsave/features/presentation/widgets/profile_widget.dart';
import 'package:shopsave/features/presentation/widgets/slide_image_widget.dart';

class MobilePhoneViewPage extends StatefulWidget {
  final MobileListModel? mobileItem;

  const MobilePhoneViewPage({Key? key, this.mobileItem}) : super(key: key);

  @override
  _MobilePhoneViewPageState createState() => _MobilePhoneViewPageState();
}

class _MobilePhoneViewPageState extends State<MobilePhoneViewPage> {
  @override
  void initState() {
    BlocProvider.of<MobileListImagesCubit>(context)
        .getMobileListImages(MobileItemEntity(itemId: widget.mobileItem!.id));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mobile Phone"),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 8,
            ),
            _slider(),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text(
                  "${widget.mobileItem!.name}",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "${widget.mobileItem!.brand}",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
                )
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            Expanded(
                child: Text(
              "${widget.mobileItem!.description}",
              maxLines: 10,
              overflow: TextOverflow.ellipsis,
            ))
          ],
        ),
      ),
    );
  }

  Widget _slider() {
    return BlocBuilder<MobileListImagesCubit, MobileListImagesState>(
        builder: (context, imageState) {
      if (imageState is MobileListImagesLoaded) {
        return Stack(
          children: [

            CarouselSlider(
              options: CarouselOptions(
                height: 250.0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: false,
                enlargeCenterPage: true,
                aspectRatio: 2.0,
                initialPage: 0,
              ),
              items: imageState.data.map((item) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(color: Colors.grey.withOpacity(.2)),
                      child: slideImageWidget(imageUrl: item.url),
                    );
                  },
                );
              }).toList(),
            ),
            Container(
              height: 250.0,
              alignment: Alignment.bottomCenter,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Price: ${widget.mobileItem!.price}"),
              ),
            ),
          ],
        );
      }
      return Container(
          height: 250.0,
          child: Center(
            child: CircularProgressIndicator(),
          ));
    });
  }
}
