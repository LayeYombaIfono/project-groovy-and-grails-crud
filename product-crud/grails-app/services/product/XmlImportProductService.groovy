package product

import grails.gorm.transactions.Transactional
import groovy.xml.XmlSlurper

@Transactional
class XmlImportProductService {

    List<Product> importXml(File xmlFile){
        if (!xmlFile || !xmlFile.exists()){
            throw new IllegalArgumentException("Fichier XML introuvable ou invalide")
        }

        def parser = new XmlSlurper().parse(xmlFile)
        List<Product> importedProduct = []

        Long productId = parser.id?.text()?.loLong()

        if (productId == null){
            throw new IllegalArgumentException("ID du produit manquant dans le fichier XML")
        }

        Product existingProduct = Product.findById(productId)

        if (existingProduct){

            existingProduct.name = parser.name?.text()
            existingProduct.description = parser.description?.text()
            existingProduct.price = parser.price?.text()?.toBigDecimal()

            existingProduct.save(flush: true, failOnError:true)
            importedProduct.add(existingProduct)
        }else {
            Product newProduct = new Product(
                    id: productId,
                    name: parser.name?.text(),
                    description: parser?.description?.text(),
                    price: parser?.price?.text()?.toBigDecimal()
            )

            newProduct.save(flush:true, failOnError: true)
            importedProduct.add(newProduct)

        }
        return importedProduct

    }


/*
    def importXml(File xmlFile){
        def parser = new XmlSlurper().parse(xmlFile)
        List<Product> importedProducts = []

        def productId = parser.id.text().toLong()
        def existingProduct = Product.findById(productId)

        if (existingProduct){
           // Update the data
            existingProduct.name = parser.name.text()
            existingProduct.description = parser.description.text()
            existingProduct.price = parser.price.text().toBigDecimal()
            existingProduct.save(flush: true, failOnError: true)

            importedProducts.add(existingProduct)
        }else {
            // Created a new product
            def newProduct = new Product(
                    id: productId,
                    name: parser.name.text(),
                    description: parser.description.text(),
                    price: parser.price.text().toBigDecimal()

            )
            newProduct.save(flush: true, failOnError: true)
            importedProducts.add(newProduct)

        }

       return importedProducts

    }

 */



}
