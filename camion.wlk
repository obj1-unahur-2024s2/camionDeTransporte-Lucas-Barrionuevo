import cosas.*

object camion {
    var cosas = []
    var peso = 1000

    method peso() = peso

    method cargar(cosa){
        cosas.add(cosa)
        peso += cosa.peso()
    }

    method descargar(cosa){
       if (cosas.contains(cosa)){
        peso -= cosa.peso()
        cosas.remove(cosa)
       }
    }

    method esPesoInpar(){
        return cosas.any({c=>!c.peso().even()})
    }

    method existeCosaQuePese(valor){
        return cosas.any({c=>c.peso() == valor})
    }

    method existeObjetoConPeligrosidad(peligrosidad){
        return cosas.any({c=>c.peligrosidad()==peligrosidad})
    }
    
    method masPeligrosos(peligrosidad){
        return cosas.filter({c=>c.peligrosidad() > peligrosidad})
    }

    method excedePesoMaximo(){
        var excede= false
        if (peso > 2500){
            excede = true
        }
        return excede
    }

   method puedeCircularEnRuta(peligrosidad) {
    return self.masPeligrosos(peligrosidad).isEmpty() and not self.excedePesoMaximo()
    }

    method cosaMayorPeso(){
        const mayorPeso = cosas.max({c=> c.peso()})
        return cosas.find({c=>c.peso() == mayorPeso})
    }
    method tieneCosaEntre(vMin,vMax){
        var cumple = true
        const mayorPeso = cosas.max({c=> c.peso()})
        const menorPeso = cosas.min({c=> c.peso()})
        if (mayorPeso > vMax or menorPeso<vMin){
            cumple =false
        }
        return cumple
    }
}