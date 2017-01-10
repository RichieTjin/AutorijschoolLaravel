@if(Auth::check()) @if (Auth::user()->hasRole('Admin'))
@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row">
        <div class="col-md-10 col-md-offset-1">
            <div class="panel panel-default">
                <div class="panel-heading">Keuzemenu voor rol: administrator</div>

                <div class="panel-body">
                    Rollen:
                    <a href="/admin">Rollen wijzigen</a>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
@endif @endif
