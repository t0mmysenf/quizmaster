<!doctype html>
<html lang="{{ app()->getLocale() }}">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <title>QU!Z</title>

    <link href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,500,700,900|Material+Icons" rel="stylesheet"
          type="text/css">
    <link href="/css/app.css" rel="stylesheet" type="text/css">
</head>
<body>
<div id="app-x">
    <app id="app"/>
</div>
<script src="/js/vueapp.js" type="text/javascript"></script>
</body>
</html>