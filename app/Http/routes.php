<?php

/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It's a breeze. Simply tell Laravel the URIs it should respond to
| and give it the controller to call when that URI is requested.
|
*/

Route::get('/', function () {
    return view('welcome');
});

Route::get('/instructor',[
    'uses' => 'InstructorController@getInstructorPage',
    'as' => 'instructor',
    'middleware' => 'roles',
    'roles' => ['admin', 'instructor']
]);

Route::get('/admin',[
    'uses' => 'adminController@getAdminPage',
    'as' => 'admin',
    'middleware' => 'roles',
    'roles' => ['admin']
]);

Route::get('/admin/voertuigen',[
    'uses' => 'voertuigController@getVoertuigPage',
    'as' => 'admin.voertuigen',
    'middleware' => 'roles',
    'roles' => ['admin']
]);

Route::post('/admin/voertuigen', [
    'uses' => 'voertuigController@edit',
    'as' => 'admin.editVoertuig',
    'middleware' => 'roles',
    'roles' => ['admin']
]);

Route::get('/admin/createVoertuig', [
    'uses' => 'voertuigController@getCreatePage',
    'as' => 'admin.createVoertuigIndex',
    'middleware' => 'roles',
    'roles' => ['admin']    
]);

Route::post('/admin/createVoertuig',[
    'uses' => 'voertuigController@create',
    'as' => 'admin.createVoertuig',
    'middleware' => 'roles',
    'roles' => ['admin']      
]);

Route::post('/admin/assign-roles', [
    'uses' => 'HomeController@postAdminAssignRoles',
    'as' => 'admin.assignRole',
    'middleware' => 'roles',
    'roles' => ['admin']
]);

Route::auth();

Route::get('/home', 'HomeController@index');
