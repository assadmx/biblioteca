<?php

namespace App\Models;

use CodeIgniter\Model;

class View_respusrsModel extends Model
{
    protected $table = 'view_respusrs';
    protected $allowedFields = ['idrespvsusrs','usuario','pregunta','respuesta','id_respuestas','enunciadorespuesta','correcta,prueba'];

    /**
     * encuentra las preguntas de una prueba
     * @param prueba id de la prueba a consultar
     * @return preguntas de una prueba
     */
    public function encuentracorrectas ($prueba,$usuario){
        $consulta = $this
                          ->where('prueba', $prueba)
                          ->where('usuario', $usuario)
                          ->where('correcta', 1)
                          ->findAll();
        return $consulta;
    }
}