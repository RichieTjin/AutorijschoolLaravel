<?php

namespace App\Http\Controllers;

use App\Http\Requests;
use Illuminate\Http\Request;
use App\Role;
use App\User;
use App\Voertuig;

class instructorController extends controller {
    
    public function getInstructorPage()
    {
        $users = User::all();
        return view('instructor/instructor',[
            'user' => $users
        ]);
    }    
}
