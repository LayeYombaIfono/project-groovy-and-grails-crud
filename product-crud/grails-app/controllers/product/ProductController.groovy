package product


import grails.validation.ValidationException

import static org.springframework.http.HttpStatus.*

class ProductController {
    XmlExportProductService xmlExportProductService
    XmlImportProductService xmlImportProductService
    ProductService productService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond productService.list(params), model:[productCount: productService.count()]
    }

    def show(Long id) {
        respond productService.get(id)
    }

    def create() {
        respond new Product(params)
    }

    def save(Product product) {

        if (!product) {
            notFound()
            return
        }

        try {

            productService.save(product)

        } catch (ValidationException e) {
            respond product.errors, view:'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'product.label', default: 'Product'), product.id])
                redirect product
            }
            '*' { respond product, [status: CREATED] }
        }
    }

    def edit(Long id) {
        respond productService.get(id)
    }

    def update(Product product) {
        if (!product) {
            notFound()
            return
        }

        try {
            productService.save(product)
        } catch (ValidationException e) {
            respond product.errors, view:'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'product.label', default: 'Product'), product.id])
                redirect product
            }
            '*'{ respond product, [status: OK] }
        }
    }

    def delete(Long id) {
        if (!id) {
            notFound()
            return
        }

        productService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'product.label', default: 'Product'), id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'product.label', default: 'Product'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }

    // Method to export in xml format
    def exportXml(Long id) {
        String xmlContent = xmlExportProductService.xmlExport(id)

        response.setHeader("Content-Disposition", "attachment; filename=product-${id}.xml")
        render text: xmlContent, contentType: "application/xml", encoding: "UTF-8"
    }

    // Method to import in xml format
    def importXml(){
        def file = request.getFile('xmlFile')

        if (file?.empty){
            flash.message = "Le fichier XML est vide!"
            redirect action: "create"
            return
        }

        try {
           File tempFile = File.createTempFile("upload-", ".xml")
            file.transferTo(tempFile)

            def products = xmlImportProductService.importXml(tempFile)

            if (products){
                flash.message = "Produit importé avec succès"
                redirect action: "edit", id: products[0].id

            }else {
                flash.message = "Aucun produit importé."
                redirect action: "create"
            }

        }catch (Exception e){
            flash.message = "Erreur pendant l'import : ${e.message}"
            redirect action: "create"
        }
    }

}
