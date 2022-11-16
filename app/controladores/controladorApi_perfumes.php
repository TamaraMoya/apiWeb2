<?php
require_once './app/modelos/modeloPerfume.php';
require_once './app/vistas/vistaApi.php';

class ControladorApiPerfumes {
    private $modelo;
    private $vista;

    private $data;

    public function __construct() {
        $this->modelo = new ModeloPerfume();
        $this->vista = new VistaApi();
        
        $this->data = file_get_contents("php://input");
    }
    private function getData() {
        return json_decode($this->data);
    }

    public function traerPerfumes($params = null) {
        $filtrar = null;
        $valor = null;
        $ordenarPor = "marca";
        $orden="ASC";
        $limite=null;
        $offset=null;
        

        if (isset($_GET['filtrar'])){
            $filtrar = $_GET['filtrar'];
            $valor = $_GET['valor'];
        }

        if (isset($_GET['ordenarPor']))
            $ordenarPor = $_GET['ordenarPor'];

        if (isset($_GET['orden']))
            $orden = $_GET['orden']; 
        
        if (isset($_GET['limite'])){
            $limite = $_GET['limite'];
            $offset = (($_GET['pagina'])-1)*$limite;
        }
        
        $perfumes = $this->modelo->mostrarPerfumes($filtrar, $valor, $ordenarPor, $orden, $limite, $offset);
        $this->vista->response($perfumes);
    }

    public function traerPerfume($params = null) {
        $id = $params[':ID'];
        $perfume = $this->modelo->traerPerfume($id);

        if ($perfume)
            $this->vista->response($perfume);
        else 
            $this->vista->response("El producto solicitado con el id=$id no existe", 404);
    }

    public function eliminarPerfume($params = null) {
        $id = $params[':ID'];

        $perfume = $this->modelo->traerPerfume($id);
        if ($perfume) {
            $this->modelo->eliminarPerfume($id);
            $this->vista->response($perfume);
        } else 
        $this->vista->response("El producto solicitado con el id=$id no existe", 404);
    }

    public function agregarPerfume($params = null) {
        $perfume = $this->getData();

        if (empty($perfume->nombre) || empty($perfume->marca) || empty($perfume->tipo) || empty($perfume->tamanio) || empty($perfume->genero) || empty($perfume->precio)) {
            $this->vista->response("Complete todos los datos solicitados", 400);
        } 
        
        else {
            $id = $this->modelo->agregarPerfume($perfume->nombre, $perfume->marca, $perfume->tipo, $perfume->tamanio, $perfume->genero, $perfume->precio);
            $perfume = $this->modelo->traerPerfume($id);
            $this->vista->response($perfume, 201);
        }
    }

    public function modificarPerfume($params = null) {
        $id = $params[':ID'];
        $perfume = $this->modelo->traerPerfume($id);

        if ($perfume) {
            $perfume = $this->getData();
            $this->modelo->modificarPerfume($perfume->nombre, $perfume->marca, $perfume->tipo, $perfume->tamanio, $perfume->genero, $perfume->precio, $id);
            $perfume = $this->modelo->traerPerfume($id);
            $this->vista->response($perfume, 200);
        } 
        else 
            $this->vista->response("El producto que intenta modificar con el id=$id no existe", 404);
    }

}
