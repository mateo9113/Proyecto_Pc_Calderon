import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/AdminProductAddSNBloc.dart';
import 'bloc/AdminProductAddSNEvent.dart';
import 'bloc/AdminProductAddSNState.dart';

class AdminProductAddSNContent extends StatelessWidget {
  const AdminProductAddSNContent({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<AdminProductAddSNBloc>(context);

    return BlocBuilder<AdminProductAddSNBloc, AdminProductAddSNState>(
      builder: (context, state) {
        if (state.loading) {
          return const Center(child: CircularProgressIndicator());
        }

        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text(
                "Agregar SN para el producto con EAN: ${state.codEAN}",
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: state.series.length,
                  itemBuilder: (context, index) {
                    return TextFormField(
                      decoration: InputDecoration(
                        labelText: "SN ${index + 1}",
                        border: const OutlineInputBorder(),
                      ),
                      initialValue: state.series[index],
                      onChanged: (value) {
                        bloc.add(SNChangedEvent(index: index, sn: value));
                      },
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  bloc.add(const AddSNEvent());
                },
                child: const Text("Guardar SNs"),
              ),
              if (state.success)
                const Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Text("SNs agregados correctamente", style: TextStyle(color: Colors.green)),
                ),
            ],
          ),
        );
      },
    );
  }
}
