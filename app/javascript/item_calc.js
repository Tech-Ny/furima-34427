window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
     const inputValue = priceInput.value;
     console.log(inputValue);

     const addTaxDom = document.getElementById("add-tax-price");
     addTaxDom.innerHTML = `<span>${inputValue-(inputValue*0.9)}</span>`;

     const addProfitDom = document.getElementById("profit");
     addProfitDom.innerHTML = `<span>${inputValue-(inputValue*0.1)}</span>`;
  });
});

    