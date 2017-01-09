@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row">
        <div class="col-md-8 col-md-offset-2">
            <div class="panel panel-default">
                <div class="panel-heading">Voertuig aanmaken</div>
                <div class="panel-body">
                    <form class="form-horizontal" role="form" method="POST" action="{{ url('/admin/createVoertuig') }}">
                        {{ csrf_field() }}

                        <div class="form-group{{ $errors->has('kenteken') ? ' has-error' : '' }}">
                            <label for="kenteken" class="col-md-4 control-label">Kenteken *</label>

                            <div class="col-md-6">
                                <input id="name" type="text" class="form-control" name="kenteken" value="{{ old('kenteken') }}">

                                @if ($errors->has('kenteken'))
                                    <span class="help-block">
                                        <strong>{{ $errors->first('kenteken') }}</strong>
                                    </span>
                                @endif
                            </div>
                        </div>
                        
                        <div class="form-group{{ $errors->has('merk') ? ' has-error' : '' }}">
                            <label for="merk" class="col-md-4 control-label">Merk *</label>

                            <div class="col-md-6">
                                <input id="name" type="text" class="form-control" name="merk" value="{{ old('merk') }}">

                                @if ($errors->has('merk'))
                                    <span class="help-block">
                                        <strong>{{ $errors->first('merk') }}</strong>
                                    </span>
                                @endif
                            </div>
                        </div>
                        <div class="form-group{{ $errors->has('aankoopdatum') ? ' has-error' : '' }}">
                            <label for="aankoopdatum" class="col-md-4 control-label"> Aankoopdatum * </label>

                            <div class="col-md-6">
                                <input id="name" type="date" class="form-control" name="aankoopdatum" value="{{ old('aankoopdatum') }}">

                                @if ($errors->has('aankoopdatum'))
                                    <span class="help-block">
                                        <strong>{{ $errors->first('aankoopdatum') }}</strong>
                                    </span>
                                @endif
                            </div>
                        </div> 
                        <div class="form-group{{ $errors->has('lestypes') ? ' has-error' : '' }}">
                            <label for="name" class="col-md-4 control-label">Lestype *</label>

                            <div class="col-md-6">
                                <select name="lestype" class="form-control">
                                    @foreach ($lestypes as $lestype)
                                    <option value="{{$lestype->lestype_id}}"> {{$lestype->lestype}} </option>
                                    @endforeach
                                </select>

                                @if ($errors->has('name'))
                                    <span class="help-block">
                                        <strong>{{ $errors->first('name') }}</strong>
                                    </span>
                                @endif
                            </div>
                        </div>                        
                        
                        <div class="form-group">
                            <div class="col-md-3 col-md-offset-4">
                                <button type="submit" class="btn btn-primary">
                                    <i class="fa fa-btn fa-car"></i> Aanmaken
                                </button>
                            </div>
                            <div class="col-md-3 pull-right">
                                <a href="/admin/voertuigen">
                                    <i class="fa fa-long-arrow-left" aria-hidden="true"></i> Back
                                </a>
                            </div>
                        </div>
                        @if (isset($errorMsg))
                            <div> Duplicate found </div>
                        @endif
                        
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection

