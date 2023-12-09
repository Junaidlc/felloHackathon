// import 'package:flutter/material.dart';

// class AdvanceAnimation extends StatefulWidget {
//   const AdvanceAnimation({Key? key});

//   @override
//   State<AdvanceAnimation> createState() => _AdvanceAnimationState();
// }

// class _AdvanceAnimationState extends State<AdvanceAnimation>
//     with TickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<Color?> _colorAnimation;

//   @override
//   void initState() {
//     super.initState();
//     _controller =
//         AnimationController(vsync: this, duration: const Duration(seconds: 2))
//           ..forward();
//     _colorAnimation = TweenSequence<Color?>(
//       <TweenSequenceItem<Color?>>[
//         TweenSequenceItem(
//           tween: ColorTween(begin: Colors.red, end: Colors.blue),
//           weight: 1.0,
//         ),
//         TweenSequenceItem(
//           tween: ColorTween(begin: Colors.blue, end: Colors.green),
//           weight: 1.0,
//         ),
//         TweenSequenceItem(
//           tween: ColorTween(begin: Colors.green, end: Colors.red),
//           weight: 1.0,
//         ),
//       ],
//     ).animate(_controller);
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Color Animation'),
//       ),
//       body: Center(
//         child: AnimatedBuilder(
//           animation: _colorAnimation,
//           builder: (context, child) {
//             return Container(
//               width: 200,
//               height: 200,
//               color: _colorAnimation.value,
//             );
//           },
//         ),
//       ),
//     );
//   }
// }