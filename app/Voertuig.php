<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Voertuig extends Model
{
    protected $table = 'voertuigen';
    protected $primaryKey = 'kenteken';
    public $incrementing = false;
    public $timestamps = false;
}