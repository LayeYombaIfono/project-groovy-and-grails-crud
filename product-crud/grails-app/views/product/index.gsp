<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'product.label', default: 'Product')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">

    </head>
    <body>

    <div class="mt-4" id="content" role="main">
        <div class="container py-4">

            <h4 class="py-4 fs-5 text-secondary text-center">
                <g:message code="default.list.label" encodeAs="row"/>
            </h4>


            <!-- Liste des produits -->
            <section class="row">
                <div id="list-product" class="col-12 content scaffold-list" role="region" aria-label="Liste des produits">

                    <g:if test="${flash.message}">
                        <div class="alert alert-info" role="status">${flash.message}</div>
                    </g:if>
                <!-- Tableau responsive Bootstrap -->
                  <div class="card border shadow-sm">
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-bordered table-hover shadow-sm">
                                <thead class="thead-light">
                                <tr>
                                    <th>
                                        <g:message code="table.header.name"/>
                                    </th>
                                    <th>
                                        <g:message code="table.header.description"/>
                                    </th>
                                    <th>
                                        <g:message code="table.header.price"/>
                                    </th>
                                    <th>
                                        <g:message code="table.header.action"/>
                                    </th>

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
                                                <i class="fa-solid fa-eye"></i>
                                                <g:message code="default.show.label"/>
                                            </g:link>
                                            <g:link class="btn btn-sm btn-outline-info" action="edit" id="${product.id}">
                                                <i class="fa-solid fa-pen-to-square"></i>
                                                <g:message code="default.button.edit.label"/>
                                            </g:link>
                                            <g:link class="btn btn-sm btn-outline-danger" action="delete" method="DELETE" params="[id: product.id]" >
                                                <i class="fa-solid fa-trash"></i>
                                                <g:message code="default.button.delete.label"/>
                                            </g:link>
                                        </td>

                                    </tr>
                                </g:each>
                                </tbody>

                            </table>
                        </div>
                    </div>

                      <g:if test="${productCount > params.int('max')}">
                          <div class="mt-4" aria-label="pagination">
                              <g:paginate total="${productCount ?: 0}" />
                          </div>
                      </g:if>
                  </div>
                </div>
            </section>
        </div>
    </div>
    </body>
</html>