import flatpickr from "flatpickr"
require("flatpickr/dist/flatpickr.min.css")

document.addEventListener("turbolinks:load", () => {
    flatpickr("[data-behavior='flatpickr']", {
        enableTime: true,
        time_24hr: true,
        // dateFormat: "Y-m-d",
        // minDate: new Date(),
    })
})
