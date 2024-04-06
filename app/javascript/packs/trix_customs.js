// app/javscript/packs/trix_customs.js

document.addEventListener('trix-initialize', function(event) {
  const toolbar = event.target.toolbarElement;
  
  // Customize Bold button
  const boldButton = toolbar.querySelector('[data-trix-attribute="bold"]');
  boldButton.innerHTML = '<i class="fa-solid fa-bold"></i>';

  // Customize Italic button
  // const italicButton = toolbar.querySelector('[data-trix-attribute="italic"]');
  // italicButton.innerHTML = '<i class="fa-solid fa-cloud"></i>';
  
  // You can customize other toolbar buttons in a similar manner
  
});


