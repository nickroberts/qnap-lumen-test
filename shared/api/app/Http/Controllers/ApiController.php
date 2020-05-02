<?php

namespace App\Http\Controllers;


class ApiController extends Controller
{
    /**
     * Retrieve the user for the given ID.
     *
     * @param  int  $id
     * @return Response
     */
    public function version()
    {
        return response()->json(['version' => $app->version()]);
    }
}
