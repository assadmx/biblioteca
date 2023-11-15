<?php

namespace App\Models;

use CodeIgniter\Model;

class RespuestasModel extends Model
{
    protected $table = 'respuestas';
    protected $primaryKey = 'id_respuestas';
    protected $allowedFields = ['pregunta', 'respuesta', 'correcta'];

    /**
     * encuentra las opciones de respuesta de una pregunta
     * @param pregunta id de la pregunta
     * @return respuestas opciones de respuesta de la pregunta
     */

     public function encuentraRespuestas ($pregunta){
        $prueba = $this->where('pregunta', $pregunta)->findAll();
        return $prueba;
    }
}
