const ready = (callback) => {
  if (document.readyState != "loading") callback();
  else document.addEventListener("DOMContentLoaded", callback);
}

ready(() => {
  document.querySelectorAll('.fix_email').forEach(elt => {
    const plain = elt.innerHTML;
    const corrected = plain.replaceAll('@test.com', '@ictects.com');
    elt.innerHTML = corrected;
  })
  
  document.querySelectorAll('.fix_telnr').forEach(elt => {
    const plain = elt.innerHTML;
    const corrected = plain.replaceAll('123 495', '495 123').replaceAll('123495', '495123');
    elt.innerHTML = corrected;
  })

  console.log('Nice try, but there\'s nothing here');
});
