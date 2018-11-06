import remera.*

class Sucursal {

	var pedidos = []
	var totalFacturado = 0
	var cantidadParaDescuento

	method registrarPedido(pedido) {
		pedidos.add(pedido)
		if (self.aplicaDescuento(pedido)) {
			totalFacturado += pedido.precio() * pedido.porcentajeDeDescuento()
		} else {
			totalFacturado += pedido.precio()
		}
	}

	method aplicaDescuento(pedido) {
		return pedido.cantidad() >= cantidadParaDescuento
	}

	method totalFacturado() = totalFacturado

	method pedidosRealizados(color) {
		return pedidos.all{ pedido => pedido.color() == color }
	}

	method pedidoMasCaro() {
		return pedidos.max{ pedido => pedido.precio() }
	}
	
	

}

class Pedido {

	var modelo // remera
	var cantidad

	method precio() {
		return modelo.precio() * cantidad
	}

	method talle() = modelo.talle()
	method colorModelo() = modelo.color()

	method porcentajeDeDescuento() = modelo.porcentajePorcentajeDeDescuento()

}

