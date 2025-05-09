package product

import groovy.xml.MarkupBuilder


class XmlExportProductService {

    String xmlExport(Long id) {
        def product = Product.get(id)

        if (!product) {
            return "<error>Aucun produit trouvé</error>"
        }

        def writer = new StringWriter()
        def xml = new MarkupBuilder(writer)

        xml.product {
            "${'id'}"(product.id)
            "${'name'}"(product.name)
            "${'description'}"(product.description)
            "${'price'}"(product.price)
        }

        return writer.toString()
    }
}
