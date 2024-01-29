document.addEventListener("DOMContentLoaded", function () {
    const carrusel = document.querySelector(".carrusel");
    const slides = document.querySelectorAll(".slide");
    let index = 0;

    function nextSlide() {
        index = (index + 1) % slides.length;
        updateSlide();
    }

    function updateSlide() {
        const newTransformValue = -index * 100 + "%";
        carrusel.style.transform = `translateX(${newTransformValue})`;
    }

    setInterval(nextSlide, 5000); // Cambia de slide cada 5 segundos
});


document.addEventListener("DOMContentLoaded", function () {
    window.addEventListener('scroll', function () {
        if (window.scrollY > 100) {
            setTimeout(function() {
                document.body.classList.add('scrolled-bg');
            }, 1000);  // 1000 milisegundos (1 segundos)
        } else {
            document.body.classList.remove('scrolled-bg');
        }
    });
});

document.addEventListener("DOMContentLoaded", function () {
    const mainFooter = document.querySelector('.Main-footer');

    mainFooter.addEventListener('mouseover', function () {
        mainFooter.classList.add('hover-effect');
    });

    mainFooter.addEventListener('mouseout', function () {
        mainFooter.classList.remove('hover-effect');
    });
});


document.addEventListener("DOMContentLoaded", function () {
    const imageContainers = document.querySelectorAll('.image-container');

    imageContainers.forEach(function (container) {
        container.addEventListener('mouseover', function () {
            showOverlay(container);
        });

        container.addEventListener('mouseout', function () {
            hideOverlay(container);
        });
    });
});

function showOverlay(container) {
    const overlay = container.querySelector('.overlay');
    overlay.style.transform = 'translateY(0)';
}

function hideOverlay(container) {
    const overlay = container.querySelector('.overlay');
    overlay.style.transform = 'translateY(100%)';
}




