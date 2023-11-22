import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:gym/widgets/maquina.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// Asegúrate de importar tu archivo utils.dart aquí

class AgendamientoMaquina extends StatefulWidget {
  final Maquina maquina;

  AgendamientoMaquina({required this.maquina});

  @override
  _AgendamientoMaquinaState createState() => _AgendamientoMaquinaState();
}

class _AgendamientoMaquinaState extends State<AgendamientoMaquina> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  List<String> _availableHours = []; // Lista de horas disponibles
  DateTime kFirstDay = DateTime(
      2023, 1, 1); // Ejemplo: la primera fecha permitida en el calendario
  DateTime kLastDay = DateTime(2023, 12, 31);  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agendamiento Maquina - ${widget.maquina.nombre}'),
      ),
      body: Column(
        children: [
          TableCalendar(
            firstDay: kFirstDay,
            lastDay: kLastDay,
            focusedDay: _focusedDay,
            calendarFormat: _calendarFormat,
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDay, day);
            },
            onDaySelected: (selectedDay, focusedDay) {
              if (!isSameDay(_selectedDay, selectedDay)) {
                horasDiponiblesMaquinaService(selectedDay,widget.maquina.nombre).then((horas) {
                  setState(() {
                    _selectedDay = selectedDay;
                    _focusedDay = focusedDay;
                    _availableHours = horas;
                  });
                }).catchError((error) {
                  // Manejar el error si es necesario
                  print('Error al obtener horas disponibles: $error');
                });
              }
            },
            onFormatChanged: (format) {
              if (_calendarFormat != format) {
                setState(() {
                  _calendarFormat = format;
                });
              }
            },
            onPageChanged: (focusedDay) {
              // No es necesario llamar a `setState()` aquí
              _focusedDay = focusedDay;
            },
          ),
          SizedBox(height: 20.0),

          Card(
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  widget.maquina.imagenUrl,
                  fit: BoxFit.cover,
                  width: 80,
                  height: 80,
                ),
                SizedBox(height: 8),
                Text(
                  widget.maquina.nombre,
                  style: TextStyle(fontSize: 14),
                ),
              ],
            ),
          ),
          // Widget para mostrar las horas disponibles
          Expanded(
            child: ListView.builder(
              itemCount: _availableHours.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 16.0),
                  child: ElevatedButton(
                    onPressed: () {
                      // Pudes agregar acciones adicionales cuando se presiona el botón aquí
                      DateFormat dateFormat = DateFormat("yyyy-MM-dd");
                      String fecha = dateFormat.format(_focusedDay);
                      print(fecha);
                      String hora = _availableHours[index];
                      print('Se presionó: ${hora}');
                      String id_usuario = '1000618715';
                      AwesomeDialog(
                          context: context,
                          dialogType: DialogType.warning,
                          animType: AnimType.topSlide,
                          showCloseIcon: true,
                          title: "Confirmar reserva",
                          desc:
                              "Desea agendar el uso de la maquina para el dia " +
                                  fecha +
                                  "  hora " +
                                  hora,
                          btnCancelOnPress: () {},
                          btnOkOnPress: () {
                            guardarRservacionMaquina(fecha, hora, id_usuario, widget.maquina.nombre);
                            AwesomeDialog(
                              context: context,
                              dialogType: DialogType.success,
                              animType: AnimType.topSlide,
                              showCloseIcon: true,
                              title: "Confirmación Exitosa",
                            ).show();
                          }).show();
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue, // Color de fondo del botón
                    ),
                    child: Text(
                      _availableHours[index],
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Future<List<String>> horasDiponiblesMaquinaService(DateTime selectedDay, String maquina) async {
    DateFormat dateFormat = DateFormat("yyyy-MM-dd");
    String fecha = dateFormat.format(selectedDay);        
    final uri = Uri.parse(
        "https://gym-u.free.beeceptor.com/gym/obtenerHorasDisponibles/" +
            maquina + "/" + fecha);
    final response = await http.get(uri);
    print(uri);
    if (response.statusCode == 200) {
      // Convierte la cadena JSON a una lista de strings
      final List<dynamic> horasDynamic = json.decode(response.body);
      // Convierte la lista dinámica a una lista de strings
      final List<String> horas =
          horasDynamic.map((hora) => hora.toString()).toList();
      return horas;
    } else {
      throw Exception('Fallo el servicio reserva');
    }
  }

  Future<String> guardarRservacionMaquina(
      String fecha, String hora, String id_usuario, String maquina) async {
    Map<String, dynamic> request = {
      'fecha_reserva': fecha,
      'hora_reserva': hora,
      'id_usuario': id_usuario,
      'maquina': maquina
    };
    final uri =
        Uri.parse("https://gym-u.free.beeceptor.com/gym/create-reservation");
    final response = await http.post(uri, body: request);

    if (response.statusCode == 201) {
      return response.body;
    } else {
      throw Exception('Fallo el servicio reserva');
    }
  }
}
