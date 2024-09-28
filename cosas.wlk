object knightRider {
    method peso() = 500
    method peligrosidad() = 10
}
object bumblebee {
    var peligrosidad = 15
    method peso() = 800
    method transformarAuto(){
        peligrosidad= 15
    }
    method transformarRobot(){
        peligrosidad= 30
    }
    method peligrosidad() = peligrosidad
}

object paqueteLadrillos{
    var peso = 0
    method peligrosidad() = 2
    method armarPaqueteDeLadrillos(ladrillos){
        peso = 2*ladrillos
    }
    method peso()= peso
}
object arenaGranel{
    var  property  peso = 0
    method peligrosidad () = 1
}

object bateriaAntiaerea{
    var peso = 200
    var peligrosidad = 0

    method peso () = peso
    method peligrosidad() = peligrosidad
    method cargarMisiles(){
        peso = 300
        peligrosidad = 100
    }
    method descargarMisiles(){
        peso = 200
        peligrosidad = 0
    }
}

object contenedorPuertuario{
    var peso = 100
    var peligrosidad = 0
    const cosas = []
    method peso () = peso
    method peligrosidad() = peligrosidad

    method cargar(cosa){
        cosas.add(cosa)
        peso += cosa.peso()
        peligrosidad = self.masPeligroso().peligrosidad()
    }
    method descargar(cosa){
       if (cosas.contains(cosa)){
        cosas.remove(cosa)
        peso -= cosa.peso()
        peligrosidad = self.masPeligroso().peligrosidad()
       }
    }
    method masPeligroso(){
        return cosas.max({c=>c.peligrosidad()})
    }
}

object residuosRadioactivos{
    var peso = 0
    method peligrosidad()= 200
    method peso()=peso
    method peso(valor){
        peso = valor
    }
}

object embalajeSeguridad{
    var peso = 0
    var peligrosidad = 0

    method peso() = peso
    method peligrosidad()=peligrosidad
    method embolver(cosa){
        peso = cosa.peso()
        peligrosidad = cosa.peligrosidad()*0.5
    }
}