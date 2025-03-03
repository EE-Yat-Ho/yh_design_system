import 'package:flutter/material.dart';
import 'package:yh_design_system/atoms/color/colors.dart';
import 'package:yh_design_system/organisms/appbar/appbar.dart';
import 'package:yh_design_system/organisms/collection/horizontal_image_collection.dart';
import 'package:yh_util/image_entity.dart';

class ImageDetailPage extends StatefulWidget {
  final List<ImageEntity> images;
  final int initialIndex;

  const ImageDetailPage({
    super.key,
    required this.images,
    this.initialIndex = 0,
  });

  @override
  ImageDetailPageState createState() => ImageDetailPageState();
}

class ImageDetailPageState extends State<ImageDetailPage> {
  late PageController _pageController;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
    _pageController = PageController(initialPage: widget.initialIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const YHAppBar(
        title: "상세 이미지",
        showBack: false,
        showClose: true,
        rightPadding: 16,
        foregroundColor: YHColor.contentTertiary,
        backgroundColor: YHColor.transparent,
      ),
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            PageView.builder(
              controller: _pageController,
              itemCount: widget.images.length,
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
                      widget.images[index].file,
                      fit: widget.images[index].fit,
                    ),
                  ),
                );
              },
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(0, 24, 0, 48),
              color: Colors.black.withValues(alpha: 0.7),
              child: HorizontalImageCollection(
                images: widget.images,
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
