<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>GESTION DES PRODUITS</title>
</head>
<body>
<content tag="nav">
    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
            <a class="nav-link active" aria-current="page" href="#">Accueil</a>
        </li>
        <g:each var="c" in="${grailsApplication.controllerClasses.sort { it.fullName } }">
            <li class="controller">
                <g:link controller="${c.logicalPropertyName}">${c.fullName}</g:link>
            </li>
        </g:each>
</content>

<div class="svg" role="presentation">
    <div class="grails-logo-container">
        <asset:image src="grails-cupsonly-logo-white.svg" class="grails-logo"/>
    </div>
</div>

<div id="content" role="main">
    <div class="container">
        <section class="row colset-2-its">
            <h1>Bienvenue sur app-product</h1>

            <p>
                Congratulations, you have successfully started your first Grails application! At the moment
                this is the default page, feel free to modify it to either redirect to a controller or display
                whatever content you may choose. Below is a list of controllers that are currently deployed in
                this application, click on each to execute its default action:
            </p>

            <div id="controllers" role="navigation">
                <h2>Available Controllers:</h2>
                <ul>

                </ul>
            </div>
        </section>
    </div>
</div>

</body>
</html>
