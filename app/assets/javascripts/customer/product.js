const productNameField = document.querySelector('#product_name');

$('#product_id').on('change', function(event){
  const selectedText = $(this).find("option:selected").text();
  productNameField.value = selectedText
});
