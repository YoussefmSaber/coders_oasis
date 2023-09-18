import 'package:coders_oasis/shared/components/constants.dart';
import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:flutter/material.dart';


  Widget videoItemShimmer() =>
      Card(
        elevation: 0,
        color: Colors.white,
        surfaceTintColor: Colors.white,
        shape: RoundedRectangleBorder(
            side: BorderSide(width: 1, color: gray),
            borderRadius: BorderRadius.circular(8)),
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            children: [
              const FadeShimmer(
                radius: 8,
                width: 120,
                height: 67.5,
                baseColor: Colors.black,
                highlightColor: Colors.black,
                fadeTheme: FadeTheme.light,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    mediumTextShimmer(),
                    SizedBox(height: 16),
                    progressBarShimmer()
                  ],
                ),
              )
            ],
          ),
        ),
      );

  Widget courseItemWithoutDurationShimmer() =>
      Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
            side: BorderSide(width: 1, color: gray),
            borderRadius: BorderRadius.circular(10)),
        surfaceTintColor: Colors.white,
        color: Colors.white,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          bigImageShimmer(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: shortTextShimmer(),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: longTextShimmer(),
          ),
        ]),
      );

  Widget courseItemShimmer() =>
      Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
            side: BorderSide(width: 1, color: gray),
            borderRadius: BorderRadius.circular(10)),
        surfaceTintColor: Colors.white,
        color: Colors.white,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          bigImageShimmer(),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: mediumTextShimmer(),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: shortTextShimmer(),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: longTextShimmer(),
          ),
        ]),
      );

  Widget shortTextShimmer() =>
      FadeShimmer(
        width: 100,
        height: 20,
        radius: 5,
        baseColor: Colors.black,
        highlightColor: defaultColor,
        fadeTheme: FadeTheme.light,
        millisecondsDelay: 200,
      );

  Widget mediumTextShimmer() =>
      const FadeShimmer(
        width: 250,
        height: 20,
        radius: 5,
        baseColor: Colors.black,
        highlightColor: Colors.black,
        millisecondsDelay: 100,
        fadeTheme: FadeTheme.light,
      );

  Widget longTextShimmer() =>
      const FadeShimmer(
        width: double.infinity,
        height: 20,
        radius: 5,
        baseColor: Colors.black,
        highlightColor: Colors.black,
        millisecondsDelay: 300,
        fadeTheme: FadeTheme.light,
      );

  Widget multiLongTextShimmer() =>
      ListView.separated(
          itemBuilder: (_, index) =>
          const FadeShimmer(
            width: double.infinity,
            height: 20,
            radius: 5,
            millisecondsDelay: 200,
            baseColor: Colors.black,
            highlightColor: Colors.black,
            fadeTheme: FadeTheme.light,
          ),
          separatorBuilder: (_, index) =>
          const SizedBox(
            height: 8,
          ),
          itemCount: 4);

  Widget progressBarShimmer() => const FadeShimmer(
    width: 250,
        height: 15,
        radius: 10,
        baseColor: Colors.black,
        highlightColor: Colors.black,
        fadeTheme: FadeTheme.light,);

  Widget bigImageShimmer() =>
      const ClipRRect(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10), topRight: Radius.circular(10)),
        child: FadeShimmer(
          width: double.infinity,
          height: 200,
          baseColor: Colors.blue,
          millisecondsDelay: 0,
          highlightColor: Colors.black,
          fadeTheme: FadeTheme.light,
          radius: 0,
        ),
      );

