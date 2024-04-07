// app/javscript/packs/trix_customs.js

document.addEventListener('trix-initialize', function(event) {
  const toolbar = event.target.toolbarElement;
  
  // Customize Bold button
  const boldButton = toolbar.querySelector('[data-trix-attribute="bold"]');
  boldButton.innerHTML = '<i class="fa-solid fa-bold"></i>';

  // Customize Italic button
  const italicButton = toolbar.querySelector('[data-trix-attribute="italic"]');
  italicButton.innerHTML = '<i class="fa-solid fa-italic"></i>';

  // Customize strikethrough button
  const strikethroughButton = toolbar.querySelector('[data-trix-attribute="strike"]');
  strikethroughButton.innerHTML = '<i class="fa-solid fa-strikethrough"></i>';
  
  // Customize link button
  const linkButton = toolbar.querySelector('[data-trix-attribute="href"]');
  linkButton.innerHTML = '<i class="fa-solid fa-link"></i>';

  // Customize heading button
  const heading1Button = toolbar.querySelector('[data-trix-attribute="heading1"]');
  heading1Button.innerHTML = '<i class="fa-solid fa-heading"></i>';

  // Customize qoute button
  const quoteButton = toolbar.querySelector('[data-trix-attribute="quote"]');
  quoteButton.innerHTML = '<i class="fa-solid fa-quote-left"></i>';

  // Customize code button
  const codeButton = toolbar.querySelector('[data-trix-attribute="code"]');
  codeButton.innerHTML = '<i class="fa-solid fa-code"></i>';

  // Customize bullet button
  const bulletButton = toolbar.querySelector('[data-trix-attribute="bullet"]');
  bulletButton.innerHTML = '<i class="fa-solid fa-list"></i>';

  // Customize number button
  const numberButton = toolbar.querySelector('[data-trix-attribute="number"]');
  numberButton.innerHTML = '<i class="fa-solid fa-list-ol"></i>';

  // Customize decrease nesting level button
  const decreaseNestingLevelButton = toolbar.querySelector('[data-trix-action="decreaseNestingLevel"]');
  decreaseNestingLevelButton.innerHTML = '<i class="fa-solid fa-outdent"></i>';

  // Customize increase nesting level button
  const increaseNestingLevelButton = toolbar.querySelector('[data-trix-action="increaseNestingLevel"]');
  increaseNestingLevelButton.innerHTML = '<i class="fa-solid fa-indent"></i>';

  // Customize file tools button
  const fileToolsButton = toolbar.querySelector('[data-trix-action="attachFiles"]');
  fileToolsButton.innerHTML = '<i class="fa-solid fa-paperclip"></i>';

  // Customize undo button
  const undoButton = toolbar.querySelector('[data-trix-action="undo"]');
  undoButton.innerHTML = '<i class="fa-solid fa-rotate-left"></i>';

  // Customize redo button
  const redoButton = toolbar.querySelector('[data-trix-action="redo"]');
  redoButton.innerHTML = '<i class="fa-solid fa-rotate-right"></i>';
  
});


