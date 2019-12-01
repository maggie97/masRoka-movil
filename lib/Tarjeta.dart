class Tarjeta{
  final int id;
  final String idUser;
  final String numero;
  final String validacion;
  final String vencimiento;

  const Tarjeta({this.vencimiento, this.id, this.idUser, this.numero, this.validacion});


  factory Tarjeta.fromJson(Map<String, dynamic> json) {
    return Tarjeta(
      id: json['id'] as int,
      idUser: json['user_id'] as String,
      numero: json['numeroTarjeta'] as String,
      validacion: json['validacion'] as String,
      vencimiento: json['vencimiento'] as String
    );
  }
  /* {
        "id": 1,
        "user_id": "1",
        "numeroTarjeta": "123456789012",
        "vencimiento": "01/2020",
        "validacion": "123",
        "created_at": "2019-12-01 02:19:22",
        "updated_at": "2019-12-01 02:19:22"
    } */
}