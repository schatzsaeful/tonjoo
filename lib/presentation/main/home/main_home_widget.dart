import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tonjoo/utils/nullable_extension.dart';

import '../../../domain/models/tonjoo/tonjoo_dto.dart';
import '../../../utils/async_wrapper.dart';
import '../../common/common_color.dart';
import '../../common/common_decoration.dart';
import '../../common/common_widgets.dart';

class MainNotesList extends StatelessWidget {
  final Async async;
  final Function(UserDto) itemClickListener;
  final VoidCallback onRetry;

  const MainNotesList({
    Key? key,
    required this.async,
    required this.itemClickListener,
    required this.onRetry,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (async.state) {
      case AsyncState.uninitialized:
        return Container();
      case AsyncState.loading:
        return Container(
          margin: const EdgeInsets.only(top: 80, bottom: 80),
          child: const CircularProgressIndicator(),
        );
      case AsyncState.error:
        return Container();
      case AsyncState.success:
        var data = async.data as List<UserDto>;
        data.sort((a, b) => b.id.compareTo(a.id));

        return ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: 7),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                itemClickListener(data[index]);
              },
              child: Card(
                margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                elevation: 1,
                shadowColor: Colors.white.withOpacity(0.4),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CommonNetworkActivityImage(
                        url: data[index].avatar,
                        boxFit: BoxFit.scaleDown,
                        isCircle: true
                    ),
                    CommonWidget.spacer12,
                    Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CommonWidget.spacer8,
                            Text(
                              data[index].username,
                              style: const TextStyle(
                                color: CommonColor.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              data[index].gender,
                              style: const TextStyle(
                                color: CommonColor.darkGrey,
                                fontSize: 12,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            Text(
                              data[index].email,
                              style: const TextStyle(
                                color: CommonColor.darkGrey,
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            CommonWidget.spacer8,
                          ],
                        )
                    ),
                    IconButton(
                      onPressed: () {

                      },
                      splashRadius: 24,
                      icon: const Icon(
                        Icons.close,
                        color: CommonColor.black,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
          itemCount: data.length,
          primary: false,
          shrinkWrap: true,
        );
    }
  }
}

class CommonNetworkActivityImage extends StatelessWidget {
  const CommonNetworkActivityImage({
    Key? key,
    required this.url,
    this.boxFit = BoxFit.cover,
    this.isCircle = false,
  }) : super(key: key);

  final String? url;
  final BoxFit boxFit;
  final bool isCircle;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: 40,
      child: CachedNetworkImage(
        imageUrl: url.orEmpty(),
        fit: boxFit,
        placeholder: (context, url) => CommonWidget.circularIndicator,
        errorWidget: _retryImage,
        imageBuilder: isCircle ? (context, provider) {
          return CircleAvatar(
            backgroundImage: provider,
          );
        } : null,
      ),
    );
  }

  Widget _retryImage(BuildContext context, String url, dynamic error) {
    return Container(
      decoration: CommonDecoration.smallRoundedWhite,
      child: CachedNetworkImage(
        imageUrl: url,
        fit: BoxFit.cover,
        placeholder: (context, url) => CommonWidget.circularIndicator,
        errorWidget: (context, url, error) => Text('Error $error'),
        imageBuilder: isCircle
            ? (context, provider) {
          return CircleAvatar(
            backgroundImage: provider,
          );
        } : null,
      ),
    );
  }
}