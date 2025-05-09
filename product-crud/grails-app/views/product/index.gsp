<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'product.label', default: 'Product')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">

    </head>
    <body>

    <div id="content" role="main">
        <div class="container py-4">

            <!-- Navigation -->
            <section class="d-flex justify-content-between align-items-center mb-4 ">
                <a href="#list-product" class="skip-link text-decoration-none text-secondary" tabindex="-1">
                    <g:message code="default.link.skip.label" default="Aller au content&hellip;"/>
                </a>
                <div class="nav" role="navigation">
                    <ul class="nav d-flex align-items-center list-unstyled mb-0">
                        <li class="nav">
                            <a class="nav-link text-secondary font-weight-bold" href="${createLink(uri: '/')}">
                                <g:message code="default.home.label" default="Acceuil"/>
                            </a>
                        </li>
                        <li class="nav">
                            <g:link class="nav-link text-secondary font-weight-bold" action="create">
                                <g:message code="default.new.label" args="[entityName]" default="Ajouter ${entityName}"/>

                            </g:link>
                        </li>
                    </ul>
                </div>
            </section>

            <!-- Liste des produits -->
            <section class="row">
                <div id="list-product" class="col-12 content scaffold-list" role="region" aria-label="Liste des produits">
                    <h1 class="mb-4 text-secondary">
                        Liste des produits
                    </h1>
                    <g:if test="${flash.message}">
                        <div class="alert alert-info" role="status">${flash.message}</div>
                    </g:if>
                <!-- Tableau responsive Bootstrap -->
                    <div class="table-responsive">
                        <table class="table table-bordered table-hover shadow-sm">
                            <thead class="thead-light">
                             <tr>
                                <th>Nom</th>
                                 <th>Description</th>
                                 <th>Prix</th>
                                 <th>Action</th>

                             </tr>
                            </thead>

                            <tbody>
                               <g:each in="${productList}" var="product">
                                   <tr>
                                       <td> ${product.name} </td>
                                       <td> ${product.description} </td>
                                       <td> ${product.price} </td>
                                       <td>
                                           <g:link class="btn btn-sm btn-outline-primary" action="show" id="${product.id}">
                                               Voir
                                           </g:link>
                                           <g:link class="btn btn-sm btn-outline-secondary" action="edit" id="${product.id}">Modifier</g:link>
                                           <g:form action="delete" method="DELETE" params="[id: product.id]" class="d-inline">
                                               <g:submitButton name="delete" class="btn btn-sm btn-outline-danger" value="Supprimer" />
                                           </g:form>
                                       </td>

                                   </tr>
                               </g:each>
                            </tbody>

                        </table>
                    </div>

                    <g:if test="${productCount > params.int('max')}">
                    <div class="mt-4" aria-label="pagination">
                        <g:paginate total="${productCount ?: 0}" />
                    </div>
                    </g:if>
                </div>
            </section>
        </div>
    </div>
    </body>
</html>