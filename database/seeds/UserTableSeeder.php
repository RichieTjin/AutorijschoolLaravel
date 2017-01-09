<?php

use Illuminate\Database\Seeder;

class UserTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $role_user = Role::where('name', 'User')->first();
        $role_author = Role::where('name', 'Author')->first();
        $role_admin = Role::where('name', 'Admin')->first();
        
        $user = new User();
        $user->roles()->attach($role_user);
        
        $admin = new User();
        $admin->roles()->attach($role_admin);
        
        $author = new User();
        $author->roles()->attach($role_author);
    }
}
