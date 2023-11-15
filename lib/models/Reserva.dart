class Reserva {
  String fecha_reserva;
  dynamic hora_reserva;
  dynamic id_usuario;

  Reserva({
    required this.id_usuario,
    required this.fecha_reserva,
    required this.hora_reserva
  });

  factory Reserva.fromJson(Map<String, dynamic> json) => Reserva(
    fecha_reserva: json['fecha'], 
    hora_reserva: json['hora'], 
    id_usuario: json['id_usuario']
    );
}