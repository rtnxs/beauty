function initMenuCollaps() {
    $('#sidebarCollapse').on('click', function () {
        $('#sidebar').toggleClass('active');
    });
}

$(window).on('turbolinks:load', () => {
    $(document).ready(initMenuCollaps())
});
