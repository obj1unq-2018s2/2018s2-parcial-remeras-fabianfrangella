import remera.*

class Sucursal {

	var pedidos = []
	var totalFacturado = 0
	var cantidadParaDescuento

	method registrarPedido(pedido) {
		pedidos.add(pedido)
		if (self.aplicaDescuento(pedido)) {
			totalFacturado += pedido.precio() - pedido.totalDescuento()
		} else {
			totalFacturado += pedido.precio()
		}
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
}

