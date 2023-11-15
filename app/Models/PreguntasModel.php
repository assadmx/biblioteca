<?php

namespace App\Models;

use CodeIgniter\Model;

class PreguntasModel extends Model
{
    protected $table = 'preguntas';
    protected $primaryKey = 'id_pregunta';
    protected $allowedFields = ['prueba', 'pregunta'];

    /**
     * encuentra las preguntas de una prueba
     * @param prueba id de la prueba a consultar
     * @return preguntas de una prueba
     */
    public function encuentrapreguntas ($prueba){
        $preguntas = $this->where('prueba', $prueba)->findAll();
        return $preguntas;
    }
}