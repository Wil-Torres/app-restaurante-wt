import 'package:app_restaurante_wt/utilidades/utils.dart';
import 'package:http/http.dart' as Phttp;

class CoreServicios {
  late final Phttp.BaseClient http;

  static final String mensajeDefault = 'Cargando datos ...';

  crearRecurso<T extends Base>(String url, Filtros filtros, bool https) {
    return new RecursoWeb<T>(this.http, url, filtros, https);
  }

  crearRecursos(String url, Filtros filtros, bool https) {
    return new RecursoWeb(this.http, url, filtros, https);
  }
}
