import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_app/bloc/counter_bloc.dart';

class BlocExamplePageTwo extends StatefulWidget {
  const BlocExamplePageTwo({Key? key}) : super(key: key);

  @override
  _BlocExamplePageTwoState createState() => _BlocExamplePageTwoState();
}

class _BlocExamplePageTwoState extends State<BlocExamplePageTwo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bloc Example TWO'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              context.read<CounterBloc>().state.counter.toString(),
              style: Theme.of(context).textTheme.headline4,
            ),
            BlocBuilder<CounterBloc, CounterState>(
              bloc: context.read<CounterBloc>(),
              builder: (context, state) {
                if (state is CounterInitial) {
                  return const Text('CounterInitial! No data available');
                }

                if (state is CounterChanged) {
                  return Text(
                    state.counter.toString(),
                    style: Theme.of(context).textTheme.headline4,
                  );
                }

                return const Text('click button');
              },
            ),
          ],
        ),
      ),
    );
  }
}
