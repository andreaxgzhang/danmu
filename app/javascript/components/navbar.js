function initUpdateNavbarOnScroll() {
  const navbar = document.querySelector('.navbar-landing');
  const text = document.querySelector('navbar-wagon-item')
  if (navbar) {
    window.addEventListener('scroll', () => {
      if (window.scrollY >= window.innerHeight) {
        navbar.classList.add('navbar-landing-white');
        text.classList.add('navbar-wagon-link');
        text.classList.remove('navbar-landing-link')
      } else {
        navbar.classList.remove('navbar-landing-white');
        text.classList.remove('navbar-wagon-link');
        text.classList.add('navbar-landing-white');
      }
    });
  }
}

export { initUpdateNavbarOnScroll };
