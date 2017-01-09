@extends('layouts.app')

@section('content')
<div class="hallo"> </div>
<div class="container">
    <div class="row">
        <div class="col-md-10 col-md-offset-1">
            <div class="panel panel-default">
                <div class="panel-heading">Dashboard</div>

                <div class="panel-body">
                    <table class="table table-striped">
                        <form method="POST" action="{{ url('/admin/voertuigen') }}" class="nonStyleForm" readonly>
                            {{csrf_field()}}
                            <tr> 
                                <th> Kenteken </th>
                                <th> Merk </th>
                                <th> Aankoopdatum </th>
                                <th> Lestype </th>   
                                <th> Edit </th>
                                <th> Delete </th>
                            </tr>
                            @foreach ($voertuig as $voertuigen)
                            <tr>
                                <td> <input type="text" name="kenteken" value="{{$voertuigen->kenteken}}" readonly> </td>
                                <td> <input type="text" name="merk" value="{{$voertuigen->merk}}"readonly> </td>
                                <td> <input type="date" name="aankoopdatum" value="{{$voertuigen->aankoopdatum}}"readonly> </td>
                                <td> <input type="text" name="lestype" value="{{$voertuigen->lestype_id}}"readonly> </td>
                                <td> <button type="button" class="btn btn-warning btn-xs" data-toggle="modal" data-target="#myModal_{{ $voertuigen->kenteken }}"> Edit </button> </td>
                                <td> <input type="submit" name="delete" class="btn btn-xs btn-danger" value="Delete"> </td></td>
                                
                            </tr>
                            @endforeach
                        </form>
                    </table>
                    <a href="/admin/createVoertuig">
                        <button type="submit" class="btn btn-primary btn-sm pull-right">
                            <i class="fa fa-btn fa-car"></i> Add voertuig
                        </button>
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>

@foreach ($voertuig as $voertuigen)
<div class="modal fade" tabindex="-1" role="dialog" id="myModal_{{ $voertuigen->kenteken }}">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title"> <b> {{$voertuigen->kenteken}} </b></h4>
      </div>
      <div class="modal-body">
        <table class="table table-striped">
            <form method="POST" action="{{ url('/admin/voertuigen') }}" class="nonStyleForm" readonly>
                {{csrf_field()}}
                <tr> 
                    <th> Kenteken </th>
                    <th> Merk </th>
                    <th> Aankoopdatum </th>
                    <th> Lestype </th>   
                </tr>
                <tr>
                    <td> <input type="text" name="kentekenModal" value="{{$voertuigen->kenteken}}" > </td>
                    <td> <input type="text" name="merkModal" value="{{$voertuigen->merk}}"> </td>
                    <td> <input type="date" name="aankoopdatumModal" value="{{$voertuigen->aankoopdatum}}"> </td>
                    <td> <input type="text" name="lestypeModal" value="{{$voertuigen->lestype_id}}"> </td>

                </tr>
        </table>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <input type="submit" name="edit" class="btn btn-primary" value="Save changes">
        </form>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
@endforeach

@endsection
