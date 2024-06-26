// ignore_for_file:

import 'dart:io';

import 'package:flutter/material.dart';

import 'package:markdown_widget/markdown_widget.dart';

import 'package:carousel_slider/carousel_slider.dart';

import 'package:general_lib_flutter/general_lib_flutter.dart';

// import 'widget.dart';

SpanNodeGeneratorWithTag imagesGeneratorWithTag = SpanNodeGeneratorWithTag(
  // <images src="https://www.youtube.com/watch?v=HjgD6ZhSFIA">
  tag: "images",
  generator: (e, config, visitor) {
    return ImagesNode(e.attributes);
  },
);

class ImagesNode extends SpanNode {
  final Map<String, String> attribute;

  ImagesNode(this.attribute);

  @override
  InlineSpan build() {
    double? width;
    double? height;
    if (attribute['width'] != null) {
      width = double.tryParse(attribute['width'] ?? "0");
    }
    if (attribute['height'] != null) {
      height = double.tryParse(attribute['height'] ?? "0");
    }

    List<String> images = (attribute['src'] ?? "").split(" ");

    return WidgetSpan(
      child: SizedBox(
          height: height, width: width, child: ImagesWidget(images: images)),
    );
  }
}

class ImagesWidget extends StatefulWidget {
  final List<String> images;
  const ImagesWidget({
    super.key,
    required this.images,
  });

  @override
  State<ImagesWidget> createState() => _ImagesWidgetState();
}

class _ImagesWidgetState extends State<ImagesWidget> {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      options: CarouselOptions(
        height: context.width * 0.55,
        aspectRatio: 16 / 9,
        viewportFraction: 0.8,
        initialPage: 0,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: false,
        autoPlayInterval: const Duration(seconds: 3),
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: true,
        enlargeFactor: 0.3,
        onPageChanged: (index, reason) {},
        scrollDirection: Axis.horizontal,
      ),
      itemCount: widget.images.length,
      itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) {
        String image_data = widget.images[itemIndex];
        Image image = () {
          if (RegExp(r"^(http(s)?:)", caseSensitive: false)
              .hasMatch(image_data)) {
            return Image.network(
              image_data,
            );
          }
          if (RegExp(r"^(assets|packages)", caseSensitive: false)
              .hasMatch(image_data)) {
            return Image.asset(
              image_data,
            );
          }
          return Image.file(File(image_data));
        }();
        return Container(
          width: double.maxFinite,
          height: context.width * 0.55,
          margin: const EdgeInsets.symmetric(
            vertical: 10,
            // horizontal: 20
          ),
          decoration: BoxDecoration(
            color: context.theme.dialogBackgroundColor,
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(color: Colors.black12, blurRadius: 10),
              BoxShadow(color: Colors.black12, blurRadius: 10),
              BoxShadow(color: Colors.black12, blurRadius: 10),
            ],
            image: DecorationImage(
              fit: BoxFit.fill,
              image: image.image,
            ),
          ),
          clipBehavior: Clip.antiAlias,
          child: MaterialButton(
            padding: const EdgeInsets.symmetric(
              vertical: 25,
              horizontal: 20,
            ),
            onPressed: () async {
              Navigator.push(
                context,
                PageRouteBuilder(
                  opaque: false,
                  barrierColor: Colors.black,
                  pageBuilder: (BuildContext context, _, __) {
                    return FullScreenPage(
                      dark: true,
                      child: image,
                    );
                  },
                ),
              );
            },
          ),
        );
      },
    );
  }
}

class FullScreenPage extends StatefulWidget {
  const FullScreenPage({
    super.key,
    required this.child,
    required this.dark,
  });

  final Image child;
  final bool dark;

  @override
  FullScreenPageState createState() => FullScreenPageState();
}

class FullScreenPageState extends State<FullScreenPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.dark ? Colors.black : Colors.white,
      body: Stack(
        children: [
          Stack(
            children: [
              AnimatedPositioned(
                duration: const Duration(milliseconds: 333),
                curve: Curves.fastOutSlowIn,
                top: 0,
                bottom: 0,
                left: 0,
                right: 0,
                child: InteractiveViewer(
                  panEnabled: true,
                  minScale: 0.5,
                  maxScale: 4,
                  child: widget.child,
                ),
              ),
            ],
          ),
          SafeArea(
            child: Align(
              alignment: Alignment.topLeft,
              child: MaterialButton(
                padding: const EdgeInsets.all(15),
                elevation: 0,
                color: widget.dark ? Colors.black12 : Colors.white70,
                highlightElevation: 0,
                minWidth: double.minPositive,
                height: double.minPositive,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
                onPressed: () => Navigator.of(context).pop(),
                child: Icon(
                  Icons.arrow_back,
                  color: widget.dark ? Colors.white : Colors.black,
                  size: 25,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
