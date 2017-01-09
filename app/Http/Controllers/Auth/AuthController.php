<?php

namespace App\Http\Controllers\Auth;

use App\User;
use App\Role;
use Validator;
use App\Http\Controllers\Controller;
use Illuminate\Foundation\Auth\ThrottlesLogins;
use Illuminate\Foundation\Auth\AuthenticatesAndRegistersUsers;

class AuthController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Registration & Login Controller
    |--------------------------------------------------------------------------
    |
    | This controller handles the registration of new users, as well as the
    | authentication of existing users. By default, this controller uses
    | a simple trait to add these behaviors. Why don't you explore it?
    |
    */

    use AuthenticatesAndRegistersUsers, ThrottlesLogins;

    /**
     * Where to redirect users after login / registration.
     *
     * @var string
     */
    protected $redirectTo = '/';

    /**
     * Create a new authentication controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware($this->guestMiddleware(), ['except' => 'logout']);
    }

    /**
     * Get a validator for an incoming registration request.
     *
     * @param  array  $data
     * @return \Illuminate\Contracts\Validation\Validator
     */
    protected function validator(array $data)
    {
        return Validator::make($data, [
            'name' => 'required|max:50',
            'tussenv' => 'max:10',
            'achternaam' => 'required|max:50',
            'geboortedatum' => 'required',
            'geslacht' => 'required',
            'adres' => 'required|max:100',
            'huisnr' => 'required|max:20',
            'postcode' => 'required|max:8',
            'plaats' => 'required|max:100',
            'telefoon' => 'required|max:12',
            'email' => 'required|email|max:255|unique:users',
            'password' => 'required|min:6|confirmed',
        ]);
    }

    /**
     * Create a new user instance after a valid registration.
     *
     * @param  array  $data
     * @return User
     */
    protected function create(array $data)
    {
        $user = User::create([
            'name' => $data['name'],
            'tussenv' => $data['tussenv'],
            'achternaam' => $data['achternaam'],
            'geboortedatum' => $data['geboortedatum'],
            'geslacht' => $data['geslacht'],
            'adres' => $data['adres'],
            'huisnr' => $data['huisnr'],
            'postcode' => $data['postcode'],
            'plaats' => $data['plaats'],
            'telefoon' => $data['telefoon'],
            'email' => $data['email'],
            'password' => bcrypt($data['password']),
        ]);
        
        $user->roles()->attach(Role::where('name', 'Default')->first());
        
        return $user;
    }
}
