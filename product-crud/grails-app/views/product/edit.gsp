<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />

        <g:set var="entityName" value="${message(code: 'product.label', default: 'Product')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
        <asset:javascript src="inputUtils.js"/>

    </head>
    <body>

        <div class="container my-5">

            <section class="row d-flex justify-content-between align-items-center mx-2">
                <h4 class=" mb-3 text-secondary">
                    <g:message code="default.edit.label" args="[entityName]" />
                </h4>
                <div class="nav" role="navigation">
                    <ul class="nav list-unstyled mb-0">
                        <li>
                            <g:link class="nav-link btn-info btn text-decoration-none text-white " action="index">
                                <g:message code="default.list.label" args="[entityName]" />
                            </g:link>
                        </li>
                    </ul>
                </div>
            </section>

            <section class="row mt-3">
                <div id="edit-product" class="col-12 content scaffold-edit" role="main">
                    <g:if test="${flash.message}">
                        <div class="message" role="status">${flash.message}</div>
                    </g:if>
                    <g:hasErrors bean="${this.product}">
                        <ul class="alert alert-danger list-unstyled" role="alert">
                            <g:eachError bean="${this.product}" var="error">
                                <li  <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                            </g:eachError>
                        </ul>
                    </g:hasErrors>

                <!--Formulaire de modification-->

                        <g:form resource="${this.product}" method="PUT">
                            <div class="card  border">
                                <div class="card-body">
                                    <fieldset class="form">
                                        <div class="form-row">

                                            <!-- Champ Nom -->
                                            <div class="form-group col-12  w-100">
                                                    <label for="name" class="text-secondary">
                                                        <g:message code="label.product.name"/>
                                                        <span class="text-danger">*</span>
                                                    </label>
                                                    <input name="name" value="${product?.name}" class="form-control" required="required" placeholder="Entrer le nom du produit" />
                                                <div class="invalid-feedback">
                                                    Veuillez saisir un nom valide.
                                                </div>
                                            </div>

                                            <!-- Champ Description -->
                                            <div class="form-group col-12">
                                            <label for="description" class="text-secondary">
                                                <g:message code="label.product.description"/>
                                            </label>
                                                <g:textArea name="description" value="${product?.description}" class="form-control" rows="3"/>
                                            </div>

                                            <!-- Champ Prix -->
                                            <div class="form-group col-12">
                                                <label for="price" class="text-secondary">
                                                    <g:message code="label.product.price"/>
                                                    <span class="text-danger">*</span>
                                                </label>
                                                <div class="input-group">

                                                    <input name="price"
                                                           value="${product?.price}"
                                                           class="form-control"
                                                           required="required"
                                                           type="number"
                                                           step="0.01"
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
                            <fieldset class="buttons mx-2 col-md-6 mt-3">
                                <button class="btn btn-outline-info  w-50" type="submit">
                                    <i class="fa-solid fa-pen-to-square"></i>
                                    <g:message code="default.button.update.label"/>
                                </button>
                            </fieldset>
                        </g:form>
                    </div>

            </section>
        </div>
        <br>
        <br>
        <br>

    </body>
</html>
