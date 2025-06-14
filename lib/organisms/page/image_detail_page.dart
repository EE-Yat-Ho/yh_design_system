import 'package:flutter/material.dart';
import 'package:yh_design_system/atoms/color/colors.dart';
import 'package:yh_design_system/atoms/font/fonts.dart';
import 'package:yh_design_system/organisms/appbar/appbar.dart';
import 'package:yh_design_system/organisms/collection/horizontal_image_collection.dart';
import 'package:yh_util/image_entity.dart';

final class ImageDetailPage extends StatefulWidget {
  // images: List<ImageEntity>
  // initialIndex: int
  // titleFont: YHFont
  final Map<String, dynamic> map;

  const ImageDetailPage({
    super.key,
    required this.map,
  });

  @override
  ImageDetailPageState createState() => ImageDetailPageState();
}

final class ImageDetailPageState extends State<ImageDetailPage> {
  late PageController _pageController;
  late final List<ImageEntity> _images;
  late final YHFont _titleFont;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _images = (widget.map["images"] as List<ImageEntity>)
        .where((e) => (e.hasRemoteImage || e.tmpImage != null))
        .toList();

    if (widget.map["initialIndex"] != null) {
      _currentIndex = widget.map["initialIndex"] as int;
    }

    if (widget.map["titleFont"] != null) {
      _titleFont = widget.map["titleFont"] as YHFont;
    } else {
      _titleFont = YHFont.regular16;
    }
    _pageController = PageController(initialPage: _currentIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: YHAppBar(
        title: "상세 이미지",
        showBack: false,
        showClose: true,
        rightPadding: 16,
        foregroundColor: YHColor.contentTertiary,
        backgroundColor: YHColor.transparent,
        titleFont: _titleFont,
      ),
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            PageView.builder(
              controller: _pageController,
              itemCount: _images.length,
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              itemBuilder: (context, index) {
                return InteractiveViewer(
                  child: Align(
                    alignment: const Alignment(0.0, -0.2),
                    child: Image.file(
                      _images[index].file,
                      fit: _images[index].fit,
                    ),
                  ),
                );
              },
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(0, 24, 0, 48),
              color: Colors.black.withValues(alpha: 0.7),
              child: HorizontalImageCollection(
                images: _images,
                itemHeight: 56,
                itemWidth: 56,
                selectedIndex: _currentIndex,
                showSelectedBorder: true,
                onTap: (index) {
                  _pageController.jumpToPage(index);
                  setState(() {
                    _currentIndex = index;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
