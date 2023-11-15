import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
  // Asegúrate de importar tu archivo utils.dart aquí

class agendamientoMaquina extends StatefulWidget {
  @override
  _TableBasicsExampleState createState() => _TableBasicsExampleState();
}

class _TableBasicsExampleState extends State<agendamientoMaquina> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  List<String> _availableHours = []; // Lista de horas disponibles
  DateTime kFirstDay = DateTime(2023, 1, 1); // Ejemplo: la primera fecha permitida en el calendario
  DateTime kLastDay = DateTime(2023, 12, 31);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agendamientos Maquina'),
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
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay;
                  
                  // Lógica para obtener las horas disponibles para el día seleccionado
                  _availableHours = obtenerHorasDisponibles(selectedDay);
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
          // Widget para mostrar las horas disponibles
          Expanded(
            child: ListView.builder(
              itemCount: _availableHours.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  child: ElevatedButton(
                    onPressed: () {
                      // Puedes agregar acciones adicionales cuando se presiona el botón aquí
                       print( _focusedDay);
                      print('Se presionó: ${_availableHours[index]}');
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

  // Función de ejemplo para obtener horas disponibles
  List<String> obtenerHorasDisponibles(DateTime selectedDay) {
    // Aquí deberías implementar la lógica real para obtener las horas disponibles
    // basándote en la fecha seleccionada (_selectedDay)
    // Esta es solo una implementación de ejemplo
    return [
      '08:00 AM - 09:00 AM',
      '09:00 AM - 10:00 AM',
      '10:00 AM - 11:00 AM',
      '11:00 AM - 12:00 PM',
      '12:00 PM - 01:00 PM',
      '01:00 PM - 02:00 PM',
      '02:00 PM - 03:00 PM',
      '03:00 PM - 04:00 PM',
      '04:00 PM - 05:00 PM',
      '05:00 PM - 06:00 PM',
    ];
  }
}