import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/views/home/home_section.dart';

class SectionI extends ConsumerWidget {
  const SectionI({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    return Container(
      width: double.infinity,
      height: 82,
      margin: EdgeInsets.all(9),
      child: CategorySection(),
    );
  }
}
