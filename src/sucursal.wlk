import remera.*

class Sucursal {

	var pedidos = []
	var totalFacturado = 0
	var cantidadParaDescuento
	var acuerdosComerciales = #{}
	
	method registrarPedido(pedido) {
		pedidos.add(pedido)
		if (self.aplicaDescuento(pedido)) {
			totalFacturado += self.precioDescuentoSegunPedido(pedido)
		} else {
			totalFacturado += pedido.precio() - self.descuentoDeMarca(pedido) // TODO No es lo que dice el enunciado.
		}
	}

	method descuentoDeMarca(pedido) {
		if (self.esDeMarcaYTieneAcuerdo(pedido)) { // TODO Esto es equivalente a preguntar por el tipo, deberías delegar para evitar este if.
			return	pedido.descuentoPorAcuerdo() 	
		} else {
			return 0		
		}
		
	}
		
	method esDeMarcaYTieneAcuerdo(pedido) = pedido.esDeMarca() && self.tieneAcuerdoComercial(pedido.marca())
	
	method precioDescuentoSegunPedido(pedido){
		// TODO Delegar y usar polimorfismo.
		return if (pedido.esDeMarca() && self.tieneAcuerdoComercial(pedido.marca())) 
				pedido.precio() - pedido.descuentoPorAcuerdo() else 
				pedido.precio() - pedido.totalDescuento()  
	}
	method aplicaDescuento(pedido) {
		return pedido.cantidad() >= cantidadParaDescuento
	}

	method totalFacturado() = totalFacturado
	

	method pedidosRealizados(color) {
		return pedidos.filter{ pedido => pedido.color() == color }
	}

	method pedidoMasCaro() {
		return pedidos.max{ 
			pedido => 
			// TODO Repite código.
				if (self.aplicaDescuento(pedido)) pedido.precio() - pedido.totalDescuento()
					else pedido.precio()
		}
	}
	
	method pedidos() = pedidos
	method tallesSinPedidosEntre(rango){
		return rango.filter{num => !self.huboPedidoDelTalle(num)}
	}
	
	method huboPedidoDelTalle(talle){
		return pedidos.any{pedido => pedido.talle() == talle}
	}
	
	method vendioTodosLosTalles(){
		return self.tallesSinPedidosEntre(self.talles()).isEmpty()
	}
	
	method talles() = new Range(32,48)
	
	method tieneAcuerdoComercial(empresa) = acuerdosComerciales.contains(empresa)
}

class Pedido {

	var modelo // remera
	var cantidad
	
	method precio() {
		return modelo.costo() * cantidad
	}

	method talle() = modelo.talle()
	method colorModelo() = modelo.color()
	method cantidad() = cantidad
	method totalDescuento() = modelo.porcentajeDeDescuento() * self.precio()
	method color() = modelo.color()
	method esDeMarca() = modelo.esDeMarca()
	method descuentoPorAcuerdo() = modelo.descuentoPorAcuerdo() * self.precio()
	method marca() = modelo.marca()
}

