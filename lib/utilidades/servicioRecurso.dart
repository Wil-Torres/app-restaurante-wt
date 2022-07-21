class ServicioRecurso {
  int _moduloId = 0;
  Map<String, String> userHeader() {
    final Map<String, String> headers = {
      "moduloId": _moduloId.toString(),
      'Access-Control-Allow-Origin': '*'
    };

    /*const perfil = this.storage.perfil;
    console.assert(!isNil(perfil) && !isNil(perfil.usuario), 'No se ha autenticado!');*/
    final Map<String, dynamic> perfil = {"usuario": 'a'};
    if (perfil != null /*&& perfil.usuario != null*/) {
      //headers.authorization = 'Custom $btoa($perfil.usuario.nombre:$perfil.usuario.token)';
      headers.addAll({
        "Authorization":
            "Custom V1RPUlJFUzo5QWN2ZHlHRkpZR3BIRGZ1RnpybllPOXE1M29BSjlKZSt6dXNzL0lBSUtzZElpK01jRlpLR1k2TTdiVjZoL2RnaEVMNTkxc1dTc0JpK29wWTFwYlU0QT09"
      });
    }

    /*const empresa = this.storage.empresa;
    console.assert(!isNil(empresa), 'No ha seleccionado una empresa!');*/
    final Map<String, dynamic> empresa = {"id": 1};
    if (empresa != null) {
      //headers.addAll({"empresaId": "empresa.id.toString()"});
      headers.addAll({"empresaId": "100"});
    }
    /*const sucursal = this.storage.sucursal;
    console.assert(this._moduloId !== 14 || !isNil(sucursal), 'No ha seleccionado una sucursal!');*/
    final Map<String, dynamic> sucursal = {"id": 1};
    if (sucursal != null) {
      //headers.sucursalId = sucursal.id.toString();
      headers.addAll({"sucursalId": "16"});
    }

    return headers;
  }

  ServicioRecurso(this._moduloId) {}
}
