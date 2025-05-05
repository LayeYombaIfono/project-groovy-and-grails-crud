package product

class Product {

    String name
    String description
    BigDecimal price

    static constraints = {
        name blank: false
        description nullable: true
        price nullable: false, min: 0.0
    }
}
