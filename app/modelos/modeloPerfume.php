<?php

class ModeloPerfume {

    private $db;

    public function __construct() {
        $this->db = new PDO('mysql:host=localhost;'.'dbname=db_perfumes;charset=utf8', 'root', '');
    }

    public function mostrarPerfumes ($filtro = null, $valor = null, $ordenarPor = null, $orden = null, $limite = null, $offset = null) {
        $sql = "SELECT * FROM perfumes ";
        $ext = [];

        if ($filtro != null && $valor != null){
            $sql .=" WHERE $filtro = ? ";
            array_push($ext, $valor);
        }

        if ($ordenarPor != null && $orden != null){
            $sql .=" ORDER BY $ordenarPor $orden ";
            //array_push($ext, $ordenarPor, $orden);
        }

        if ($limite != null && ($offset != null || $offset == 0)) {
            $sql .=" LIMIT $limite OFFSET $offset ";
        }
        
        $query = $this->db->prepare($sql);
        $query->execute($ext);

        $perfumes = $query->fetchAll(PDO::FETCH_OBJ); 
        

        
        return $perfumes;
    }
    
    function traerPerfume($id) {
        $query = $this->db->prepare("SELECT * FROM `perfumes` WHERE `id_producto` = ?");
        $query->execute([$id]);

        $perfume= $query->fetch(PDO::FETCH_OBJ); 
        
        return $perfume;
    }

    public function eliminarPerfume($id) {
        $query = $this->db->prepare('DELETE FROM perfumes WHERE id_producto = ?');
        $query->execute([$id]);
    }

    public function agregarPerfume($nombre, $marca, $tipo, $tamanio, $genero, $precio) {
        $query = $this->db->prepare ("INSERT INTO perfumes (nombre, marca, tipo, tamanio, genero, precio) VALUES (?, ?, ?, ?, ?, ?)");
        $query->execute([$nombre, $marca, $tipo, $tamanio, $genero, $precio]);

        return $this->db->lastInsertId();
    }

    public function modificarPerfume($nombre, $marca, $tipo, $tamanio, $genero, $precio, $id) {
        $query = $this->db->prepare ("UPDATE perfumes SET nombre =?, marca=?, tipo =?, tamanio =? ,genero =?, precio =? WHERE id_producto = ?");
        $query->execute([$nombre, $marca, $tipo, $tamanio, $genero, $precio, $id]);
    }
}