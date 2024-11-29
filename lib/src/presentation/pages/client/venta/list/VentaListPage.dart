import 'package:app_proyecto_pccalderon/src/domain/Utils/Resource.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app_proyecto_pccalderon/src/domain/models/VentaDetalle.dart';
import 'package:app_proyecto_pccalderon/src/presentation/pages/client/venta/list/bloc/VentaListEvent.dart';
import 'package:app_proyecto_pccalderon/src/presentation/pages/client/venta/list/bloc/VentaListState.dart';
import 'package:app_proyecto_pccalderon/src/presentation/pages/client/venta/list/VentaListItem.dart';
import 'package:app_proyecto_pccalderon/src/presentation/pages/client/venta/list/bloc/VentaListBloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class VentaListPage extends StatefulWidget {
  const VentaListPage({super.key});

  @override
  State<VentaListPage> createState() => _VentaListPageState();
}

class _VentaListPageState extends State<VentaListPage> {
  VentaListBloc? _bloc;
  DateTime? _selectedDate;
  List<VentaDetalle> _allVentas = []; // Lista de todas las ventas
  List<VentaDetalle> _filteredVentas = []; // Lista de ventas filtradas

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _bloc?.add(GetVentas());
    });
  }

  // Función para seleccionar una fecha con DatePicker
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        _filterVentasByDate(); // Aplicar filtro después de seleccionar la fecha
      });
    }
  }

  // Función para filtrar las ventas por la fecha seleccionada
  void _filterVentasByDate() {
    if (_selectedDate != null) {
      String selectedDateString =
          "${_selectedDate!.year}-${_selectedDate!.month.toString().padLeft(2, '0')}-${_selectedDate!.day.toString().padLeft(2, '0')}";

      setState(() {
        // Filtramos las ventas de la lista completa (_allVentas)
        _filteredVentas = _allVentas.where((venta) {
          return venta.fecha != null && venta.fecha!.substring(0, 10) == selectedDateString;
        }).toList();
      });
    } else {
      // Si no hay fecha seleccionada, mostrar todas las ventas
      setState(() {
        _filteredVentas = List.from(_allVentas);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    _bloc = BlocProvider.of<VentaListBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de Ventas"),
        actions: [
          // Icono para abrir el DatePicker
          IconButton(
            icon: Icon(Icons.calendar_today),
            onPressed: () {
              _selectDate(context);
            },
          ),
        ],
      ),
      body: BlocListener<VentaListBloc, VentaListState>(
        listener: (context, state) {
          final responseState = state.response;
          if (responseState is Success) {
            if (responseState.data is bool) {
              _bloc?.add(GetVentas()); // Vuelve a obtener las ventas si se recibe un bool
            } else if (responseState.data is List<VentaDetalle>) {
              setState(() {
                // Guardamos todas las ventas
                _allVentas = List.from(responseState.data as List<VentaDetalle>);
                // Filtramos las ventas por fecha si ya está seleccionada
                _filterVentasByDate();
              });
            }
          }
          if (responseState is Error) {
            Fluttertoast.showToast(msg: responseState.message, toastLength: Toast.LENGTH_LONG);
          }
        },
        child: BlocBuilder<VentaListBloc, VentaListState>(
          builder: (context, state) {
            final responseState = state.response;
            if (responseState is Success) {
              // Si hay una fecha seleccionada, filtrar las ventas
              List<VentaDetalle> ventasToDisplay =
                  _filteredVentas.isEmpty ? responseState.data as List<VentaDetalle> : _filteredVentas;

              // Si no hay ventas para mostrar, mostramos el mensaje de "No se realizaron ventas"
              if (_filteredVentas.isEmpty) {
                return Center(
                  child: Text(
                    'No se realizaron ventas en esta fecha.',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                );
              }

              return ListView.builder(
                itemCount: ventasToDisplay.length,
                itemBuilder: (context, index) {
                  return VentaListItem(/*_bloc!,*/ venta: ventasToDisplay[index]);
                },
              );
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
