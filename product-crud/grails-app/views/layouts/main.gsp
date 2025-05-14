<%@ page contentType="text/html;charset=UTF-8" %>
<!doctype html>
<html lang="en" class="no-js">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <g:layoutHead/>
    <title>
        <g:layoutTitle default="Grails"/>
    </title>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
</head>

<body >
<nav class="navbar navbar-expand-lg navbar-light bg-info shadow-sm">
    <div class="container-fluid">
        <a class="navbar-brand text-white font-weight-bold" href="${createLink(uri: '/')}">
            <g:message code="app.title" />
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse d-flex justify-content-between" id="navbarNav">
            <div class="letf"></div>
            <ul class="navbar-nav">
                <li class="mx-3">
                    <a class="nav-link text-decoration-none text-white font-weight-bold" href="${createLink(uri: '/')}">
                        <g:message code="default.home.label"/>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link text-white font-weight-bold" href="${createLink(controller: 'product', action: 'create')}">
                        <g:message code="default.add.label"/>
                    </a>

                </li>
                <li class="nav-item ml-3">
                    <a class="nav-link text-white font-weight-bold" href="?lang=fr">
                        <img src="${assetPath(src: 'flags/fr.svg')}" width="18" height="15" alt="FR" />
                        FR
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link text-white font-weight-bold" href="?lang=en">
                        <img src="${assetPath(src: 'flags/gb.svg')}" width="18" height="15" alt="EN" />
                        EN
                    </a>
                </li>

            </ul>



        </div>
    </div>
</nav>


<div class="container mt-2 h-100 mb-5">
    <g:layoutBody/>
</div>


 <footer class="bg-dark mt-5">
     <div class="container">
         <p class="text-center text-white pt-5">Design by IFONO-DEV</p>
     </div>
     <br>
     <br>
     <br>
     <br>
     <br>
 </footer>


<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
