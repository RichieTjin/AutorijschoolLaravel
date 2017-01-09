<?php

namespace App\Http\Controllers;

use App\Http\Requests;
use Illuminate\Http\Request;
use App\Role;
use App\User;

class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $users = User::all();
        return view('home',[
            'users' => $users
        ]);
    }
    
    public function postAdminAssignRoles(Request $request){
        $user = User::where('email', $request->input('email'))->first();
        $user->roles()->detach();   
        
        if($request['default_role']){
            $user->roles()->attach(Role::where('name', 'Default')->first());
        }
        
        if($request['admin_role']){
            $user->roles()->attach(Role::where('name', 'Admin')->first());
        }
        
        if($request['instructor_role']){
            $user->roles()->attach(Role::where('name', 'Instructor')->first());
        }
        
        return redirect()->back();
    }
}
