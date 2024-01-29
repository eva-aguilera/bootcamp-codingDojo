document.addEventListener("DOMContentLoaded", function () {
    const imageContainer = document.getElementById('image1');
    const overlay = document.getElementById('overlayText1');

    imageContainer.addEventListener('mouseover', function () {
        showOverlay(overlay);
    });

    imageContainer.addEventListener('mouseout', function () {
        hideOverlay(overlay);
    });
});

function showOverlay(overlay) {
    overlay.style.opacity = '1';
}

function hideOverlay(overlay) {
    overlay.style.opacity = '0';
}

