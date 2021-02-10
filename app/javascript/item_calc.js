window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
     const inputValue = priceInput.value;

     const addTaxDom = document.getElementById("add-tax-price");
     addTaxDom.innerHTML = `<span>${Math.floor(inputValue-(inputValue*0.9))}</span>`;

     const addProfitDom = document.getElementById("profit");
     addProfitDom.innerHTML = `<span>${Math.floor(inputValue-(inputValue*0.1))}</span>`;
  });
});

    