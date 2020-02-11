function initMenuCollaps() {
    $('#sidebarCollapse').on('click', function () {
        $('#sidebar').toggleClass('active');
    });
}

document.addEventListener("turbolinks:load", () => {
    initMenuCollaps()
});
