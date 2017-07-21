var slideIndex = 1;
var timer = null;

function startSlides() {
  showSlides(slideIndex);
}

function plusSlides(n) {
  showSlides(slideIndex += n);
}

function currentSlide(n) {
  showSlides(slideIndex = n);
}

function showSlides(n) {
    clearTimeout(timer);
    var i;
    var slides = document.getElementsByClassName("mySlides");
    var dots = document.getElementsByClassName("dot");
    if (n == undefined) { n = ++slideIndex; }
    if (n > slides.length) { slideIndex = 1; }
    if (n < 1) { slideIndex = slides.length; }
    for (i = 0; i < slides.length; i++) {
       slides[i].style.display = "none";
    }

    for (i = 0; i < dots.length; i++) {
        dots[i].className = dots[i].className.replace(" active", "");
    }
    if (typeof slides[slideIndex-1] !== 'undefined') {
      slides[slideIndex-1].style.display = "block";
    }
    if (typeof dots[slideIndex-1] !== 'undefined') {
          dots[slideIndex-1].className += " active";
    }
    timer = setTimeout(showSlides, 5000);
}
