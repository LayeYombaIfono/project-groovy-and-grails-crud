package product

class Product {

    String name
    String description
    BigDecimal price

    static constraints = {
        name  blank: false, nullable: false
        description nullable: true
        price nullable: false, min: 0.0, scale: 0
    }
}
