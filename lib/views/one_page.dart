import 'package:flutter/material.dart';
import 'package:state_management/controllers/posts_controller.dart';
import 'package:state_management/widgets/custom_button_widget.dart';

class OnePage extends StatefulWidget {
  const OnePage({super.key});

  @override
  State<OnePage> createState() => _OnePageState();
}

class _OnePageState extends State<OnePage> {
  final PostController _controller = PostController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedBuilder(
              animation:
                  Listenable.merge([_controller.posts, _controller.inLoader]),
              builder: (_, __) => _controller.inLoader.value
                  ? const CircularProgressIndicator()
                  : ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: _controller.posts.value.length,
                      itemBuilder: (_, idx) => ListTile(
                        title: Text(_controller.posts.value[idx].title),
                      ),
                    ),
            ),
            const SizedBox(
              height: 10,
            ),
            CustomButtonWidget(
              onPressed: () => _controller.callAPI(),
              title: 'CUSTOM BTN',
            ),
          ],
        ),
      )),
    );
  }
}
