<?php

namespace App\Models;

use CodeIgniter\Model;

class RespUsrModel extends Model
{
    protected $table = 'respvsusrs';
    protected $primaryKey = 'idrespvsusrs';
    protected $allowedFields = ['usuario', 'pregunta', 'respuesta'];
}
