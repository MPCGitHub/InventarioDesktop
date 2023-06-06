class Celular {
  String tag;
  String fabricante;
  String serialNumber;
  String imei1;
  String imei2;
  String departamento;
  String modelo;
  String hd;
  String colaborador;
  String empresa;
  String site;
  String termo;
  bool ativo;
  String data;

  Celular({
    required this.tag,
    required this.fabricante,
    required this.serialNumber,
    required this.imei1,
    required this.imei2,
    required this.departamento,
    required this.modelo,
    required this.hd,
    required this.colaborador,
    required this.empresa,
    required this.site,
    required this.termo,
    required this.ativo,
    required this.data,
  });

  factory Celular.fromJson(Map<String, dynamic> json) {
    return Celular(
      tag: json['tag'],
      fabricante: json['fabricante'],
      serialNumber: json['serial_number'],
      imei1: json['imei1'],
      imei2: json['imei2'],
      departamento: json['departamento'],
      modelo: json['modelo'],
      hd: json['hd'],
      colaborador: json['colaborador'],
      empresa: json['empresa'],
      site: json['site'],
      termo: json['termo'],
      ativo: json['ativo'],
      data: json['data'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'tag': tag,
      'fabricante': fabricante,
      'serial_number': serialNumber,
      'imei1': imei1,
      'imei2': imei2,
      'departamento': departamento,
      'modelo': modelo,
      'hd': hd,
      'colaborador': colaborador,
      'empresa': empresa,
      'site': site,
      'termo': termo,
      'ativo': ativo,
      'data': data,
    };
  }

  @override
  String toString() {
    return 'Celular{tag: $tag, fabricante: $fabricante, serialNumber: $serialNumber, '
        'imei1: $imei1, imei2: $imei2, departamento: $departamento, '
        'modelo: $modelo, hd: $hd, colaborador: $colaborador, '
        'empresa: $empresa, site: $site, termo: $termo, '
        'ativo: $ativo, data: $data}';
  }
}
