<?php

namespace App\Http\Middleware;

use Closure;

class CheckRole
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {
        if($request->user() === NULL) {
            return response('Insufficient permission', 401);
        }
        $actions = $request->route()->getAction();
        $roles = isset($actions['roles']) ? $actions['roles'] : NULL;
        
        if($request->user()->hasAnyRole($roles) || !$roles){
            return $next($request);
        }
        return response('Insufficient permission', 401);
    }
}
