import sucursal.*

class Comercio {

	var sucursales // conjunto de sucursales

	method totalFacturado() = 
		sucursales.sum{sucursal => sucursal.totalFacturado()}
	

	method totalFacturadoPor(sucursal) = 
		sucursal.totalFacturado()

	method pedidosRealizados(color){
		return sucursales.flatMap{sucursal=> sucursal.pedidosRealizados(color)}
	}
	
	method pedidoMasCaro() {
		sucursales.map{sucursal => sucursal.pedidoMasCaro()}
			.max{ pedido => pedido.precio()}
	}

	method tallesSinPedidosEntre(rango){ // TODO El rango no debería ser un parámetro.
		 return sucursales.flatMap{sucursal => sucursal.tallesSinPedidosEntre(rango)}
	}

	method sucursalQueMasFacturo(){
		return sucursales.max{sucursal => sucursal.totalFacturado()}
	}

	method sucursalesQueVendieronTodosLosTalles(){
		return sucursales.filter{sucursal => sucursal.vendioTodosLosTalles()}
	}
		
		
}

