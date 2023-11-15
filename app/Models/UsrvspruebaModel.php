<?php

namespace App\Models;

use CodeIgniter\Model;

class UsrvspruebaModel extends Model
{
    protected $table = 'usrvsprueba';
    protected $primaryKey = 'id_usrvsprueba';
    protected $allowedFields = ['usuario', 'prueba'];

    /**
     * encuentra la prueba de un usuario
     * @param usuario es el id del usuario a consultar
     * @return prueba id de la prueba que debe contestar el usuario
     */

    public function encuentraprueba ($usuario){

        $prueba = $this->select('prueba')->where('usuario', $usuario)->first();
        return $prueba;
    }
}
