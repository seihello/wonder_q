import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'questions.dart';
import 'dart:math' as math;

final questionProvider = StateProvider<String>((ref) {
  return Questions.questions[0];
});

class QuestionWidget extends ConsumerWidget {
  const QuestionWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final question = ref.watch(questionProvider);

    final List<Widget> columnChildren = [];
    columnChildren.add(Image.asset('assets/img/chat.jpg', width: 100, height: 100)); // Image.network('https://flagsapi.com/BE/flat/64.png'),
    columnChildren.add(const Text(
      "WonderQ",
      style: TextStyle(
        fontSize: 32
      ),
    ));
    columnChildren.add(Text(question));

    columnChildren.add(ElevatedButton(
      onPressed: () {
        final notifier = ref.read(questionProvider.notifier);
        notifier.state = Questions.questions[math.Random().nextInt(Questions.questions.length)];
      },
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.fromLTRB(30, 20, 30, 20),
        // backgroundColor: Colors.red
      ),
      child: const Text("Next Question")
    ));

    final column = Column(
      // mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: columnChildren
    );

    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(20),
        child: column,
      ),
    );
  }
}