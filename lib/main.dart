import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends HookWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            children: [
              Text('VOL',
                  style: TextStyle(fontSize: 40, color: Colors.yellow[700])),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [...List.generate(5, (i) => const Vol())],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [...List.generate(5, (i) => const Vol())],
              ),
              Flexible(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Text('アルファ',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.pink)),
                            ...List.generate(5, (i) => const Magic(Colors.pink))
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Text('ベータ',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.blue)),
                            ...List.generate(5, (i) => const Magic(Colors.blue))
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Text('ガンマ',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.purple)),
                            ...List.generate(
                                5, (i) => const Magic(Colors.purple))
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Vol extends HookWidget {
  const Vol({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isActive = useState(false);
    final size = MediaQuery.sizeOf(context).height / 12;

    return InkWell(
      customBorder: const CircleBorder(),
      onTap: () {
        isActive.value = !isActive.value;
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            color: isActive.value ? Colors.yellow : Colors.grey,
            shape: BoxShape.circle,
          ),
          height: size,
          width: size,
        ),
      ),
    );
  }
}

class Magic extends HookWidget {
  final Color color;

  const Magic(
    this.color, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isActive = useState(false);
    final size = MediaQuery.sizeOf(context).height / 10;

    return InkWell(
      customBorder: const CircleBorder(),
      onTap: () {
        isActive.value = !isActive.value;
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            color: isActive.value ? color : Colors.grey,
            shape: BoxShape.circle,
          ),
          height: size,
          width: size,
        ),
      ),
    );
  }
}
