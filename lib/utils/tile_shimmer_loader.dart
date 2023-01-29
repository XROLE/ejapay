import 'package:flutter/material.dart';

class TileShimmerLoader extends StatelessWidget {
  const TileShimmerLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        height: 35,
        width: 35,
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(.15),
          shape: BoxShape.circle,
        ),
      ),
      title: Container(
        height: 20,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(.15),
        ),
      ),
      subtitle: Container(
        height: 10,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(.15),
        ),
      ),
    );
  }
}
