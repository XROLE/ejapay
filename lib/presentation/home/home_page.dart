import 'package:ejapay/presentation/base/base_view.dart';
import 'package:ejapay/presentation/home/home_view_model.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BaseView<HomeViewModel>(
            model: HomeViewModel(),
            builder: (context, model, _) {
              return  Center(
                child: InkWell(
                  onTap: () => model.handleClick(),
                  child: const Text("New home page")),
              );
            }));
  }
}
