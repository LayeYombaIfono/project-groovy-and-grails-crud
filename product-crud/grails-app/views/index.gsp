<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>GESTION DES PRODUITS</title>

</head>
<body>


<br>
<br>
<br>
<br>
<br>

<div class="container mt-5 text-center">

            <h1 class="text-info text-center text-uppercase font-weight-bold text-monospace">
                Welcome to my first groovy and grails app
            </h1>

            <p class="text-black-50 text-wrap text-monospace">
                Gestion des produits  simple et efficace avec my app product <br>
                I heard you like definition lists. <br>
                Let me put a definition list inside your definition list.<br>
                Let me put a definition list inside your definition list.<br>
            </p>


    <ul class="list-unstyled row text-center d-flex justify-content-center align-items-center mt-3">
        <g:each in="${grailsApplication.controllerClasses.sort { it.fullName } }" var="c">
            <li class="col-md-3 col-sm-4 col-6 mb-3">
                <g:link controller="${c.logicalPropertyName}"
                        class="btn btn-info btn-block text-truncate text-center"
                        title="${c.fullName}">
                    ${c.logicalPropertyName.capitalize()}
                </g:link>
            </li>
        </g:each>
    </ul>

</div>

</body>
</html>
