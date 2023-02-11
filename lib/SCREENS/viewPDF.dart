
import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

import '../Constants/constants.dart';
import '../adsController/adscontroller.dart';

class PDFview extends StatefulWidget {
  String pdfLink;
  String index;
  bool nightMode;
  PDFview(
      {required this.pdfLink, required this.index, required this.nightMode});

  @override
  State<PDFview> createState() => _PDFviewState();
}

class _PDFviewState extends State<PDFview> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    adController().createBannerAd4();
  }

  bool nightMode = false;
  @override
  Widget build(BuildContext context) {
    print("${widget.nightMode == null ? nightMode : widget.nightMode}");
    return Scaffold(
      floatingActionButton: Padding(
        padding: EdgeInsets.only(bottom: 70.0.h),
        child: SizedBox(
          height: 110.w,
          width: 110.w,
          child: SpeedDial(
            spaceBetweenChildren: 10,
            childPadding: EdgeInsets.only(right: 10.w),
            childrenButtonSize: Size(110.w, 100.w),
            renderOverlay: false,
            child: Image(
              image: AssetImage("assets/modes.png"),
            ),
            children: [
              SpeedDialChild(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PDFview(
                        index: widget.index,
                        pdfLink: widget.pdfLink,
                        nightMode: true,
                      ),
                    ),
                  );
                },
                child: SizedBox(
                  height: 180.w,
                  width: 160.w,
                  child: Image(
                    image: AssetImage("assets/owl.png"),
                  ),
                ),
              ),
              SpeedDialChild(
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PDFview(
                          index: widget.index,
                          pdfLink: widget.pdfLink,
                          nightMode: false,
                        ),
                      ));
                },
                child: SizedBox(
                  height: 120.w,
                  width: 120.w,
                  child: Image(
                    image: AssetImage("assets/sun.png"),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 0, 18, 211),
        title: Text(
          overflow: TextOverflow.ellipsis,
          "${widget.index}",
          style: SET_FONT_STYLE(
              20, FontWeight.w500, Color.fromARGB(255, 255, 255, 255)),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
                // height: SCREEN_HEIGHT(context),
                // width: SCREEN_WIDTH(context),
                child: PDF(
              enableSwipe: true,
              pageFling: false,
              autoSpacing: false,
              pageSnap: false,
              nightMode:
                  widget.nightMode == null ? nightMode : widget.nightMode,
              onError: (error) {
                Get.snackbar("PDF Error",
                    "Failed to Load your PDF please try after sometime");
              },
              onPageError: (page, error) {
                Get.snackbar("Page Error",
                    "Failed to Load your This page please try after sometime");
              },
            ).cachedFromUrl(
              '${widget.pdfLink}',
              placeholder: (progress) => Center(child: Text('$progress %')),
              errorWidget: (error) => Center(child: Text(error.toString())),
            )

                // SfPdfViewer.network(
                //   canShowScrollStatus: true,
                //   enableDocumentLinkAnnotation: true,
                //   enableDoubleTapZooming: true,
                //   enableTextSelection: true,
                //   pageLayoutMode: PdfPageLayoutMode.continuous,
                //   onDocumentLoadFailed: (details) {
                //     Get.snackbar("PDF Error", "Failed to Load your PDF please try after sometime");
                //   },
                //   '${widget.pdfLink}',
                // ),
                ),
          ),
          SizedBox(
            height: 50.h,
            child: AdWidget(ad: bannerAd4!),
          ),
        ],
      ),
    );
  }
}
