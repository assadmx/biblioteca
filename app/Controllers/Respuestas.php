<?php

namespace App\Controllers;

use App\Models\RespuestasModel;
use App\Models\RespUsrModel;
use CodeIgniter\Controller;

class Respuestas extends Controller
{
    public function procesarRespuestas()
    {
        $respuestasModel = new RespUsrModel();
        $UserModel = new \App\Models\UsuarioModel();
        $UsrvspruebaModel = new \App\Models\UsrvspruebaModel();
        $PreguntasModel = new \App\Models\PreguntasModel();
        $View_respusrsModel = new \App\Models\View_respusrsModel();
        $PruebasModel = new \App\Models\PruebasModel();

        $usuario = $this->request->getPost('usuario');
        $respuestas = $this->request->getPost('respuesta');
        
        // Recorre las respuestas y guárdalas en la base de datos
        foreach ($respuestas as $id_pregunta => $respuesta) {
            $x=intval($id_pregunta);
            $data = [
                'usuario' => intval($usuario),
                'pregunta' => $x,
                'respuesta' => intval($respuesta),
            ];
            $respuestasModel->insert($data);
        }
        $user = $UserModel->where('id', intval($usuario))->first();
        $prueba=$UsrvspruebaModel->encuentraprueba($user['id']);
        $preguntas=$PreguntasModel->encuentrapreguntas($prueba['prueba']);
        $minaprob=$PruebasModel->encuentraminaprob($prueba['prueba']);
        $correctas=$View_respusrsModel->encuentracorrectas ($prueba['prueba'],intval($usuario));
        $conteocorrectas=count($correctas);
        $minaprobVal=floatval($minaprob['minaprob']);
        
        $calificacion = round(($conteocorrectas*10)/count($preguntas),2);
        
        if ($calificacion>$minaprobVal) {
            $msjaprob ="Felicidades, ha obtenido una calificación aprobatoria con la calificación de: ".$calificacion;
        } else{
            $msjaprob ="Lo sentimos, usted no ha aprobado el examen con la calificación de: ".$calificacion;
        }
        $data =[
            'usuario'=> $user['id'],
            'nombre' => $user['nombre'],
            'appat'  => $user['apppat'],
            'prueba' => $prueba['prueba'],
            'msjaprob' => $msjaprob
        ];
        //var_dump($data); die();
        return view('dashboard/calificacion',$data);
    }
}
