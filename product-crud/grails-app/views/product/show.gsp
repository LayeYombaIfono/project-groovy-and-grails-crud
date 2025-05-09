<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'product.label', default: 'Product')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
    <div id="content" role="main">
        <div class="container py-5">
            <section class="d-flex justify-content-between align-items-center  p-2">
                <a href="#show-product" class="skip-link text-secondary text-decoration-none" tabindex="-1"><g:message code="default.link.skip.label" default="Aller au content&hellip;"/></a>
                <div class="nav" role="navigation">
                    <ul class="nav list-unstyled mb-0">
                        <li class="mx-3">
                            <a class="text-decoration-none text-secondary font-weight-bold" href="${createLink(uri: '/')}">
                                <g:message code="default.home.label" default="Acceuil"/>
                            </a>
                        </li>
                        <li class="mx-3">
                            <g:link class="text-decoration-none text-secondary font-weight-bold" action="index">
                                <g:message code="default.list.label" args="[entityName]" />
                            </g:link>
                        </li>
                        <li>
                            <g:link class="text-decoration-none text-secondary font-weight-bold" action="create">
                                <g:message code="default.new.label" args="[entityName]" />
                            </g:link>
                        </li>
                    </ul>
                </div>
            </section>

            <!-- Detail produit  -->
            <section class="row mt-4">
                <div id="show-product" class="col-12 content scaffold-show" role="main">
                    <div class="card">
                        <div class="card-header d-flex justify-content-between align-items-center">
                            <h1 class="h4 mb-0 text-secondary">
                                <i class="fas fa-cube"></i>
                                <g:message code="default.show.label" args="[entityName]" />
                            </h1>
                            <div class="action-buttons">
                                <g:link class="btn btn-primary btn-sm" action="edit" resource="${this.product}">
                                    <i class="fas fa-edit"></i>
                                    <g:message code="default.button.edit.label" default="Edit" />
                                </g:link>
                                <g:link controller="product" action="exportXml" id="${product?.id}" class="btn btn-info btn-sm">
                                    <i class="fas fa-file-export"></i>
                                    Export XML
                                </g:link>
                                <g:form resource="${this.product}" method="DELETE" class="d-inline">
                                    <button type="submit" class="btn btn-danger btn-sm"
                                            onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');">
                                        <i class="fas fa-trash-alt"></i>
                                        <g:message code="default.button.delete.label" default="Delete" />
                                    </button>
                                </g:form>
                            </div>
                        </div>

                        <div class="card-body">
                            <g:if test="${flash.message}">
                                <div class="alert alert-info alert-dismissible fade show" role="alert">
                                    ${flash.message}
                                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                            </g:if>

                            <div class="product-details text-black">
                                <p>Nom du produit : ${product.name}</p>
                                <p>Description : ${product.description}</p>
                                <p>Prix: ${product.price}</p>
                            </div>
                        </div>
                    </div>
                </div>
            </section>


        </div>
    </div>
    </body>
</html>
