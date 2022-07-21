import 'package:flutter/material.dart';
import 'package:app_restaurante_wt/utilidades/servicioRecurso.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as Phttp;

Base baseFromJson(String str) => Base.fromJson(convert.json.decode(str));

String baseToJson(Base data) => convert.json.encode(data.toJson());

class Base {
  Base({
    required this.id,
  });

  int id;

  factory Base.fromJson(Map<String, dynamic> json) => Base(
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
      };
}

RespuestaWeb respuestaWebFromJson(String str) =>
    RespuestaWeb.fromJson(convert.json.decode(str));

String respuestaWebToJson(RespuestaWeb data) =>
    convert.json.encode(data.toJson());

class RespuestaWeb {
  RespuestaWeb({
    required this.map,
  });

  ResultadoHttp map;

  factory RespuestaWeb.fromJson(Map<String, dynamic> json) => RespuestaWeb(
        map: ResultadoHttp.fromJson(json["map"]),
      );

  Map<String, dynamic> toJson() => {
        "map": map.toJson(),
      };
}

class ResultadoHttp {
  ResultadoHttp({
    this.result,
    this.res,
    this.datos,
    this.numReg,
    this.error,
    this.msg,
  });

  dynamic result;
  dynamic res;
  dynamic datos;
  dynamic numReg;
  dynamic error;
  dynamic msg;

  factory ResultadoHttp.fromJson(Map<String, dynamic> json) => ResultadoHttp(
        result: json["result"],
        res: json["res"],
        datos: json["datos"],
        numReg: json["numReg"],
        error: json["error"],
        msg: json["msg"],
      );

  Map<String, dynamic> toJson() => {
        "result": result,
        "res": res,
        "datos": datos,
        "numReg": numReg,
        "error": error,
        "msg": msg,
      };
}

class Filtro {
  String nombre;
  dynamic valor;
  bool codificado;
  bool like;
  Filtro(this.nombre, this.valor, this.codificado, this.like) {}
}

class Filtros {
  List<Filtro> filtros = [];
  List<Filtro> filtrosBusqueda = [];
  bool limpiaLista = true;

  Filtros(this.filtros, this.filtrosBusqueda, this.limpiaLista);

  List<Filtro> add(String nombre, dynamic valor,
      {bool codificado = false, bool like = false, bool estatico = false}) {
    estatico = false;
    if (valor != null) {
      return filtros;
    }

    if (like) {
      valor = '%$valor%';
    }

    const List<Filtro> lista = [];
    // TODO: Pendiente

    return lista;
  }
}

class RecursoWeb<T extends Base> extends ServicioRecurso {
  Phttp.BaseClient http;
  String url;
  Filtros filtros;
  bool https = false;
  RecursoWeb(this.http, this.url, this.filtros, this.https) : super(0);

  String _servidor() {
    //return this.storage.config.servidorRest;
    return 'http://gtsysd1.tc.tecun.net.gt:10000/';
  }

  Future<RespuestaWeb> get({int offset = 0, int limit = 25}) async {
    filtros.add('offset', offset);
    filtros.add('limit', limit);
    final RespuestaWeb resp;
    final res = await http.get(Uri.parse('http://$_servidor()/$url'),
        headers: userHeader());
    final result = convert.jsonDecode(res.body);
    if (result == null) return RespuestaWeb.fromJson({});

    return RespuestaWeb.fromJson(result);
  }
}
