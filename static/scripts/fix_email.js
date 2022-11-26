const ready = (callback) => {
  if (document.readyState != "loading") callback();
  else document.addEventListener("DOMContentLoaded", callback);
}

ready(() => {
  document.querySelectorAll('.fix_email').forEach(span => {
    const plain = span.innerHTML;
    const corrected = plain.replace('@test.com', '@ictects.com');
    span.innerHTML = corrected;
  })
});
