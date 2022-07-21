import 'dart:js_util';

import 'package:app_restaurante_wt/utilidades/core_servicios.dart';
import 'package:app_restaurante_wt/utilidades/servicioRecurso.dart';
import 'package:app_restaurante_wt/utilidades/utils.dart';

import 'package:flutter/material.dart';

class MarcaServices extends ServicioRecurso {
  late RecursoWeb<dynamic> rsCliente;

  MarcaServices(super.moduloId) {
    CoreServicios core = CoreServicios();
    Filtros filtros = Filtros([], [], false);
    rsCliente =
        core.crearRecursos('gt.area.cfg/recursos/clientes', filtros, false);
  }
}
