import 'package:app_proyecto_pccalderon/src/presentation/pages/client/cliente/create/bloc/ClienteCreateBloc.dart';
import 'package:app_proyecto_pccalderon/src/presentation/pages/client/cliente/create/bloc/ClienteCreateEvent.dart';
import 'package:app_proyecto_pccalderon/src/presentation/pages/client/cliente/create/bloc/ClienteCreateState.dart';
import 'package:app_proyecto_pccalderon/src/presentation/utils/BlocFormItem.dart';
import 'package:app_proyecto_pccalderon/src/presentation/widgets/DefaultTextField.dart';
import 'package:app_proyecto_pccalderon/src/presentation/widgets/DefaultIconBack.dart';
import 'package:flutter/material.dart';

class ClienteCreateContent extends StatelessWidget {
  final ClienteCreateBloc? bloc;
  final ClienteCreateState state;

  ClienteCreateContent(this.bloc, this.state, {super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
        key: state.formKey,
        child: Stack(
          alignment: Alignment.center,
          children: [
            _backgroundImage(context),
            Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 35),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _headerText(),
                      SizedBox(height: 20),
                      _textFieldName(),
                      SizedBox(height: 10),
                      _dropdownTipoDocumento(),
                      SizedBox(height: 10),
                      _textFieldNumDocumento(),
                      SizedBox(height: 10),
                      _textFieldTelefono(),
                      SizedBox(height: 20),
                      _submitButton(),
                    ],
                  ),
                ),
              ),
            ),
            DefaultIconback(left: 15, top: 50),
          ],
        ));
  }

  Widget _headerText() {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Text(
        'NUEVO CLIENTE',
        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
      ),
    );
  }

  Widget _textFieldName() {
    return DefaultTextField(
      label: 'Nombre del cliente',
      icon: Icons.person,
      onChanged: (text) {
        bloc?.add(NameChanged(nombre: BlocFormItem(value: text)));
      },
      validator: (value) {
        return state.nombre.error;
      },
      color: Colors.white,
    );
  }

  Widget _dropdownTipoDocumento() {
    return DropdownButtonFormField<String>(
      value: state.tipoDocumento.value.isNotEmpty ? state.tipoDocumento.value : null,
      decoration: InputDecoration(
        labelText: 'Tipo de documento',
        labelStyle: TextStyle(color: Colors.white), // Estilo de la etiqueta en blanco
        prefixIcon: Icon(Icons.description, color: Colors.white), // Ícono en blanco
        filled: true,
        fillColor: Colors.transparent,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.white), // Borde blanco
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.white), // Borde blanco al estar deshabilitado
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.white), // Borde blanco al estar enfocado
        ),
      ),
      dropdownColor: Colors.black, // Fondo del menú desplegable en negro
      style: TextStyle(color: Colors.white), // Estilo del texto de las opciones en blanco
      items: ['NIT', 'CI', 'PASAPORTE'].map((String option) {
        return DropdownMenuItem<String>(
          value: option,
          child: Text(option),
        );
      }).toList(),
      onChanged: (value) {
        bloc?.add(TipoDocumentoChanged(tipoDocumento: BlocFormItem(value: value ?? '')));
      },
      validator: (value) {
        return value == null || value.isEmpty ? 'Selecciona un tipo de documento' : null;
      },
    );
  }

  Widget _textFieldNumDocumento() {
    return DefaultTextField(
      label: 'Número de documento',
      icon: Icons.confirmation_number,
      onChanged: (text) {
        bloc?.add(NumDocumentoChanged(numDocumento: BlocFormItem(value: text)));
      },
      validator: (value) {
        return state.numDocumento.error;
      },
      color: Colors.white,
    );
  }

  Widget _textFieldTelefono() {
    return DefaultTextField(
      label: 'Teléfono',
      icon: Icons.phone,
      onChanged: (text) {
        bloc?.add(TelefonoChanged(telefono: BlocFormItem(value: text)));
      },
      validator: (value) {
        return state.telefono.error;
      },
      color: Colors.white,
    );
  }

  Widget _submitButton() {
    return Container(
      alignment: Alignment.centerRight,
      child: FloatingActionButton(
        onPressed: () {
          if (state.formKey!.currentState!.validate()) {
            bloc?.add(FormSubmit());
          }
        },
        backgroundColor: const Color.fromARGB(255, 232, 221, 126),
        child: Icon(
          Icons.check,
          color: Colors.black87,
        ),
      ),
    );
  }

  Widget _backgroundImage(BuildContext context) {
    return Image.asset(
      'assets/img/background2.jpg',
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      fit: BoxFit.cover,
      color: Color.fromRGBO(168, 165, 120, 0.698),
      colorBlendMode: BlendMode.darken,
    );
  }
}