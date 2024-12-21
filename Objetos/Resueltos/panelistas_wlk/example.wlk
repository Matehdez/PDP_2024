class Panelista {

  var property puntosEstrella

  method bonus(tematica) = 0

  method remateGracioso(tematica) {}

  method sumaPuntos(_puntos) {
    puntosEstrella += _puntos
  }

  method opinaSobreTematica(tematica) = tematica.opina(self)
}

class Celebridad inherits Panelista {

  override method remateGracioso(_) {
    puntosEstrella += 3
  }

  override method bonus(tematica) = tematica.cantPalabras()
}

class Colorado inherits Panelista {

  var property gracia

  override method remateGracioso(_) {
    puntosEstrella += (gracia/5)
    gracia += 1
  }
}

class ColoradoPeluca inherits Colorado {

  override method remateGracioso(_) {
    super(_)
    puntosEstrella += 1
  }
  
}

class Viejo inherits Panelista {
  override method remateGracioso(tematica){
    puntosEstrella += tematica.cantPalabras()
  }
}

class Deportivo inherits Panelista {
  override method bonus(_) = 5
  
}

//CLASS TEMATICAS --------------------------------------------------------
class Tematica {

  const property titulo

  method cantPalabras() = titulo.words().size() //! no se que hace words

  const property involucrados

  method cantInvolucrados() = involucrados.size()

  method opina(panelista) {
    panelista.sumaPuntos(1)
  } 

  method mereceAtencion() = false
}

class TematicaEspecializada inherits Tematica {
  method bonus()

    override method opina(panelista) {
    if (panelista.bonus(self) == self.bonus()) {
      panelista.sumaPuntos(self.bonus())
    } 
}

}

class Deportiva inherits TematicaEspecializada {
  override method bonus() = 5

  override method mereceAtencion() = titulo.contains("messi")


}

class Farandula inherits TematicaEspecializada {
  override method bonus() = self.cantInvolucrados()

  override method mereceAtencion() = self.cantInvolucrados() >= 3

}

class Filosofica inherits Tematica {

    override method mereceAtencion() = self.cantPalabras() > 20

}

class TematicaMixta inherits Tematica{
  const property listaTematicas

  method tituloTematicas() = listaTematicas.map({t => t.titulo()})

  override method titulo() = self.tituloTematicas().flatten()

  override method mereceAtencion() = listaTematicas.any({t => t.mereceAtencion()})

}

class Emision {
  const property listaTematicas

  var property estaEmitiendo = false

  var property estaEmitido = false

  method cantTematicas() = listaTematicas.size()

  method tematicasInteresantes() = listaTematicas.filter({t => t.mereceAtencion()})

  method cantTematicasInteresantes() = self.tematicasInteresantes().size()

  method esInteresante() = (self.cantTematicas() / 2) <= self.cantTematicasInteresantes()

  method involucrados() = listaTematicas.map({t => t.involucrados()})

  method puedeEmitir() = self.involucrados() >= 2 && self.esInteresante()

  method opinanPanelistas(tematica) = self.involucrados().forEach({i => i.opinaSobreTematica(tematica)})

  method opinanConGracia(tematica) = self.opinanPanelistas(tematica).forEach({i => i.remateGracioso(tematica)})

  method emitir() {
    self.estaEmitiendo(true)
    listaTematicas.forEach({t => self.opinanConGracia(t)})
    self.estaEmitido(true)

  }

  method panelistaEstrella () {
    if(estaEmitido){
      self.involucrados().max({i => i.puntosEstrella()})
    } else {
      throw new DomainException(message = "Programa No emitido o en Curso") //Me da paja hacer otro if
    }
  }


}



