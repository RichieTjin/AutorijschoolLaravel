@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row">
        <div class="col-md-8 col-md-offset-2">
            <div class="panel panel-default">
                <div class="panel-heading">Register</div>
                <div class="panel-body">
                    <form class="form-horizontal" role="form" method="POST" action="{{ url('/register') }}">
                        {{ csrf_field() }}

                        <div class="form-group{{ $errors->has('name') ? ' has-error' : '' }}">
                            <label for="name" class="col-md-4 control-label">Name *</label>

                            <div class="col-md-6">
                                <input id="name" type="text" class="form-control" name="name" value="{{ old('name') }}">

                                @if ($errors->has('name'))
                                    <span class="help-block">
                                        <strong>{{ $errors->first('name') }}</strong>
                                    </span>
                                @endif
                            </div>
                        </div>
                        
                        <div class="form-group{{ $errors->has('tussenv') ? ' has-error' : '' }}">
                            <label for="name" class="col-md-4 control-label">Tussenvoegsel</label>

                            <div class="col-md-6">
                                <input id="name" type="text" class="form-control" name="tussenv" value="{{ old('tussenv') }}">

                                @if ($errors->has('tussenv'))
                                    <span class="help-block">
                                        <strong>{{ $errors->first('tussenv') }}</strong>
                                    </span>
                                @endif
                            </div>
                        </div> 
                        
                        <div class="form-group{{ $errors->has('achternaam') ? ' has-error' : '' }}">
                            <label for="name" class="col-md-4 control-label"> Achternaam * </label>

                            <div class="col-md-6">
                                <input id="name" type="text" class="form-control" name="achternaam" value="{{ old('achternaam') }}">

                                @if ($errors->has('achternaam'))
                                    <span class="help-block">
                                        <strong>{{ $errors->first('achternaam') }}</strong>
                                    </span>
                                @endif
                            </div>
                        </div>
                        
                        <div class="form-group{{ $errors->has('geboortedatum') ? ' has-error' : '' }}">
                            <label for="name" class="col-md-4 control-label"> geboortedatum * </label>

                            <div class="col-md-6">
                                <input id="name" type="date" class="form-control" name="geboortedatum" value="{{ old('geboortedatum') }}">

                                @if ($errors->has('geboortedatum'))
                                    <span class="help-block">
                                        <strong>{{ $errors->first('geboortedatum') }}</strong>
                                    </span>
                                @endif
                            </div>
                        </div>                        
                        
                        <div class="form-group{{ $errors->has('geslacht') ? ' has-error' : '' }}">
                            <label for="name" class="col-md-4 control-label"> geslacht *</label>

                            <div class="col-md-6">
                                M <input id="name" type="radio" class="" name="geslacht" value="M"> 
                                
                                V <input id="name" type="radio" class="" name="geslacht" value="V">

                                @if ($errors->has('geslacht'))
                                    <span class="help-block">
                                        <strong>{{ $errors->first('geslacht') }}</strong>
                                    </span>
                                @endif
                            </div>
                        </div>   

                        <div class="form-group{{ $errors->has('adres') ? ' has-error' : '' }}">
                            <label for="name" class="col-md-4 control-label"> adres *</label>

                            <div class="col-md-6">
                                <input id="name" type="text" class="form-control" name="adres" value="{{ old('adres') }}">

                                @if ($errors->has('adres'))
                                    <span class="help-block">
                                        <strong>{{ $errors->first('adres') }}</strong>
                                    </span>
                                @endif
                            </div>
                        </div>        
                        
                        <div class="form-group{{ $errors->has('huisnr') ? ' has-error' : '' }}">
                            <label for="name" class="col-md-4 control-label"> huisnr *</label>

                            <div class="col-md-6">
                                <input id="name" type="text" class="form-control" name="huisnr" value="{{ old('huisnr') }}">

                                @if ($errors->has('huisnr'))
                                    <span class="help-block">
                                        <strong>{{ $errors->first('huisnr') }}</strong>
                                    </span>
                                @endif
                            </div>
                        </div>   
                        
                        <div class="form-group{{ $errors->has('postcode') ? ' has-error' : '' }}">
                            <label for="name" class="col-md-4 control-label"> postcode *</label>

                            <div class="col-md-6">
                                <input id="name" type="text" class="form-control" name="postcode" value="{{ old('postcode') }}">

                                @if ($errors->has('postcode'))
                                    <span class="help-block">
                                        <strong>{{ $errors->first('postcode') }}</strong>
                                    </span>
                                @endif
                            </div>
                        </div>    
                        
                         <div class="form-group{{ $errors->has('plaats') ? ' has-error' : '' }}">
                            <label for="name" class="col-md-4 control-label"> plaats *</label>

                            <div class="col-md-6">
                                <input id="name" type="text" class="form-control" name="plaats" value="{{ old('plaats') }}">

                                @if ($errors->has('plaats'))
                                    <span class="help-block">
                                        <strong>{{ $errors->first('plaats') }}</strong>
                                    </span>
                                @endif
                            </div>
                        </div>   
                        
                        <div class="form-group{{ $errors->has('telefoon') ? ' has-error' : '' }}">
                            <label for="name" class="col-md-4 control-label"> telefoon *</label>

                            <div class="col-md-6">
                                <input id="name" type="text" class="form-control" name="telefoon" value="{{ old('telefoon') }}">

                                @if ($errors->has('telefoon'))
                                    <span class="help-block">
                                        <strong>{{ $errors->first('telefoon') }}</strong>
                                    </span>
                                @endif
                            </div>
                        </div>   
                        
                        <div class="form-group{{ $errors->has('email') ? ' has-error' : '' }}">
                            <label for="email" class="col-md-4 control-label">E-Mail Address *</label>

                            <div class="col-md-6">
                                <input id="email" type="email" class="form-control" name="email" value="{{ old('email') }}">

                                @if ($errors->has('email'))
                                    <span class="help-block">
                                        <strong>{{ $errors->first('email') }}</strong>
                                    </span>
                                @endif
                            </div>
                        </div>

                        <div class="form-group{{ $errors->has('password') ? ' has-error' : '' }}">
                            <label for="password" class="col-md-4 control-label">Password *</label>

                            <div class="col-md-6">
                                <input id="password" type="password" class="form-control" name="password">

                                @if ($errors->has('password'))
                                    <span class="help-block">
                                        <strong>{{ $errors->first('password') }}</strong>
                                    </span>
                                @endif
                            </div>
                        </div>

                        <div class="form-group{{ $errors->has('password_confirmation') ? ' has-error' : '' }}">
                            <label for="password-confirm" class="col-md-4 control-label">Confirm Password *</label>

                            <div class="col-md-6">
                                <input id="password-confirm" type="password" class="form-control" name="password_confirmation">

                                @if ($errors->has('password_confirmation'))
                                    <span class="help-block">
                                        <strong>{{ $errors->first('password_confirmation') }}</strong>
                                    </span>
                                @endif
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-md-6 col-md-offset-4">
                                <button type="submit" class="btn btn-primary">
                                    <i class="fa fa-btn fa-user"></i> Register
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
