import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tonjoo/utils/nullable_extension.dart';

import '../../../utils/async_wrapper.dart';
import '../../common/common_color.dart';
import '../../common/common_decoration.dart';
import '../../common/common_widgets.dart';

class MainNotesList extends StatelessWidget {
  final Async async;
  final VoidCallback itemClickListener;
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
        var data = async.data as List<String>;
        data.sort((a, b) => b.compareTo(a));

        return ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: 7),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                itemClickListener();
              },
              child: Card(
                margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                elevation: 1,
                shadowColor: Colors.white.withOpacity(0.4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommonNetworkActivityImage(
                      url: data[index],
                      boxFit: BoxFit.scaleDown,
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 60,
                      child: Row(
                        children: [
                          Expanded(
                              child: Container(
                                color: CommonColor.white,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8, top: 8, bottom: 2),
                                      child: Text(
                                        data[index],
                                        style: const TextStyle(
                                          color: CommonColor.orange,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8, bottom: 8),
                                      child: Text(
                                        data[index],
                                        style: const TextStyle(
                                          color: CommonColor.white,
                                          fontSize: 12,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                          ),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 8, top: 8, bottom: 2),
                                  child: Text(
                                    data[index],
                                    style: const TextStyle(
                                      color: CommonColor.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8, bottom: 8),
                                  child: Text(
                                    data[index],
                                    style: const TextStyle(
                                      color: CommonColor.grey,
                                      fontSize: 12,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    )
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
    return Container(
      constraints: const BoxConstraints(
          minHeight: 180, minWidth: double.infinity
      ),
      child: CachedNetworkImage(
        imageUrl: url.orEmpty(),
        fit: boxFit,
        placeholder: (context, url) => CommonWidget.circularIndicator,
        errorWidget: _retryImage,
        imageBuilder: isCircle ? (context, provider) {
          return CircleAvatar(
            backgroundImage: provider,
          );
        }
            : null,
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
        }
            : null,
      ),
    );
  }
}