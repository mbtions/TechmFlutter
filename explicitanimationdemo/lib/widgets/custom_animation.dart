import 'package:flutter/material.dart';

class CustomAnimation extends StatefulWidget {
  const CustomAnimation({super.key});

  @override
  State<StatefulWidget> createState() {
    return CustomAnimationState();
  }
}

class CustomAnimationState extends State<CustomAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;
  late Animation<Color?> colorAnimation;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5),
    );

    animation = Tween<double>(
      begin: 100,
      end: 200,
    ).animate(animationController);

    colorAnimation = ColorTween(
      begin: Colors.blue,
      end: Colors.red,
    ).animate(animationController);

    animation.addListener(() {
      setState(() {
        // This will trigger a rebuild whenever the animation value changes
      });
      // print('Animation Value: ${animation.value}');
    });

    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   appBar: AppBar(title: Text('Custom Animation')),
    //   body: Center(
    //     child: ElevatedButton(
    //       onPressed: () {
    //         // Trigger your custom animation here
    //         print('Button Pressed');
    //       },
    //       child: Text('Press Me'),
    //     ),
    //   ),
    // );
    return Center(
      child: Container(
        color: colorAnimation.value,
        height: animation.value,
        width: animation.value,
      ),
    );
  }
}


// TASK:
// change color to blue ColorTween