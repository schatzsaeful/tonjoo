class CommonBannerDto {
  final List<CommonBannerImageDto> images;
  final int slideshowDuration;

  const CommonBannerDto({
    this.images = const [],
    this.slideshowDuration = 0,
  });
}

class CommonBannerImageDto {
  final String imgName;
  final String imgSrc;
  final String url;

  const CommonBannerImageDto({
    this.imgName = '',
    this.imgSrc = '',
    this.url = '',
  });

  @override
  String toString() {
    return 'CommonBannerImageDto{imgName: $imgName, imgSrc: $imgSrc, url: $url}';
  }
}
