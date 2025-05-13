window.addEventListener('DOMContentLoaded', () => {
    const priceInput = document.getElementById('price');
    console.log(priceInput)

    if (priceInput) {
        priceInput.addEventListener('keypress', isNumberKey);
        priceInput.addEventListener('paste', (e) => e.preventDefault());
    }
});

function isNumberKey(evt) {
    const charCode = evt.which ? evt.which : evt.keyCode;
    const input = evt.target;
    const charTyped = String.fromCharCode(charCode);

    // Autorise chiffres et un seul point décimal
    if (charTyped === '.' && input.value.includes('.')) {
        return false;
    }

    // Bloque tout ce qui n’est pas chiffre ou point
    return /[0-9.]$/.test(charTyped);
}


