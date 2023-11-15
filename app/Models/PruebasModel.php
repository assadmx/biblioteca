<?php

namespace App\Models;

use CodeIgniter\Model;

class PruebasModel extends Model
{
    protected $table = 'pruebas';
    protected $primaryKey = 'id_usrvsprueba';
    protected $allowedFields = ['nombre_prueba', 'minaprob'];

    public function encuentraminaprob ($prueba){
        $minaprob = $this->select('minaprob')->where('id_usrvsprueba', $prueba)->first();
        return $minaprob;
    }

}
