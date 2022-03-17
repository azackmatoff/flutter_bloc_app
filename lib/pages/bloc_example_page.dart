import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_app/bloc/counter_bloc.dart';
import 'package:flutter_bloc_app/pages/bloc_example_page_two.dart';

class BlocExamplePage extends StatefulWidget {
  const BlocExamplePage({Key? key}) : super(key: key);

  @override
  _BlocExamplePageState createState() => _BlocExamplePageState();
}

class _BlocExamplePageState extends State<BlocExamplePage> {
  @override
  Widget build(BuildContext mainContext) {
    log('build.....');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bloc Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            const SizedBox(height: 25),
            BlocBuilder<CounterBloc, CounterState>(
              builder: (context, state) {
                if (state is CounterInitial) {
                  return const Text('CounterInitial! No data available');
                }

                if (state is CounterChanged) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BlocProvider.value(
                            value: mainContext.read<CounterBloc>(),
                            child: const BlocExamplePageTwo(),
                          ),
                        ),
                      );
                    },
                    child: Text(
                      state.counter.toString(),
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  );
                }

                return const Text('click button');
              },
            ),
            const SizedBox(height: 55),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    mainContext.read<CounterBloc>().add(IncrementEvent());
                  },
                  child: const Icon(Icons.add),
                ),
                TextButton(
                  onPressed: () {
                    mainContext.read<CounterBloc>().add(DecrementEvent());
                  },
                  child: const Icon(Icons.delete),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
