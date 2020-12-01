const selectSupplier = supplierElementTd => {
  const parent = supplierElementTd.closest('tr');
  const supplierName = supplierElementTd.dataset.supplier;
  const quotationProductId = supplierElementTd.dataset.quotationProductId;

  let total = 0;
  parent.querySelectorAll('p').forEach(function(item, index){
    item.classList.remove('green')
  })

  parent.querySelectorAll(`p[data-quotation-product-id='${quotationProductId}']`).forEach(function(item, index){
    item.classList.add('green');
  });

  document.querySelectorAll(`th.supplier`).forEach(function(item, index){
    const supplier = item.dataset.name;
    total += calcTotalSupplier(supplier)
  });

  document.querySelector('td.final-value').innerHTML = currency(total, { formatWithSymbol: true,
    symbol: 'R$', separator: '.', decimal: ','}).format();


  $.ajax({
    url: '/customer/preferred_quotation_product',
    contentType: 'application/json',
    data: JSON.stringify({ preferred_quotation_product: { quotation_product_id: quotationProductId} }),
    method: 'POST'
  });
}

const calcTotalSupplier = supplierName => {
  var totalValueElements = document.querySelectorAll(`p[data-supplier='${supplierName}'].total-value.green`);
  var total = 0;

  totalValueElements.forEach(function(item, index) {
    total += parseFloat(item.dataset.total);
  });

  document.querySelector(`tr.total-value-by-supplier td.${supplierName}`).innerHTML = currency(total, { formatWithSymbol: true,
    symbol: 'R$', separator: '.', decimal: ',' }).format();

  return total
}

const $quotationProductSuppliers = document.querySelectorAll('.quotation-product-supplier');
$quotationProductSuppliers.forEach(function(item, index){
  item.addEventListener('click', function(e){
    selectSupplier(e.target);
  })
});
