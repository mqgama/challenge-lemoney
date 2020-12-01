let $cartProductQuantity = $('#cart_product_quantity');

$('.edit-cart-product').on('click', function(e){
  e.preventDefault();

  showElement($(this))
});

function showElement(element) {
  const trElement = element.closest('tr');
  const form = $(trElement).find('form');
  const badge = $(trElement).find('.badge');

  $(form).show();
  $(badge).hide();
  $(form).find('#cart_product_quantity').focus();
}


$select2Remote.on('select2:select', function(e){
  if ($cartProductQuantity)
    $cartProductQuantity.focus();
})
