import 'package:covid_tracker/cubit/pakistan/pakistan_cubit.dart';
import 'package:covid_tracker/widgets/pakistan_data_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PakistanData extends StatefulWidget {
  const PakistanData({super.key});

  @override
  State<PakistanData> createState() => _PakistanDataState();
}

class _PakistanDataState extends State<PakistanData> {
  @override
  void initState() {
    final pakistanData = BlocProvider.of<PakistanCubit>(context);
    if (pakistanData.state.data == null) {
      pakistanData.fetchData();
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Pakistan'),
        ),
        body: BlocBuilder<PakistanCubit, PakistanState>(
          builder: ((context, state) {
            if (state is PakistanLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is PakistanFailure) {
              return const Text('Something Went Wrong');
            } else if (state is PakistanSuccess) {
              return ListView(
                children: [
                  PakistanDataCard(
                    headerString: 'Tested',
                    data: state.data!.tested,
                  ),
                  PakistanDataCard(
                    headerString: 'Critical',
                    data: state.data!.critical,
                  ),
                  PakistanDataCard(
                    headerString: 'Recovered',
                    data: state.data!.recovered,
                  ),
                ],
              );
            } else {
              return const Text('OOps....An error occured..');
            }
          }),
        ),
      ),
    );
  }
}
