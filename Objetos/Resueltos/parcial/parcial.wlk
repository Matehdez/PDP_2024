// Apellido y Nombre: MATEO NICOLAS HERNANDEZ

object deptoMuerte {
    var property listaAgentes = #{}

    method mejorAgente() = listaAgentes.max({agente => agente.cantPaquetesVendidos()}) //

    var listaPaquetes = [] //pueden cambiar(?) //Son los paquetes predefinidos para toda la empresa

    method listaPaquetes() {
        return listaPaquetes
    }

    method liberarAgentes(agentesCorrectos) = agentesCorrectos.forEach({agente => listaAgentes.remove(agente)})

    method castigarAgentes(agentesMalos) = agentesMalos.forEach({agente => agente.modificarDeuda(100)})

    method diaDeLosMuertos(){
        const mejorAgente= self.mejorAgente()

        mejorAgente.modificarDeuda(-50) //EVENTO 1

        const saldaronDeuda = listaAgentes.filter({agente => agente.saldoDeuda()})
        const deudores = listaAgentes.filter({agente =>not agente.saldoDeuda()})

        self.liberarAgentes(saldaronDeuda) //EVENTO 2

        self.castigarAgentes(deudores) //EVENTO 3
    }
}

//CLASS AGENTE -----------------------------------------------------------------------
class Agente {
    var property deuda

    method saldoDeuda() = deuda <=0 //saldóDeuda

    method modificarDeuda(_deuda) {
        deuda += _deuda
    }

    var empresa = deptoMuerte //Es la unica empresa que tenemos disponible, pero lo dejo variable por si aparece un competidor :D

    const property paquetesPredefinidos = empresa.listaPaquetes()

    var property estrategia

    method elegirPaquete(alma) = estrategia.elegirPaquete(self, alma)

    method puedeComenzarVenta(alma)= alma.leInteresa(self.elegirPaquete(alma)) && alma.puedeCostear(self.elegirPaquete(alma)) //Agente le ofrece el paquete

    method validarVenta(alma) {
        if (not self.puedeComenzarVenta(alma)) (throw new DomainException(message = "La venta no se pudo realizar"))
    }

    method vender(alma){
        const paquete = self.elegirPaquete(alma)
        self.validarVenta(alma)
        alma.comprar(paquete)
        self.deuda(-(paquete.costo()))
        paquetesVendidos.add(paquete)
    }

    var paquetesVendidos = []

    method cantPaquetesVendidos() = paquetesVendidos.size()

    method dineroTotalGanado() = paquetesVendidos.sum({paquete => paquete.costo()})
}

//CLASS ESTRATEGIA ---------------------------------------------------------------------
class Estrategia {

    method valorBasico(alma) 

    method elegirPaquete(agente, alma)
}

class Clasico inherits Estrategia {
    const valorBasico

    override method valorBasico(_) = valorBasico

    method paquetesClasicos(agente) = agente.paquetesPredefinidos()

    method paquetesCosteables(agente, alma) = self.paquetesClasicos(agente).filter({paquete => alma.puedeCostear(paquete)})

    method paqueteMasCaroCosteable(agente, alma) = self.paquetesCosteables(agente, alma).max({paquete => paquete.costo()})

    override method elegirPaquete(agente, alma) = self.paqueteMasCaroCosteable(agente, alma)
}

object navegante inherits Estrategia {
    
    override method valorBasico(alma) = alma.buenasAcciones()

    override method elegirPaquete(agente, alma) {
        const acciones = alma.buenasAcciones()

        if(acciones >=50){
            return new Crucero(alma = alma, valorBasico = self.valorBasico(alma))
        }else{
           return new Bote(alma = alma, valorBasico = self.valorBasico(alma))
        }
    }

}

object indiferente inherits Estrategia {
    override method valorBasico(_) = 1.randomUpTo(300)
    override method elegirPaquete(agente, alma) = new PaloBrujula(alma = alma, valorBasico = self.valorBasico(alma))

}

//CLASS PAQUETE -----------------------------------------------------------
class Paquete {
    const alma //me parece necesaria la relacion de "conoce",  pues no puedo hacer que un paquete siempre dependa de alma (relacion usa), eso seria poco optimo para el modelo desarrollado (por ejemplo, cuando me interesa saber el costo de un paquete)

    const valorBasico

    method cantAniosReducidos()

    method costo() = (valorBasico * self.cantAniosReducidos()).min(350)

    method reduceTiempo() = self.cantAniosReducidos() > 0

}

class Tren inherits Paquete {
    override method cantAniosReducidos() = 4
}

class Bote inherits Paquete {
    override method cantAniosReducidos() = (alma.buenasAcciones() / 50).min(2)

    method tieneTendencia() = alma.buenasAcciones() <= 50
}

class Crucero inherits Bote {
    override method cantAniosReducidos() = super() * 2
}

class PaloBrujula inherits Paquete {
    override method cantAniosReducidos() = 0.05

    override method costo() = valorBasico
}

//CLASS ALMA-----------------------------------------------------------------
class Alma {
    const dineroAlMorir

    var duracionViaje = 4 //El viaje dura 4 años (enunciado)

    const property buenasAcciones

    var property capital = dineroAlMorir + buenasAcciones

    method puedeCostear(paquete) = paquete.costo() <= self.capital()

    method leInteresa(paquete) = paquete.reduceTiempo(self)

    var property paqueteAdquirido = null //si adquirio (paquete) o no (null). Se guardará siempre el mas reciente. 

    method comprar(paquete) {
        const dineroAPagar = paquete.costo(self)
        capital -= dineroAPagar
        self.paqueteAdquirido(paquete)
        duracionViaje -=paquete.cantAniosReducidos()
    }
}

