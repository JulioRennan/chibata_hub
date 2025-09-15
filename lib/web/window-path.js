const f = () => {
  if (document.location.href.includes('/#')) {
    document.location.href = document.location.href.replace('/#', '');
  }
}
f();
window.addEventListener('popstate', function (event) {
  f();
});