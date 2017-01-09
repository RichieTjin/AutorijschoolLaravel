<?php
namespace App\Http\Controllers;

use App\Http\Requests;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Role;
use App\User;
use Illuminate\Support\Facades\Validator;
use App\Voertuig;
use App\Lestype;


class voertuigController extends controller {
    
    public function getVoertuigPage()
    {
        $users = User::all();
        $voertuig = Voertuig::all()->where('deleted', 0);
        return view('admin/voertuigen',[
            'user' => $users,
            'voertuig' => $voertuig
        ]);
    }
    public function getCreatePage()
    {
        $lestype = Lestype::all();
        return view('admin/createVoertuig',[
            'lestypes' => $lestype
        ]);
    }    
    
    public function edit(Request $request) 
    {
        $edit = $request->input('edit');
        $delete = $request->input('delete');
        
        if(isset($edit)){
            $users = User::all();
            $voertuig = Voertuig::all()->where('deleted', 0);    
                
            $validatorModal =  Validator::make($request->all(), [
                'kentekenModal' => 'required|max:8|min:8',
                'merkModal' => 'required|max:30|min:3',
                'aankoopdatumModal' => 'required|max:10|min:10'
            ]);
        
            if ($validatorModal->fails()){
                $errors =  $validatorModal->errors();
                return view('admin/voertuigen',[
                    'user' => $users,
                    'voertuig' => $voertuig,
                    'errors' => $errors
                ]);
                }
            else {
                $voertuig = Voertuig::find($request->kentekenModal);
                $voertuig->kenteken = $request->kentekenModal;
                $voertuig->merk = $request->merkModal;   
                $voertuig->aankoopdatum = $request->aankoopdatumModal;
                $voertuig->lestype_id = $request->lestypeModal;
                $voertuig->save();
                
                $users = User::all();
                $voertuig = Voertuig::all()->where('deleted', 0);               
                return view('admin/voertuigen',[
                    'user' => $users,
                    'voertuig' => $voertuig
                ]);   
            }
        }
        
        if(isset($delete)){
            $voertuig = Voertuig::find($request->kenteken);
            $voertuig->deleted = 1;
            $voertuig->save();

            return view('admin/voertuigen',[
                'user' => $users,
                'voertuig' => $voertuig
            ]);            
        }        
    }
    
    protected function create(Request $request)
    {
        $lestype = Lestype::all();
        
        $users = User::all();
        $voertuig = Voertuig::all()->where('deleted', 0);
        $validator =  Validator::make($request->all(), [
            'kenteken' => 'required|max:8|min:8',
            'merk' => 'required|max:30|min:3',
            'aankoopdatum' => 'required|max:10|min:10'
        ]);
        if ($validator->fails()){
            var_dump($validator->failed());
            $errors =  $validator->errors();
            return view('admin/createVoertuig',[
               'lestypes' => $lestype,
               'errors' => $errors
            ]);
        }
        else {
            try {
            $voertuig = new voertuig();
            $voertuig->kenteken = $request->kenteken;
            $voertuig->merk = $request->merk;   
            $voertuig->aankoopdatum = $request->aankoopdatum;
            $voertuig->lestype_id = $request->lestype;
            $voertuig->deleted = 0;
            $voertuig->save();

            $users = User::all();
            $voertuig = Voertuig::all()->where('deleted', 0);
            return view('admin/voertuigen',[
                'user' => $users,
                'voertuig' => $voertuig
            ]);  
            }

            catch(\Illuminate\Database\QueryException $ex){
                if($ex->getCode() == 23000){ 
                return view('admin/createVoertuig',[
                    'errorMsg' => 'Duplicate kenteken found',
                    'lestypes' => $lestype
                ]);
            }
        }
      }
    }
}