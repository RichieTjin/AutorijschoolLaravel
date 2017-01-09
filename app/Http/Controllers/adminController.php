<?php

namespace App\Http\Controllers;

use App\Http\Requests;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Role;
use App\User;
use App\Voertuig;


class adminController extends controller {
    
    public function getAdminPage()
    {
        $users = User::all();
        return view('admin/assignRoles',[
            'users' => $users
        ]);
    }  
}
