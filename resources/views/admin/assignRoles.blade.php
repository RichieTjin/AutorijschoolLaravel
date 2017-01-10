@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row">
        <div class="col-md-10 col-md-offset-1">
            <div class="panel panel-default">
                <div class="panel-heading">rol toekenningen</div>

                <div class="panel-body">
                    <table>
                        <tr>
                            <td> </td>
                            <td> Admin </td>
                            <td> Default </td>
                            <td> Instructor </td>
                        </tr>

                            @foreach ($users as $user)
                            <form action="{{route('admin.assignRole')}}" method="POST" name="assignRoles">
                                {{csrf_field()}}
                                <tr> 
                                    <td> <input type="text" name="email" value="{{$user->email}}"> </td>
                                    <td> <input type="checkbox" name="admin_role" {{$user->hasRole('Admin') ? 'checked': "" }} > </td>
                                    <td> <input type="checkbox" name="default_role" {{ $user->hasRole('Default') ? 'checked': "" }}> </td>
                                    <td> <input type="checkbox" name="instructor_role" {{ $user->hasRole('Instructor') ? 'checked': "" }} > </td>
                                    <td> <button type="submit"> Assign </button> </td>
                                </tr>    
                                </form>
                            @endforeach
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection