<?php

use Illuminate\Database\Seeder;
use App\Role;

class RoleTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $role_user = new Role();
        $role_user->name = 'User';
        $role_user->description = 'Normal user';
        $role_user->save();
        
        $role_author = new Role();
        $role_user->name = 'Author';
        $role_user->description = 'An Instructor';
        $role_user->save();

        $role_admin = new Role();
        $role_user->name = 'Admin';
        $role_user->description = 'A Admin';
        $role_user->save();        
    }
}
