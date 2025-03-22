//= require jquery3
//= require popper
//= require bootstrap

import "@hotwired/turbo-rails"
import "controllers"
import "chartkick"
import "Chart.bundle"

document.addEventListener("DOMContentLoaded", function () {
    const bookSelect = document.getElementById("book_select");
    const sellerPrice = document.getElementById("seller_price");

    bookSelect.addEventListener("change", function () {
        const selectedOption = bookSelect.options[bookSelect.selectedIndex];
        const maxMrp = selectedOption.getAttribute("data-mrp");
        sellerPrice.setAttribute("max", maxMrp);
    });
});