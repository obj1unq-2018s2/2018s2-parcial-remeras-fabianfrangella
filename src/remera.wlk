class RemeraLisa {

	var color // String
	var talle // Numero
	var coloresBasicos = #{ "Blanco", "Negro", "Gris" }

	method color() = color

	method talle() = talle

	method esDeColorBasico() = coloresBasicos.contains(color)

	method costoSegunRango() {
		if (talle.between(32, 40)) {
			return 80
		} else {
			return 100
		}
	}

	method porcentajeDeDescuento() = 0.10
	
	method costo() {
		if (self.esDeColorBasico()) {
			return self.costoSegunRango()
		} else {
			return self.costoSegunRango() * 0.10
		}
	}

}

class RemeraBordada inherits RemeraLisa {

	var cantColores // numero

	override method porcentajeDeDescuento() = 0.02
	method costoMinimo() = 20

	method precioPorBordado() = if (cantColores * 10 < self.costoMinimo()) 20 else cantColores * 10

	override method costo() {
		return super() + self.precioPorBordado()
	}

}

class RemeraSublimada inherits RemeraLisa {

	var dibujoSublimado // instancia de la clase DibujoSublimado

	method precioPorSublimado() {
		return dibujoSublimado.precio()
	}

	override method costo() {
		return super() + self.precioPorSublimado()
	}
	
	override method porcentajeDeDescuento() = if (dibujoSublimado.esPropiedadDeUnaEmpresa()) 0.20 else 0.10

}

class DibujoSublimado {

	var alto
	var ancho
	var empresa // instancia de la clase empresa o null

	method esPropiedadDeUnaEmpresa() = empresa != null

	method precioPorPropiedad() = if (self.esPropiedadDeUnaEmpresa()) empresa.precioPorCopyRight() else 0

	method alto() = alto

	method ancho() = ancho

	method precioPorSuperficie() = alto * ancho * 0.5

	method precio() {
		return self.precioPorSuperficie() + self.precioPorPropiedad()
	}
}

class Empresa {

	var precioPorCopyRight

	method precioPorCopyRight() = precioPorCopyRight

}

