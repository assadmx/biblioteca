<?php
namespace App\Controllers;

use CodeIgniter\Controller;

class Login extends Controller
{

    public function __construct()
    {
        //parent::__construct();

        // Cargar la biblioteca de sesiones
        $this->session = \Config\Services::session();
    }

    public function index()
    {
        return view('login/index');
    }

    public function process()
    {   //$this->session = \Config\Services::session();
        $session = session();

        $username = $this->request->getVar('username');
        $pass = $this->request->getVar('password');
        // Carga el modelo de usuario
        $UserModel = new \App\Models\UsersModel();
        

        // Consulta la base de datos para verificar las credenciales del usuario
        $user = $UserModel->where('username', $username)->where('password', $pass)->first();
        if ($user) {
            $user_data = array(
                'user_id' => $user['id'],
                'username' => $user['username'],
                'role' => $user['role']
            );
            
            $this->session->set($user_data);
            
            return view('dashboard/escritorio');
        } else {
            return redirect()->to('login')->with('error', 'Nombre del usuario o contraseña incorrectos');
        }
    }
    
    public function logout()
    {
        $session = session();
        $session->remove('isLoggedIn');
        return redirect()->to('login');
    }

}

