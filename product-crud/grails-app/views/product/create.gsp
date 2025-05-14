<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">

        <g:set var="entityName" value="${message(code: 'product.label', default: 'Product')}" />
        <asset:javascript src="inputUtils.js"/>
        <title><g:message code="default.create.label" args="[entityName]" /></title>


    </head>
    <body>
    <div id="content" role="main">
        <div class="container py-5">
            <!-- Navigation  -->
            <section class="d-flex justify-content-between align-items-center mb-4">
                <h4 class="text-sm-5 text-secondary px-3 text-center">
                    <g:message code="default.create.label" args="[entityName]" default="Ajouter ${entityName}" />
                </h4>
                <g:link class="btn btn-info font-weight-bold" action="index">
                    <g:message code="default.list.label" args="[entityName]" default="Liste ${entityName}" />
                </g:link>
            </section>


            <!-- Formulaire d'ajout -->

            <section class="container">
                <div id="create-product" class="col-md-10 offset-md-1 col-lg-8 offset-lg-2" role="main">
                <!-- Message flash -->
                    <g:if test="${flash.message}">
                    <div class="alert alert-success" role="status">${flash.message}</div>
                    </g:if>

                <!-- Affichage des erreurs -->
                    <g:hasErrors bean="${this.product}">
                        <div class="alert alert-danger" role="alert">
                            <ul class="mb-0 list-unstyled" >
                                <g:eachError bean="${this.product}" var="error">
                                    <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                                </g:eachError>
                            </ul>
                        </div>
                    </g:hasErrors>

                <!-- Formulaire -->
                    <g:form resource="${this.product}" method="POST" class="needs-validation">
                        <div class="card  border mb-2">
                            <div class="card-body">
                                <fieldset class="form  p-2">
                                    <div class="form-row w-100">

                                        <!-- Champ Nom -->
                                        <div class="form-group col-12">
                                            <label for="name" class="text-secondary">
                                                <g:message code="label.product.name"/>
                                                <span class="text-danger">*</span>
                                            </label>

                                                <input type="text" name="name" value="${product?.name}" class="form-control w-100" required placeholder="${message(code: 'placeholder.product.name')}" />


                                            <div class="invalid-feedback">
                                                Veuillez saisir un nom valide.
                                            </div>
                                        </div>

                                        <!-- Champ Description -->
                                        <div class="form-group col-12">
                                            <label for="description" class="text-secondary">
                                                <g:message code="label.product.description"/>
                                            </label>
                                                <g:textArea name="description" value="${product?.description}" class="form-control" rows="3" placeholder="${message(code: 'placeholder.product.description')}" />
                                        </div>

                                        <!-- Champ Prix -->
                                        <div class="form-group col-12">
                                            <label for="price" class="text-secondary">
                                                <g:message code="label.product.price"/>
                                                <span class="text-danger">*</span>
                                            </label>
                                            <div class="input-group">

                                                <input type="number"
                                                       name="price"
                                                       value="${product?.price}"
                                                       class="form-control"
                                                       required="required"
                                                       step="0"
                                                       inputmode="decimal"
                                                       id="price"/>

                                                <div class="invalid-feedback">
                                                    Veuillez saisir un prix valide.
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                </fieldset>
                            </div>
                        </div>

                        <div class="mx-5">

                            <button type="submit" name="create" class="btn btn-info  w-50">
                                    <g:message code="default.button.create.label" encodeAs="raw"/>
                            </button>
                        </div>
                    </g:form>
                </div>
            </section>
        </div>
        </div>
    </body>
</html>
