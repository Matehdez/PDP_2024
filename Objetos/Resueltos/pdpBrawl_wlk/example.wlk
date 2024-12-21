class Personaje {
  method participar(mision) = mision.realizar()

  var property copas

  method destreza()

  method tieneEstrategia()
}

class Arquero inherits Personaje{
  const agilidad

  const rango

  override method destreza() = agilidad * rango

  override method tieneEstrategia() = rango > 100
}

class Guerrera inherits Personaje{
  const indicadorEstratega

  const fuerza

  override method destreza() = fuerza *1.50

  override method tieneEstrategia() = indicadorEstratega


  
}

class Ballestero inherits Arquero{
  override method destreza() = super() * 2

}

class Mision {

  const property dificultad

  const property tipoMision

  method copasEnJuegoBase()

  method copasEnJuego() = tipoMision.copasEnJuego(self)

  method puedeSerSuperada()

  method puedeComenzar()

  method gestionarCopas()

  method realizar() {
    if(! self.puedeComenzar()){
      throw new DomainException(message= "No puede comenzar")
    }else{
      self.gestionarCopas()
    }
  }

}

class MisionIndiv inherits Mision {
  const property personaje 

  override method copasEnJuegoBase() = 2 * dificultad

  override method puedeSerSuperada() = personaje.tieneEstrategia() || personaje.destreza() > dificultad

  override method puedeComenzar() = personaje.copas() >= 10

  override method gestionarCopas(){
    if(self.puedeSerSuperada()){
      personaje.copas(personaje.copas() + self.copasEnJuego())
    }else {
      personaje.copas(personaje.copas() - self.copasEnJuego())
    }
  }


    
}


class MisionGrupal inherits Mision {
  const property personajes 

  override method copasEnJuegoBase() = 50 / personajes.size()

  override method puedeSerSuperada() = personajes.count({p => p.tieneEstrategia()}) > (personajes.size() / 2)
    || personajes.all({p => p.destreza() > 400})

  override method puedeComenzar() = personajes.sum({p => p.copas()}) >= 60

  override method gestionarCopas(){
    if(self.puedeSerSuperada()){
      personajes.forEach({p => p.copas(p.copas() + self.copasEnJuego())})
    }else {
      personajes.forEach({p => p.copas(p.copas() - self.copasEnJuego())})
    }
  }

  
}

class TipoMision {
  method copasEnJuego(mision) = mision.copasEnJuegoBase()
}

class Comun inherits TipoMision {

}

class Boost inherits TipoMision {
  const multiplicador

  override method copasEnJuego(mision) = super(mision) * multiplicador
  
}

class Bonus inherits TipoMision {
  override method copasEnJuego(mision) =super(mision) + mision.participa().sum()
  
}
